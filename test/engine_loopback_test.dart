import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:party_sync/core/join_info.dart';
import 'package:party_sync/core/protocol.dart';
import 'package:party_sync/core/util.dart';
import 'package:party_sync/engine/session_engine.dart';
import 'package:party_sync/platform/audio_backend.dart';
import 'package:party_sync/platform/net_backend.dart';

class FakeAudio implements AudioBackend {
  final _frames = StreamController<CaptureFrame>.broadcast();
  final pushes = <({int first, int playAt, Int16List pcm})>[];
  bool capturing = false;
  bool playing = false;

  void emit(CaptureFrame frame) => _frames.add(frame);

  @override
  Stream<CaptureFrame> get captureFrames => _frames.stream;

  @override
  Future<void> startCapture(
      {required int sampleRate, required int frameSamples, required bool voiceProcessing}) async {
    capturing = true;
  }

  @override
  Future<void> stopCapture() async => capturing = false;

  @override
  Future<void> startPlayback({required int sampleRate, required int frameSamples}) async =>
      playing = true;

  @override
  Future<void> stopPlayback() async => playing = false;

  @override
  void push(int firstSample, int playAtLocalUs, Int16List pcm) =>
      pushes.add((first: firstSample, playAt: playAtLocalUs, pcm: pcm));

  @override
  Future<void> setOutputOffsetMs(double ms) async {}

  @override
  Future<PlaybackStats> stats() async => const PlaybackStats(bufferedMs: 300);
}

class FakeNet implements NetBackend {
  FakeNet({this.canRelay = false});
  final bool canRelay;
  final joined = <String>[];
  int networksCreated = 0;
  int networksRemoved = 0;

  @override
  Future<DeviceCaps> capabilities() async => DeviceCaps(
      platform: 'test', model: 'Test', canCreateNetwork: canRelay, canRelay: canRelay);

  @override
  Future<Map<AppPermission, bool>> requestPermissions(Set<AppPermission> p) async =>
      {for (final x in p) x: true};

  @override
  Future<void> joinWifi(String ssid, String password) async => joined.add(ssid);

  @override
  Future<void> leaveWifi() async {}

  @override
  Future<T> withUpstreamBinding<T>(Future<T> Function() open) => open();

  @override
  Future<HostedNetwork> createNetwork({required String name, required String password}) async {
    networksCreated++;
    return HostedNetwork(ssid: name, password: password, ip: '127.0.0.1');
  }

  @override
  Future<void> removeNetwork() async => networksRemoved++;

  @override
  Future<bool> openHotspotSettings() async => false;

  @override
  Future<int?> batteryLevel() async => 80;

  @override
  Future<void> startKeepAlive({required bool microphone, required String text}) async {}

  @override
  Future<void> stopKeepAlive() async {}
}

Future<void> waitFor(bool Function() condition,
    {Duration timeout = const Duration(seconds: 10), String? reason}) async {
  final deadline = DateTime.now().add(timeout);
  while (!condition()) {
    if (DateTime.now().isAfter(deadline)) {
      fail('Timed out waiting for ${reason ?? 'condition'}');
    }
    await Future<void>.delayed(const Duration(milliseconds: 50));
  }
}

SessionEngine makeEngine(FakeAudio audio, FakeNet net, int port, String name) {
  final e = SessionEngine(audio: audio, net: net, serverPort: port)..displayName = name;
  e.caps = DeviceCaps(
      platform: 'test', model: name, canCreateNetwork: net.canRelay, canRelay: net.canRelay);
  return e;
}

void main() {
  test('host → relay → listener: audio, clock sync, status and failover', () async {
    final hostAudio = FakeAudio(), relayAudio = FakeAudio(), leafAudio = FakeAudio();
    final host = makeEngine(hostAudio, FakeNet(), 47901, 'Host');
    final relayNet = FakeNet(canRelay: true);
    final relay = makeEngine(relayAudio, relayNet, 47902, 'Relay');
    final leaf = makeEngine(leafAudio, FakeNet(), 47903, 'Leaf');
    addTearDown(() async {
      await leaf.stop();
      await relay.stop();
      await host.stop();
    });

    await host.startHost(
        name: 'Test party', mode: HostNetworkMode.phoneHotspot, ssid: 'TestNet', password: 'pw');
    expect(host.phase, SessionPhase.live, reason: host.error);
    expect(hostAudio.capturing, isTrue);

    // Relay joins the host directly.
    await relay.joinSession(JoinInfo(
        ssid: '', password: '', hosts: const ['127.0.0.1'], port: 47901,
        sessionId: host.sessionId));
    await waitFor(() => relay.phase == SessionPhase.live, reason: 'relay live');
    expect(relay.depth, 1);
    expect(relay.parentId, host.nodeId);
    expect(relay.clock.offsetUs!.abs(), lessThan(3000)); // same machine clock

    await relay.setRelaying(true);
    expect(relay.relaying, isTrue, reason: relay.relayError);
    expect(relayNet.networksCreated, 1);

    // Leaf joins through the relay, two hops from the mic.
    final relayJoin = relay.relayJoin!;
    expect(relayJoin.hosts, ['127.0.0.1']);
    await leaf.joinSession(relayJoin, alreadyOnWifi: true);
    await waitFor(() => leaf.phase == SessionPhase.live, reason: 'leaf live');
    expect(leaf.depth, 2);
    expect(leaf.path, [host.nodeId, relay.nodeId]);
    expect(relay.childCount, 1);

    // Mic audio flows down the tree with identical play-at times.
    Int16List tone(int i) => Int16List.fromList(
        [for (var s = 0; s < 320; s++) (8000 * math.sin((i * 320 + s) / 5)).round()]);
    for (var i = 0; i < 25; i++) {
      hostAudio.emit(CaptureFrame(nowUs(), i * 320, tone(i)));
      await Future<void>.delayed(const Duration(milliseconds: 20));
    }
    await waitFor(() => leafAudio.pushes.length >= 20, reason: 'leaf audio');
    expect(relayAudio.pushes.length, greaterThanOrEqualTo(20));

    final byFirst = {for (final p in relayAudio.pushes) p.first: p};
    for (final p in leafAudio.pushes) {
      final r = byFirst[p.first];
      expect(r, isNotNull);
      // Both derive from the same host stamp; only clock estimate error differs.
      expect((p.playAt - r!.playAt).abs(), lessThan(3000));
      // Scheduled ~syncDelay into the future relative to capture.
      expect(p.playAt - nowUs(), lessThan(host.syncDelayMs * 1000 + 50000));
    }
    final sample = leafAudio.pushes.last;
    final original = tone(sample.first ~/ 320);
    for (var s = 0; s < 320; s += 37) {
      expect((sample.pcm[s] - original[s]).abs(), lessThan(400));
    }

    // Status from the leaf reaches the host through the relay.
    await waitFor(() => host.nodes.containsKey(leaf.nodeId),
        timeout: const Duration(seconds: 6), reason: 'leaf status at host');
    expect(host.nodes[leaf.nodeId]!.parentId, relay.nodeId);
    expect(host.nodes[relay.nodeId]!.relay, isNotNull);
    expect(host.listenerCount, 2);

    // Network map reaches the leaf, offering the host as a fallback.
    await waitFor(() => leaf.alternatives.any((e) => e.id == host.nodeId),
        timeout: const Duration(seconds: 6), reason: 'netmap at leaf');
    expect(leaf.alternatives.any((e) => e.id == relay.nodeId), isFalse,
        reason: 'current parent is not an alternative');

    // A relay can never accept its own ancestor (no loops).
    expect(relay.alternatives.any((e) => e.id == relay.nodeId), isFalse);

    // Relay disappears: leaf notices, then fails over to the host.
    await relay.stop();
    expect(relayNet.networksRemoved, 1);
    await waitFor(() => leaf.phase == SessionPhase.reconnecting,
        timeout: const Duration(seconds: 8), reason: 'leaf notices loss');
    await leaf.switchTo(EntryPoint(
        id: host.nodeId, name: 'Host', depth: 0, ssid: '', password: '',
        hosts: const ['127.0.0.1'], port: 47901));
    await waitFor(() => leaf.phase == SessionPhase.live, reason: 'leaf back live');
    expect(leaf.depth, 1);
    expect(leaf.parentId, host.nodeId);

    final before = leafAudio.pushes.length;
    for (var i = 100; i < 110; i++) {
      hostAudio.emit(CaptureFrame(nowUs(), i * 320, tone(i)));
      await Future<void>.delayed(const Duration(milliseconds: 20));
    }
    await waitFor(() => leafAudio.pushes.length >= before + 8, reason: 'audio after failover');
  }, timeout: const Timeout(Duration(seconds: 60)));

  test('muted host sends no audio but keeps listeners connected', () async {
    final hostAudio = FakeAudio(), leafAudio = FakeAudio();
    final host = makeEngine(hostAudio, FakeNet(), 47911, 'Host');
    final leaf = makeEngine(leafAudio, FakeNet(), 47912, 'Leaf');
    addTearDown(() async {
      await leaf.stop();
      await host.stop();
    });
    await host.startHost(name: 'Quiet', mode: HostNetworkMode.phoneHotspot, ssid: 'Q');
    await leaf.joinSession(
        const JoinInfo(ssid: '', password: '', hosts: ['127.0.0.1'], port: 47911),
        alreadyOnWifi: true);
    await waitFor(() => leaf.phase == SessionPhase.live, reason: 'leaf live');
    host.setMuted(true);
    for (var i = 0; i < 10; i++) {
      hostAudio.emit(CaptureFrame(nowUs(), i * 320, Int16List(320)));
    }
    await Future<void>.delayed(const Duration(seconds: 5));
    expect(leafAudio.pushes, isEmpty);
    expect(leaf.phase, SessionPhase.live, reason: 'pongs keep the link alive');
    expect(leaf.hostMuted, isTrue, reason: 'live link but no audio');
    host.setMuted(false);
    for (var i = 10; i < 40; i++) {
      hostAudio.emit(CaptureFrame(nowUs(), i * 320, Int16List(320)));
      await Future<void>.delayed(const Duration(milliseconds: 20));
    }
    expect(leaf.hostMuted, isFalse, reason: 'audio is flowing again');
  }, timeout: const Timeout(Duration(seconds: 30)));

  test('a too-short Wi-Fi password fails with a clear error before joining', () async {
    final net = FakeNet();
    final leaf = makeEngine(FakeAudio(), net, 47921, 'Leaf');
    addTearDown(leaf.stop);
    await leaf.joinSession(const JoinInfo(
        ssid: 'yogi speaks', password: 'abcde', hosts: ['172.20.10.1']));
    expect(leaf.phase, SessionPhase.error);
    expect(leaf.error, contains('5 characters'));
    expect(net.joined, isEmpty, reason: 'must not ask the OS to join');
  });

  test('skips the OS join when the host is already reachable on this Wi-Fi', () async {
    final host = makeEngine(FakeAudio(), FakeNet(), 47931, 'Host');
    final net = FakeNet();
    final leaf = makeEngine(FakeAudio(), net, 47932, 'Leaf');
    addTearDown(() async {
      await leaf.stop();
      await host.stop();
    });
    await host.startHost(name: 'Home', mode: HostNetworkMode.phoneHotspot, ssid: 'Hot');
    await leaf.joinSession(const JoinInfo(
        ssid: 'Hot', password: 'password1', hosts: ['127.0.0.1'], port: 47931));
    await waitFor(() => leaf.phase == SessionPhase.live, reason: 'leaf live');
    expect(net.joined, isEmpty, reason: 'already on the host network');
  }, timeout: const Timeout(Duration(seconds: 30)));

  test('host stopping ends the session for everyone below, without a "lost" warning',
      () async {
    final hostAudio = FakeAudio(), relayAudio = FakeAudio(), leafAudio = FakeAudio();
    final host = makeEngine(hostAudio, FakeNet(), 47951, 'Host');
    final relayNet = FakeNet(canRelay: true);
    final relay = makeEngine(relayAudio, relayNet, 47952, 'Relay');
    final leaf = makeEngine(leafAudio, FakeNet(), 47953, 'Leaf');
    addTearDown(() async {
      await leaf.stop();
      await relay.stop();
      await host.stop();
    });

    await host.startHost(name: 'Bye', mode: HostNetworkMode.phoneHotspot, ssid: 'Net');
    await relay.joinSession(
        JoinInfo(ssid: '', password: '', hosts: const ['127.0.0.1'], port: 47951),
        alreadyOnWifi: true);
    await waitFor(() => relay.phase == SessionPhase.live, reason: 'relay live');
    await relay.setRelaying(true);
    await leaf.joinSession(relay.relayJoin!, alreadyOnWifi: true);
    await waitFor(() => leaf.phase == SessionPhase.live, reason: 'leaf live');

    // Every phase the leaf passes through from now on.
    final leafPhases = <SessionPhase>[];
    leaf.addListener(() => leafPhases.add(leaf.phase));

    await host.stop();

    await waitFor(() => relay.phase == SessionPhase.ended,
        timeout: const Duration(seconds: 2), reason: 'relay told the session ended');
    await waitFor(() => leaf.phase == SessionPhase.ended,
        timeout: const Duration(seconds: 2), reason: 'leaf told the session ended');
    expect(leafPhases, isNot(contains(SessionPhase.reconnecting)));
    expect(leaf.notice, isNull);
    expect(leaf.error, isNull);
    expect(leaf.sessionName, 'Bye');
    expect(leafAudio.playing, isFalse, reason: 'speaker released');
    expect(relayAudio.playing, isFalse);
    expect(relayNet.networksRemoved, 1, reason: 'relay network torn down after the leaf was told');

    // Leaving afterwards returns to idle.
    await leaf.stop();
    expect(leaf.phase, SessionPhase.idle);
  }, timeout: const Timeout(Duration(seconds: 30)));

  test('asks for a longer host delay when output latency exceeds the buffer', () {
    final leaf = makeEngine(FakeAudio(), FakeNet(), 47941, 'Leaf')
      ..phase = SessionPhase.live
      ..starvingTicks = 3
      ..playback = const PlaybackStats(outputLatencyMs: 534, bufferedMs: 0);
    expect(leaf.neededSyncDelayMs, 750);
    leaf.starvingTicks = 1; // e.g. just after the host unmutes
    expect(leaf.neededSyncDelayMs, isNull);
    leaf.starvingTicks = 3;
    leaf.playback = const PlaybackStats(outputLatencyMs: 60, bufferedMs: 250);
    expect(leaf.neededSyncDelayMs, isNull);
  });
}
