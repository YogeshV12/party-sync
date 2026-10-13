import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../core/clock_sync.dart';
import '../core/join_info.dart';
import '../core/mulaw.dart';
import '../core/protocol.dart';
import '../core/util.dart';
import '../platform/audio_backend.dart';
import '../platform/net_backend.dart';
import 'downstream_server.dart';
import 'udp.dart';

enum SessionRole { host, listener }

enum SessionPhase {
  idle,
  starting,
  joiningWifi,
  discovering,
  syncing,
  live,
  reconnecting,

  /// The host stopped the session on purpose. Not a failure, so no retrying.
  ended,
  error,
}

enum HostNetworkMode {
  /// Android creates its own network (Wi-Fi Direct group); no setup needed.
  appNetwork,

  /// The user turns on the phone's normal hotspot and tells us its name.
  phoneHotspot,
}

class SessionError implements Exception {
  const SessionError(this.message);
  final String message;

  @override
  String toString() => message;
}

String describeError(Object e) => switch (e) {
      SessionError(:final message) => message,
      PlatformException(:final message, :final code) => message ?? code,
      SocketException(:final message) => 'Network error: $message',
      _ => e.toString(),
    };

class SessionConfig {
  static const sampleRate = 16000;
  static const frameSamples = 320; // 20 ms
  static const maxDepth = 3;
  static const defaultSyncDelayMs = 350;
  static const lostAfterUs = 4000000;
}

/// Runs one phone's part of a session.
///
/// Host: mic → µ-law → UDP to every connected phone, each packet stamped with
/// the host-clock time it should play.
/// Listener: finds its parent (host or relay), syncs its clock to the host
/// through the parent, and hands audio to the native engine to play on time.
/// Relay: a listener that also serves children, forwarding packets untouched
/// and answering clock pings in host time, so depth doesn't break sync.
class SessionEngine extends ChangeNotifier {
  SessionEngine({
    required this.audio,
    required this.net,
    this.serverPort = JoinInfo.defaultPort,
    String? nodeId,
  }) : nodeId = nodeId ?? randomId();

  final AudioBackend audio;
  final NetBackend net;

  /// UDP port this phone serves children on (as host or relay).
  final int serverPort;
  final String nodeId;

  String displayName = 'Phone';
  DeviceCaps caps = DeviceCaps.unknown;

  SessionRole? role;
  SessionPhase phase = SessionPhase.idle;
  String? error;
  String? notice;

  int sessionId = 0;
  String sessionName = '';
  int depth = 0;

  /// Node ids from the host down to this phone's parent.
  List<String> path = const [];
  int maxDepth = SessionConfig.maxDepth;

  // ---- Host --------------------------------------------------------------
  HostNetworkMode? hostMode;
  JoinInfo? hostJoin;
  bool muted = false;
  int syncDelayMs = SessionConfig.defaultSyncDelayMs;
  final ValueNotifier<double> micLevel = ValueNotifier(0);
  final Map<String, NodeStatus> nodes = {};
  final CaptureClock _captureClock = CaptureClock(SessionConfig.sampleRate);
  StreamSubscription<CaptureFrame>? _captureSub;
  int _audioSeq = 0;

  // ---- Listener ----------------------------------------------------------
  JoinInfo? upstreamJoin;
  UdpEndpoint? _upstream;
  StreamSubscription<ReceivedDatagram>? _upstreamSub;
  InternetAddress? _parentAddress;
  int _parentPort = 0;
  String? parentId;
  String parentName = '';
  final ClockSync clock = ClockSync();
  Completer<bool>? _discovery;
  int _pingSeq = 0;
  int _lastRxUs = 0;
  int _lastAudioRxUs = 0;
  int _lastAudioSeq = -1;
  int _windowReceived = 0;
  int _windowLost = 0;
  int _windowStartUs = 0;
  double lossPct = 0;
  int _windowPushed = 0;
  int _tickPushed = 0;

  /// Seconds in a row that audio arrived but the buffer stayed empty.
  int starvingTicks = 0;
  int _windowPeak = 0;
  int _lastLeadUs = 0;
  PlaybackStats playback = PlaybackStats.empty;
  double outputOffsetMs = 0;
  List<EntryPoint> alternatives = const [];

  // ---- Relay -------------------------------------------------------------
  bool relaying = false;
  bool relayBusy = false;
  JoinInfo? relayJoin;
  String? relayError;

  DownstreamServer? _server;
  bool _ownsNetwork = false;
  int? _battery;
  int _batteryReadUs = 0;
  final List<Timer> _timers = [];
  Timer? _notifyTimer;
  int _generation = 0;
  bool _disposed = false;

  /// Connected, but no audio is coming in: what a muted host looks like (a muted
  /// host keeps answering clock pings, it just stops sending audio).
  bool get hostMuted =>
      phase == SessionPhase.live &&
      nowUs() - _lastRxUs < 2500000 &&
      nowUs() - _lastAudioRxUs > 1500000;

  int get childCount => _server?.children.length ?? 0;
  int get listenerCount => nodes.length - (nodes.containsKey(nodeId) ? 1 : 0);
  bool get canRelayHere => caps.canRelay && depth < maxDepth;

  /// Host sync delay (ms) this speaker needs, or null if it's keeping up. A
  /// Bluetooth speaker can take longer to play a chunk than the host's delay
  /// gives it, so the chunk is always late and the buffer stays empty even
  /// though audio is arriving. A muted host also leaves the buffer empty.
  int? get neededSyncDelayMs {
    // A few seconds, not one: the buffer is briefly empty when the host unmutes.
    if (phase != SessionPhase.live || starvingTicks < 3) return null;
    if (playback.outputLatencyMs <= 0 || playback.bufferedMs >= 40) return null;
    return ((playback.outputLatencyMs + 200) / 50).ceil() * 50;
  }

  // ========================================================================
  // Host
  // ========================================================================

  Future<void> startHost({
    required String name,
    required HostNetworkMode mode,
    String ssid = '',
    String password = '',
    bool voiceProcessing = true,
  }) async {
    await stop();
    final gen = _generation;
    role = SessionRole.host;
    phase = SessionPhase.starting;
    hostMode = mode;
    sessionName = name;
    sessionId = randomSessionId();
    depth = 0;
    path = const [];
    _notify();

    try {
      final perms = await net.requestPermissions({
        AppPermission.microphone,
        AppPermission.notifications,
        if (mode == HostNetworkMode.appNetwork) AppPermission.wifi,
      });
      trace('host start mode=$mode perms=$perms');
      if (perms[AppPermission.microphone] != true) {
        throw const SessionError('Microphone access is needed to be the mic.');
      }
      if (mode == HostNetworkMode.appNetwork && perms[AppPermission.wifi] != true) {
        throw const SessionError(
            'Allow "Nearby devices" so the app can create a network.');
      }

      var join = JoinInfo(
        ssid: ssid,
        password: password,
        port: serverPort,
        sessionName: name,
        sessionId: sessionId,
      );
      if (mode == HostNetworkMode.appNetwork) {
        final hosted = await net.createNetwork(
            name: groupNetworkName(displayName), password: randomPassword());
        _ownsNetwork = true;
        join = join.copyWith(
            ssid: hosted.ssid, password: hosted.password, hosts: [hosted.ip]);
      } else {
        join = join.copyWith(hosts: await localLanAddresses());
      }
      if (gen != _generation) return;
      hostJoin = join;
      trace('host join info: ssid=${join.ssid} hosts=${join.hosts} port=${join.port}');
      _updateHotspotNotice();

      await _startServer(
        hostNowUs: nowUs,
        rejectReason: (j) => j.id == nodeId ? 'self' : null,
        onStatus: (_, status) => _recordNode(status),
      );
      trace('host server listening on :$serverPort');
      unawaited(_primeLocalNetworkAccess());

      _captureClock.reset();
      _captureSub = audio.captureFrames.listen(_onCaptureFrame);
      await audio.startCapture(
        sampleRate: SessionConfig.sampleRate,
        frameSamples: SessionConfig.frameSamples,
        voiceProcessing: voiceProcessing,
      );
      await net.startKeepAlive(microphone: true, text: 'Hosting "$name"');
      if (gen != _generation) return;

      _every(const Duration(seconds: 3), _broadcastNetmap);
      _every(const Duration(seconds: 2), _hostHousekeeping);
      phase = SessionPhase.live;
      unawaited(_hostHousekeeping());
    } catch (e) {
      if (gen != _generation) return;
      trace('host start FAILED: $e');
      await _fail(e);
    }
    _notify();
  }

  void setMuted(bool value) {
    muted = value;
    if (value) micLevel.value = 0;
    _notify();
  }

  /// How far ahead of the mic every speaker plays. Larger survives worse
  /// Wi-Fi and slower Bluetooth speakers; smaller sounds more "live".
  void setSyncDelay(int ms) {
    syncDelayMs = ms.clamp(120, 1500);
    _notify();
  }

  void _onCaptureFrame(CaptureFrame frame) {
    micLevel.value = muted ? 0 : _levelOf(frame.pcm, micLevel.value);
    final playAt = _captureClock.map(frame.sampleIndex, frame.captureWallUs) +
        syncDelayMs * 1000;
    final server = _server;
    if (server == null || muted || server.children.isEmpty) return;
    final packet = AudioPacket(
      sessionId: sessionId,
      seq: _audioSeq++,
      firstSample: frame.sampleIndex,
      playAtHostUs: playAt,
      sampleRate: SessionConfig.sampleRate,
      codec: AudioCodec.mulaw,
      sampleCount: frame.pcm.length,
      payload: MuLaw.encode(frame.pcm),
    );
    server.broadcast(packet.encode());
  }

  static double _levelOf(Int16List pcm, double previous) {
    var sum = 0.0;
    for (final s in pcm) {
      sum += s * s;
    }
    final rms = math.sqrt(sum / math.max(1, pcm.length));
    final db = 20 * math.log(math.max(rms, 1) / 32768) / math.ln10;
    final level = ((db + 60) / 60).clamp(0.0, 1.0);
    return level > previous ? level : previous * 0.8 + level * 0.2;
  }

  void _recordNode(NodeStatus status) {
    status.seenUs = nowUs();
    nodes[status.id] = status;
    _scheduleNotify();
  }

  Future<void> _hostHousekeeping() async {
    if (role != SessionRole.host) return;
    final cutoff = nowUs() - 8000000;
    nodes.removeWhere((id, n) => id != nodeId && n.seenUs < cutoff);
    await _refreshBattery();
    if (hostMode == HostNetworkMode.phoneHotspot && hostJoin != null) {
      final hosts = await localLanAddresses();
      if (hostJoin != null && !listEquals(hosts, hostJoin!.hosts)) {
        hostJoin = hostJoin!.copyWith(hosts: hosts);
        _updateHotspotNotice();
      }
    }
    if (role != SessionRole.host) return;
    nodes[nodeId] = NodeStatus(
      id: nodeId,
      parentId: null,
      name: displayName,
      role: 'host',
      platform: caps.platform,
      depth: 0,
      battery: _battery,
      children: childCount,
    );
    _notify();
  }

  void _broadcastNetmap() {
    final server = _server;
    final join = hostJoin;
    if (server == null) return;
    final entries = <EntryPoint>[
      if (join != null && join.ssid.isNotEmpty)
        EntryPoint(
          id: nodeId,
          name: displayName,
          depth: 0,
          ssid: join.ssid,
          password: join.password,
          hosts: join.hosts,
          port: join.port,
          children: childCount,
        ),
      for (final n in nodes.values)
        if (n.relay != null) n.relay!,
    ];
    server.broadcast(encodeNetmap(sessionId, entries));
  }

  void _updateHotspotNotice() {
    final join = hostJoin;
    if (hostMode == HostNetworkMode.phoneHotspot && join != null && join.hosts.isEmpty) {
      notice = "Your hotspot isn't on yet. Turn it on and the QR code updates by itself.";
    } else if (notice?.startsWith('Your hotspot') ?? false) {
      notice = null;
    }
  }

  /// iOS asks for Local Network permission on the first local packet; send a
  /// harmless one now so the prompt appears while the host is looking.
  Future<void> _primeLocalNetworkAccess() async {
    final server = _server;
    if (server == null) return;
    for (final h in await discoveryCandidates(const [])) {
      server.endpoint.send(Uint8List(1), InternetAddress(h), serverPort);
    }
  }

  // ========================================================================
  // Listener
  // ========================================================================

  Future<void> joinSession(JoinInfo info, {bool alreadyOnWifi = false}) async {
    await stop();
    final gen = _generation;
    role = SessionRole.listener;
    phase = SessionPhase.starting;
    upstreamJoin = info;
    sessionName = info.sessionName;
    sessionId = info.sessionId ?? 0;
    trace('join: ssid=${info.ssid} hosts=${info.hosts} port=${info.port} alreadyOnWifi=$alreadyOnWifi');
    _notify();

    try {
      await net.requestPermissions({
        AppPermission.notifications,
        if (caps.canRelay) AppPermission.wifi,
      });
      await audio.startPlayback(
        sampleRate: SessionConfig.sampleRate,
        frameSamples: SessionConfig.frameSamples,
      );
      await audio.setOutputOffsetMs(outputOffsetMs);
      if (gen != _generation) return;
      await _connectUpstream(info,
          joinWifi: !alreadyOnWifi && info.ssid.isNotEmpty, gen: gen);
      if (gen != _generation) return;
      await net.startKeepAlive(microphone: false, text: 'Playing "$sessionName"');
      _windowStartUs = nowUs();
      _every(const Duration(milliseconds: 500), _pollPlayback);
      _every(const Duration(seconds: 1), _listenerTick);
      _every(const Duration(seconds: 2), _sendStatus);
    } catch (e) {
      if (gen != _generation) return;
      trace('join FAILED: $e');
      await _fail(e);
    }
    _notify();
  }

  Future<void> setOutputOffset(double ms) async {
    outputOffsetMs = ms;
    _notify();
    try {
      await audio.setOutputOffsetMs(ms);
    } catch (_) {}
  }

  /// One-tap failover to another relay (or the host) from the network map.
  Future<void> switchTo(EntryPoint entry) => _reconnect(JoinInfo(
        ssid: entry.ssid,
        password: entry.password,
        hosts: entry.hosts,
        port: entry.port,
        sessionName: sessionName,
        sessionId: sessionId,
      ));

  Future<void> retryConnection() async {
    final info = upstreamJoin;
    if (info != null) await _reconnect(info);
  }

  Future<void> _reconnect(JoinInfo info) async {
    if (role != SessionRole.listener) return;
    final gen = _generation;
    upstreamJoin = info;
    notice = null;
    _parentAddress = null;
    try {
      await _connectUpstream(info, joinWifi: info.ssid.isNotEmpty, gen: gen);
    } catch (e) {
      if (gen != _generation) return;
      phase = SessionPhase.reconnecting;
      notice = describeError(e);
    }
    _notify();
  }

  Future<void> _connectUpstream(JoinInfo info,
      {required bool joinWifi, required int gen}) async {
    if (joinWifi) {
      if (!isValidWifiPassword(info.password)) {
        throw SessionError(
            'The Wi-Fi password in this code is ${info.password.length} characters, '
            'but Wi-Fi passwords are 8-63. The host probably mistyped it: ask them '
            'to re-enter it, or join "${info.ssid}" in your Wi-Fi settings and tap '
            '"I\'m already on the host\'s Wi-Fi".');
      }
      // Already on the host's Wi-Fi (joined by hand in Settings)? Then there is
      // nothing to join, and asking the OS for a network by name could fail.
      phase = SessionPhase.discovering;
      _notify();
      if (await _discoverUpstream(info, gen, window: const Duration(seconds: 3))) {
        trace('host already reachable on the current network');
        return;
      }
      if (gen != _generation) return;
      phase = SessionPhase.joiningWifi;
      _notify();
      trace('joining wifi "${info.ssid}"...');
      await net.joinWifi(info.ssid, info.password);
      trace('wifi joined');
      if (gen != _generation) return;
    }
    phase = SessionPhase.discovering;
    _notify();

    if (!await _discoverUpstream(info, gen)) {
      if (gen != _generation) return;
      throw const SessionError(
          "Couldn't find the host on this Wi-Fi. Check the host is live and "
          'that you joined the right network.');
    }
  }

  /// Opens the upstream socket on the Wi-Fi and looks for the parent for up to
  /// [window]. Leaves the socket open on success; closes it otherwise.
  Future<bool> _discoverUpstream(JoinInfo info, int gen,
      {Duration window = const Duration(seconds: 15)}) async {
    _closeUpstream();
    final socket = await net.withUpstreamBinding(
        () => RawDatagramSocket.bind(InternetAddress.anyIPv4, 0));
    final endpoint = UdpEndpoint(socket);
    trace('upstream socket bound on :${socket.port}, local=${await localLanAddresses()}');
    if (gen != _generation) {
      endpoint.close();
      return false;
    }
    _upstream = endpoint;
    _upstreamSub = endpoint.datagrams.listen(_onUpstream);
    if (await _discover(endpoint, info, window)) return true;
    if (identical(_upstream, endpoint)) _closeUpstream();
    return false;
  }

  Future<bool> _discover(UdpEndpoint endpoint, JoinInfo info, Duration window) async {
    final discovery = _discovery = Completer<bool>();
    final deadline = nowUs() + window.inMicroseconds;
    var candidates = <String>[];
    var sweep = <String>[];
    for (var round = 0; !discovery.isCompleted && nowUs() < deadline; round++) {
      // Addresses appear a moment after the OS finishes joining Wi-Fi.
      if (round % 4 == 0) {
        candidates = await discoveryCandidates(info.hosts);
        sweep = await subnetSweepTargets();
        trace('discover round $round: candidates=$candidates sweep=${sweep.length} port=${info.port}');
      }
      final join = _joinMsg().encode();
      for (final h in candidates) {
        endpoint.send(join, InternetAddress(h), info.port);
      }
      // Hotspot with an unusual gateway address: ask every neighbour.
      if (round >= 6 && round % 4 == 2) {
        for (final h in sweep) {
          endpoint.send(join, InternetAddress(h), info.port);
        }
      }
      await Future.any<void>([
        discovery.future,
        Future<void>.delayed(const Duration(milliseconds: 500)),
      ]);
    }
    if (identical(_discovery, discovery)) _discovery = null;
    return discovery.isCompleted && await discovery.future;
  }

  JoinMsg _joinMsg() => JoinMsg(
      id: nodeId, name: displayName, platform: caps.platform, sessionId: sessionId);

  bool _fromParent(ReceivedDatagram d) =>
      _parentAddress != null && d.address == _parentAddress && d.port == _parentPort;

  void _onUpstream(ReceivedDatagram d) {
    final type = peekType(d.data);
    if (type != MsgType.audio && type != MsgType.pong) {
      trace('upstream rx $type from ${d.address.address}:${d.port} (${d.data.length}B)');
    }
    switch (peekType(d.data)) {
      case MsgType.audio:
        _onAudio(d);
      case MsgType.pong:
        _onPong(d);
      case MsgType.welcome:
        _onWelcome(d);
      case MsgType.netmap:
        _onNetmap(d);
      case MsgType.reject:
        _onReject(d);
      case MsgType.end:
        _onEnd(d);
      default:
        break;
    }
  }

  void _onWelcome(ReceivedDatagram d) {
    final body = decodeJsonBody(d.data);
    if (body == null) return;
    final welcome = WelcomeMsg.fromJson(body);
    final searching = _discovery != null || phase == SessionPhase.reconnecting;
    if (!searching && !_fromParent(d)) return;
    if (welcome.path.contains(nodeId)) return; // would loop through ourselves

    _parentAddress = d.address;
    _parentPort = d.port;
    parentId = welcome.senderId;
    parentName = welcome.senderName;
    depth = welcome.senderDepth + 1;
    path = welcome.path;
    maxDepth = welcome.maxDepth;
    if (welcome.sessionId != sessionId) {
      // A new host session has a different clock and sample counter.
      sessionId = welcome.sessionId;
      clock.reset();
      _lastAudioSeq = -1;
    }
    sessionName = welcome.sessionName;
    _lastRxUs = d.rxUs;
    if (_lastAudioRxUs == 0) _lastAudioRxUs = d.rxUs;
    phase = clock.isSynced ? SessionPhase.live : SessionPhase.syncing;
    notice = null;
    for (var i = 0; i < 6; i++) {
      Timer(Duration(milliseconds: 80 * i), _sendPing);
    }
    final discovery = _discovery;
    if (discovery != null && !discovery.isCompleted) discovery.complete(true);
    _notify();
  }

  void _onPong(ReceivedDatagram d) {
    if (!_fromParent(d)) return;
    final pong = PongPacket.decode(d.data);
    if (pong == null || pong.sessionId != sessionId) return;
    clock.addSample(pong.t1, pong.t2, pong.t3, d.rxUs);
    _lastRxUs = d.rxUs;
    if (phase == SessionPhase.syncing && clock.isSynced) {
      phase = SessionPhase.live;
      _notify();
    }
  }

  void _onAudio(ReceivedDatagram d) {
    if (!_fromParent(d)) return;
    final packet = AudioPacket.decode(d.data);
    if (packet == null || packet.sessionId != sessionId) return;
    _lastRxUs = d.rxUs;
    _lastAudioRxUs = d.rxUs;
    // Forward before decoding so children aren't delayed by our own work.
    if (relaying) _server?.broadcast(d.data);
    _trackLoss(packet.seq);

    final offset = clock.offsetUs;
    if (offset == null || !clock.isSynced) return;
    final pcm = packet.codec == AudioCodec.mulaw
        ? MuLaw.decode(packet.payload)
        : _pcm16(packet.payload);
    _windowPushed++;
    _tickPushed++;
    _lastLeadUs = packet.playAtHostUs - offset - nowUs();
    for (final s in pcm) {
      if (s.abs() > _windowPeak) _windowPeak = s.abs();
    }
    audio.push(packet.firstSample, packet.playAtHostUs - offset, pcm);
  }

  static Int16List _pcm16(Uint8List bytes) {
    final b = ByteData.sublistView(bytes);
    return Int16List.fromList([
      for (var i = 0; i + 1 < bytes.length; i += 2) b.getInt16(i, Endian.little),
    ]);
  }

  void _trackLoss(int seq) {
    if (_lastAudioSeq >= 0) {
      final gap = (seq - _lastAudioSeq) & 0xFFFFFFFF;
      if (gap == 0 || gap > 0x7FFFFFFF) return; // duplicate or reordered
      if (gap < 500) _windowLost += gap - 1;
    }
    _lastAudioSeq = seq;
    _windowReceived++;
  }

  void _onNetmap(ReceivedDatagram d) {
    if (!_fromParent(d)) return;
    final body = decodeJsonBody(d.data);
    if (body == null || (body['sid'] as num?)?.toInt() != sessionId) return;
    if (relaying) _server?.broadcast(d.data);
    alternatives = [
      for (final e in decodeNetmap(body))
        if (e.id != nodeId && e.id != parentId && !e.path.contains(nodeId)) e,
    ];
    _scheduleNotify();
  }

  void _onReject(ReceivedDatagram d) {
    final reason = decodeJsonBody(d.data)?['reason'] as String? ?? '';
    if (reason == 'rejoin' && _fromParent(d)) {
      _sendToParent(_joinMsg().encode());
    } else if (reason != 'self' && _discovery != null) {
      notice = 'Found a phone that said: $reason';
      _scheduleNotify();
    }
  }

  void _onEnd(ReceivedDatagram d) {
    if (!_fromParent(d) || phase == SessionPhase.ended) return;
    if ((decodeJsonBody(d.data)?['sid'] as num?)?.toInt() != sessionId) return;
    unawaited(_endSession());
  }

  /// The host (or the relay we hang off) says the session is over. Pass it down
  /// first, then leave quietly: once the host's network disappears the OS
  /// switches this phone to another Wi-Fi or mobile data, and that must not
  /// read as a lost connection.
  Future<void> _endSession() async {
    final gen = _generation;
    trace('session ended by host');
    phase = SessionPhase.ended;
    notice = null;
    _notify();
    await _announceEnd();
    if (gen != _generation) return;
    await _teardown();
    _notify();
  }

  /// Tells every phone below us the session is over. Sent a few times because
  /// UDP drops packets, and given a moment to leave before our network goes.
  Future<void> _announceEnd() async {
    final server = _server;
    if (server == null || server.children.isEmpty) return;
    final end = encodeJson(MsgType.end, {'sid': sessionId});
    for (var i = 0; i < 3; i++) {
      server.broadcast(end);
      await Future<void>.delayed(const Duration(milliseconds: 60));
    }
  }

  void _sendToParent(Uint8List data) {
    final endpoint = _upstream;
    final address = _parentAddress;
    if (endpoint != null && address != null) endpoint.send(data, address, _parentPort);
  }

  void _sendPing() => _sendToParent(PingPacket(sessionId, _pingSeq++, nowUs()).encode());

  void _listenerTick() {
    final starving = _tickPushed > 0 && playback.bufferedMs < 40;
    starvingTicks = starving ? starvingTicks + 1 : 0;
    _tickPushed = 0;
    _sendPing();
    final silentUs = nowUs() - _lastRxUs;
    if ((phase == SessionPhase.live || phase == SessionPhase.syncing) &&
        _parentAddress != null &&
        silentUs > SessionConfig.lostAfterUs) {
      phase = SessionPhase.reconnecting;
      notice = 'Lost ${parentName.isEmpty ? 'the host' : parentName}. '
          'Trying again, or pick another network below.';
      _notify();
    } else if (phase == SessionPhase.reconnecting && _parentAddress != null) {
      if (silentUs < 1500000) {
        phase = clock.isSynced ? SessionPhase.live : SessionPhase.syncing;
        notice = null;
        _notify();
      } else {
        _sendToParent(_joinMsg().encode());
      }
    }
    if (nowUs() - _windowStartUs > 5000000) {
      trace('audio: rx=$_windowReceived lost=$_windowLost pushed=$_windowPushed '
          'peak=$_windowPeak synced=${clock.isSynced} lead=${_lastLeadUs ~/ 1000}ms '
          'buf=${playback.bufferedMs.round()}ms starved=${playback.starvedMs.round()}ms '
          'lostMs=${playback.lostMs.round()} err=${playback.syncErrorMs.toStringAsFixed(1)}ms '
          'resyncs=${playback.resyncs} latency=${playback.outputLatencyMs.round()}ms '
          'route="${playback.route}" (${playback.routeKind})');
      _windowPushed = 0;
      _windowPeak = 0;
      final total = _windowLost + _windowReceived;
      lossPct = total == 0 ? 0 : _windowLost * 100 / total;
      _windowLost = 0;
      _windowReceived = 0;
      _windowStartUs = nowUs();
    }
  }

  Future<void> _pollPlayback() async {
    final gen = _generation;
    try {
      final stats = await audio.stats();
      if (gen != _generation) return;
      playback = stats;
      _notify();
    } catch (_) {}
  }

  Future<void> _sendStatus() async {
    if (_parentAddress == null) return;
    await _refreshBattery();
    final status = NodeStatus(
      id: nodeId,
      parentId: parentId,
      name: displayName,
      role: relaying ? 'relay' : 'listener',
      platform: caps.platform,
      depth: depth,
      battery: _battery,
      bufferMs: playback.bufferedMs,
      lossPct: lossPct,
      rttMs: clock.bestRttUs == null ? null : clock.bestRttUs! / 1000,
      route: playback.route.isEmpty ? null : playback.route,
      children: childCount,
      relay: relaying ? _relayEntry() : null,
    );
    _sendToParent(status.encode());
  }

  // ========================================================================
  // Relay
  // ========================================================================

  Future<void> setRelaying(bool enable) async {
    if (role != SessionRole.listener || relayBusy || enable == relaying) return;
    final gen = _generation;
    relayBusy = true;
    relayError = null;
    _notify();
    try {
      if (enable) {
        if (!caps.canRelay) {
          throw const SessionError(
              'Sharing needs an Android phone with Wi-Fi Direct.');
        }
        if (depth >= maxDepth) {
          throw SessionError('This phone is $depth hops from the host (max '
              '$maxDepth). Join a network closer to the host to share.');
        }
        final perms = await net.requestPermissions({AppPermission.wifi});
        if (perms[AppPermission.wifi] != true) {
          throw const SessionError(
              'Allow "Nearby devices" so the app can share a network.');
        }
        final hosted = await net.createNetwork(
            name: groupNetworkName(displayName), password: randomPassword());
        _ownsNetwork = true;
        if (gen != _generation) return;
        await _startServer(
          hostNowUs: () => nowUs() + (clock.offsetUs ?? 0),
          rejectReason: (j) {
            if (j.id == nodeId) return 'self';
            if (path.contains(j.id)) return 'loop';
            if (!clock.isSynced) return 'relay is still syncing';
            return null;
          },
          onStatus: (raw, _) => _sendToParent(raw),
        );
        relayJoin = JoinInfo(
          ssid: hosted.ssid,
          password: hosted.password,
          hosts: [hosted.ip],
          port: serverPort,
          sessionName: sessionName,
          sessionId: sessionId,
        );
        relaying = true;
      } else {
        await _stopRelay();
      }
    } catch (e) {
      relayError = describeError(e);
      await _stopRelay();
    } finally {
      relayBusy = false;
    }
    if (gen != _generation) return;
    unawaited(_sendStatus());
    _notify();
  }

  EntryPoint? _relayEntry() {
    final join = relayJoin;
    if (join == null) return null;
    return EntryPoint(
      id: nodeId,
      name: displayName,
      depth: depth,
      ssid: join.ssid,
      password: join.password,
      hosts: join.hosts,
      port: join.port,
      children: childCount,
      path: path,
    );
  }

  Future<void> _stopRelay() async {
    _server?.close();
    _server = null;
    relaying = false;
    relayJoin = null;
    if (_ownsNetwork) {
      _ownsNetwork = false;
      await _quietly(net.removeNetwork);
    }
  }

  // ========================================================================
  // Shared
  // ========================================================================

  WelcomeMsg _welcome() => WelcomeMsg(
        sessionId: sessionId,
        sessionName: sessionName,
        senderId: nodeId,
        senderName: displayName,
        senderDepth: depth,
        path: [...path, nodeId],
        maxDepth: maxDepth,
        sampleRate: SessionConfig.sampleRate,
        frameSamples: SessionConfig.frameSamples,
      );

  Future<void> _startServer({
    required int Function() hostNowUs,
    required String? Function(JoinMsg) rejectReason,
    required void Function(Uint8List raw, NodeStatus status) onStatus,
  }) async {
    _server?.close();
    // Created outside withUpstreamBinding on purpose: it must route to this
    // phone's own hotspot clients, not out through the upstream Wi-Fi.
    final endpoint = await UdpEndpoint.bind(serverPort);
    _server = DownstreamServer(
      endpoint: endpoint,
      hostNowUs: hostNowUs,
      buildWelcome: _welcome,
      rejectReason: rejectReason,
      onStatus: onStatus,
      onChildrenChanged: _scheduleNotify,
    )..start();
  }

  Future<void> _refreshBattery() async {
    if (nowUs() - _batteryReadUs < 30000000) return;
    _batteryReadUs = nowUs();
    try {
      _battery = await net.batteryLevel();
    } catch (_) {}
  }

  Future<void> stop() async {
    _generation++;
    if (role == null && phase == SessionPhase.idle) return;
    await _teardown();
    role = null;
    phase = SessionPhase.idle;
    error = null;
    notice = null;
    hostMode = null;
    hostJoin = null;
    upstreamJoin = null;
    relayError = null;
    nodes.clear();
    alternatives = const [];
    playback = PlaybackStats.empty;
    _notify();
  }

  Future<void> _fail(Object e) async {
    final message = describeError(e);
    await _teardown();
    error = message;
    phase = SessionPhase.error;
  }

  Future<void> _teardown() async {
    for (final t in _timers) {
      t.cancel();
    }
    _timers.clear();
    _notifyTimer?.cancel();
    _notifyTimer = null;
    final discovery = _discovery;
    if (discovery != null && !discovery.isCompleted) discovery.complete(false);
    _discovery = null;

    await _captureSub?.cancel();
    _captureSub = null;
    final wasRole = role;
    if (wasRole == SessionRole.host) {
      await _announceEnd();
      await _quietly(audio.stopCapture);
    }
    if (wasRole == SessionRole.listener) {
      _sendToParent(encodeJson(MsgType.leave, {'id': nodeId}));
      await _quietly(audio.stopPlayback);
    }
    await _stopRelay();
    _closeUpstream();
    if (wasRole == SessionRole.listener && (upstreamJoin?.ssid.isNotEmpty ?? false)) {
      await _quietly(net.leaveWifi);
    }
    await _quietly(net.stopKeepAlive);

    clock.reset();
    micLevel.value = 0;
    muted = false;
    _parentAddress = null;
    parentId = null;
    parentName = '';
    _lastAudioSeq = -1;
    lossPct = 0;
    starvingTicks = 0;
    _tickPushed = 0;
    _lastAudioRxUs = 0;
    depth = 0;
    path = const [];
  }

  void _closeUpstream() {
    _upstreamSub?.cancel();
    _upstreamSub = null;
    _upstream?.close();
    _upstream = null;
  }

  void _every(Duration period, FutureOr<void> Function() action) =>
      _timers.add(Timer.periodic(period, (_) => action()));

  static Future<void> _quietly(Future<void> Function() action) async {
    try {
      await action();
    } catch (_) {}
  }

  void _scheduleNotify() {
    _notifyTimer ??= Timer(const Duration(milliseconds: 250), () {
      _notifyTimer = null;
      _notify();
    });
  }

  void _notify() {
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    unawaited(stop().whenComplete(micLevel.dispose));
    super.dispose();
  }
}
