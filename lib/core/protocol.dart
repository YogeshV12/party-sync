import 'dart:convert';
import 'dart:typed_data';

/// Wire format shared by every phone in a session. Multi-byte fields are
/// big-endian. Every datagram starts with `'P' 'S' <version> <type>`.
///
/// Audio, ping and pong use fixed binary layouts because they are frequent or
/// timing-sensitive; the rest carry a small JSON body.
const int protocolVersion = 1;
const int _magic0 = 0x50; // 'P'
const int _magic1 = 0x53; // 'S'

enum MsgType {
  join(1),
  welcome(2),
  ping(3),
  pong(4),
  audio(5),
  status(6),
  netmap(7),
  leave(8),
  reject(9);

  const MsgType(this.code);
  final int code;

  static MsgType? fromCode(int code) {
    for (final t in values) {
      if (t.code == code) return t;
    }
    return null;
  }
}

MsgType? peekType(Uint8List data) {
  if (data.length < 4 ||
      data[0] != _magic0 ||
      data[1] != _magic1 ||
      data[2] != protocolVersion) {
    return null;
  }
  return MsgType.fromCode(data[3]);
}

void _writeHeader(Uint8List out, MsgType type) {
  out[0] = _magic0;
  out[1] = _magic1;
  out[2] = protocolVersion;
  out[3] = type.code;
}

Uint8List encodeJson(MsgType type, Map<String, Object?> body) {
  final json = utf8.encode(jsonEncode(body));
  final out = Uint8List(4 + json.length);
  _writeHeader(out, type);
  out.setRange(4, out.length, json);
  return out;
}

Map<String, dynamic>? decodeJsonBody(Uint8List data) {
  if (data.length < 5) return null;
  try {
    final body = jsonDecode(utf8.decode(Uint8List.sublistView(data, 4)));
    return body is Map<String, dynamic> ? body : null;
  } catch (_) {
    return null;
  }
}

class AudioCodec {
  static const int mulaw = 1;
  static const int pcm16 = 2;
}

/// One 20 ms chunk of the host's voice, stamped with the host-clock time at
/// which every speaker should play its first sample.
class AudioPacket {
  AudioPacket({
    required this.sessionId,
    required this.seq,
    required this.firstSample,
    required this.playAtHostUs,
    required this.sampleRate,
    required this.codec,
    required this.sampleCount,
    required this.payload,
  });

  static const int headerSize = 36;

  final int sessionId;
  final int seq;
  final int firstSample;
  final int playAtHostUs;
  final int sampleRate;
  final int codec;
  final int sampleCount;
  final Uint8List payload;

  Uint8List encode() {
    final out = Uint8List(headerSize + payload.length);
    _writeHeader(out, MsgType.audio);
    ByteData.sublistView(out)
      ..setUint32(4, sessionId)
      ..setUint32(8, seq & 0xFFFFFFFF)
      ..setInt64(12, firstSample)
      ..setInt64(20, playAtHostUs)
      ..setUint32(28, sampleRate)
      ..setUint8(32, codec)
      ..setUint8(33, 1)
      ..setUint16(34, sampleCount);
    out.setRange(headerSize, out.length, payload);
    return out;
  }

  static AudioPacket? decode(Uint8List data) {
    if (data.length < headerSize || peekType(data) != MsgType.audio) return null;
    final b = ByteData.sublistView(data);
    return AudioPacket(
      sessionId: b.getUint32(4),
      seq: b.getUint32(8),
      firstSample: b.getInt64(12),
      playAtHostUs: b.getInt64(20),
      sampleRate: b.getUint32(28),
      codec: b.getUint8(32),
      sampleCount: b.getUint16(34),
      payload: Uint8List.sublistView(data, headerSize),
    );
  }
}

class PingPacket {
  const PingPacket(this.sessionId, this.seq, this.t1);
  static const int size = 20;
  final int sessionId;
  final int seq;
  final int t1;

  Uint8List encode() {
    final out = Uint8List(size);
    _writeHeader(out, MsgType.ping);
    ByteData.sublistView(out)
      ..setUint32(4, sessionId)
      ..setUint32(8, seq & 0xFFFFFFFF)
      ..setInt64(12, t1);
    return out;
  }

  static PingPacket? decode(Uint8List data) {
    if (data.length < size || peekType(data) != MsgType.ping) return null;
    final b = ByteData.sublistView(data);
    return PingPacket(b.getUint32(4), b.getUint32(8), b.getInt64(12));
  }
}

/// Reply to a ping. t2/t3 are in *host* time, even when sent by a relay.
class PongPacket {
  const PongPacket(this.sessionId, this.seq, this.t1, this.t2, this.t3);
  static const int size = 36;
  final int sessionId;
  final int seq;
  final int t1;
  final int t2;
  final int t3;

  Uint8List encode() {
    final out = Uint8List(size);
    _writeHeader(out, MsgType.pong);
    ByteData.sublistView(out)
      ..setUint32(4, sessionId)
      ..setUint32(8, seq & 0xFFFFFFFF)
      ..setInt64(12, t1)
      ..setInt64(20, t2)
      ..setInt64(28, t3);
    return out;
  }

  static PongPacket? decode(Uint8List data) {
    if (data.length < size || peekType(data) != MsgType.pong) return null;
    final b = ByteData.sublistView(data);
    return PongPacket(b.getUint32(4), b.getUint32(8), b.getInt64(12),
        b.getInt64(20), b.getInt64(28));
  }
}

class JoinMsg {
  const JoinMsg({
    required this.id,
    required this.name,
    required this.platform,
    this.sessionId = 0,
  });

  final String id;
  final String name;
  final String platform;
  final int sessionId;

  Uint8List encode() => encodeJson(MsgType.join,
      {'id': id, 'name': name, 'platform': platform, 'sid': sessionId});

  static JoinMsg fromJson(Map<String, dynamic> j) => JoinMsg(
        id: j['id'] as String? ?? '',
        name: j['name'] as String? ?? 'Phone',
        platform: j['platform'] as String? ?? '',
        sessionId: (j['sid'] as num?)?.toInt() ?? 0,
      );
}

class WelcomeMsg {
  const WelcomeMsg({
    required this.sessionId,
    required this.sessionName,
    required this.senderId,
    required this.senderName,
    required this.senderDepth,
    required this.path,
    required this.maxDepth,
    required this.sampleRate,
    required this.frameSamples,
  });

  final int sessionId;
  final String sessionName;
  final String senderId;
  final String senderName;

  /// 0 for the host, 1 for a relay directly under the host, ...
  final int senderDepth;

  /// Node ids from the host down to (and including) the sender. The receiver
  /// adopts this as its own ancestry.
  final List<String> path;
  final int maxDepth;
  final int sampleRate;
  final int frameSamples;

  Uint8List encode() => encodeJson(MsgType.welcome, {
        'sid': sessionId,
        'session': sessionName,
        'from': senderId,
        'fromName': senderName,
        'depth': senderDepth,
        'path': path,
        'maxDepth': maxDepth,
        'rate': sampleRate,
        'frame': frameSamples,
      });

  static WelcomeMsg fromJson(Map<String, dynamic> j) => WelcomeMsg(
        sessionId: (j['sid'] as num?)?.toInt() ?? 0,
        sessionName: j['session'] as String? ?? '',
        senderId: j['from'] as String? ?? '',
        senderName: j['fromName'] as String? ?? '',
        senderDepth: (j['depth'] as num?)?.toInt() ?? 0,
        path: (j['path'] as List?)?.cast<String>() ?? const [],
        maxDepth: (j['maxDepth'] as num?)?.toInt() ?? 3,
        sampleRate: (j['rate'] as num?)?.toInt() ?? 16000,
        frameSamples: (j['frame'] as num?)?.toInt() ?? 320,
      );
}

/// A network another phone can join to receive the session: the host's own
/// network or a relay's. Distributed to everyone for one-tap failover.
class EntryPoint {
  const EntryPoint({
    required this.id,
    required this.name,
    required this.depth,
    required this.ssid,
    required this.password,
    required this.hosts,
    required this.port,
    this.children = 0,
    this.path = const [],
  });

  final String id;
  final String name;
  final int depth;
  final String ssid;
  final String password;
  final List<String> hosts;
  final int port;
  final int children;
  final List<String> path;

  bool get isHost => depth == 0;

  Map<String, Object?> toJson() => {
        'id': id,
        'name': name,
        'depth': depth,
        'ssid': ssid,
        'pass': password,
        'hosts': hosts,
        'port': port,
        'children': children,
        'path': path,
      };

  static EntryPoint fromJson(Map<String, dynamic> j) => EntryPoint(
        id: j['id'] as String? ?? '',
        name: j['name'] as String? ?? '',
        depth: (j['depth'] as num?)?.toInt() ?? 0,
        ssid: j['ssid'] as String? ?? '',
        password: j['pass'] as String? ?? '',
        hosts: (j['hosts'] as List?)?.cast<String>() ?? const [],
        port: (j['port'] as num?)?.toInt() ?? 0,
        children: (j['children'] as num?)?.toInt() ?? 0,
        path: (j['path'] as List?)?.cast<String>() ?? const [],
      );
}

Uint8List encodeNetmap(int sessionId, List<EntryPoint> entries) =>
    encodeJson(MsgType.netmap,
        {'sid': sessionId, 'entries': [for (final e in entries) e.toJson()]});

List<EntryPoint> decodeNetmap(Map<String, dynamic> body) => [
      for (final e in (body['entries'] as List? ?? const []))
        if (e is Map<String, dynamic>) EntryPoint.fromJson(e),
    ];

/// Periodic health report every phone sends up the tree; relays forward their
/// children's reports unchanged so the host sees the whole network.
class NodeStatus {
  NodeStatus({
    required this.id,
    required this.parentId,
    required this.name,
    required this.role,
    required this.platform,
    required this.depth,
    this.battery,
    this.bufferMs,
    this.lossPct,
    this.rttMs,
    this.route,
    this.children = 0,
    this.relay,
    int? seenUs,
  }) : seenUs = seenUs ?? DateTime.now().microsecondsSinceEpoch;

  final String id;
  final String? parentId;
  final String name;

  /// 'host', 'listener' or 'relay'.
  final String role;
  final String platform;
  final int depth;
  final int? battery;
  final double? bufferMs;
  final double? lossPct;
  final double? rttMs;
  final String? route;
  final int children;
  final EntryPoint? relay;
  int seenUs;

  Uint8List encode() => encodeJson(MsgType.status, {
        'id': id,
        'parent': parentId,
        'name': name,
        'role': role,
        'platform': platform,
        'depth': depth,
        'battery': battery,
        'buffer': bufferMs,
        'loss': lossPct,
        'rtt': rttMs,
        'route': route,
        'children': children,
        'relay': relay?.toJson(),
      });

  static NodeStatus fromJson(Map<String, dynamic> j) => NodeStatus(
        id: j['id'] as String? ?? '',
        parentId: j['parent'] as String?,
        name: j['name'] as String? ?? 'Phone',
        role: j['role'] as String? ?? 'listener',
        platform: j['platform'] as String? ?? '',
        depth: (j['depth'] as num?)?.toInt() ?? 1,
        battery: (j['battery'] as num?)?.toInt(),
        bufferMs: (j['buffer'] as num?)?.toDouble(),
        lossPct: (j['loss'] as num?)?.toDouble(),
        rttMs: (j['rtt'] as num?)?.toDouble(),
        route: j['route'] as String?,
        children: (j['children'] as num?)?.toInt() ?? 0,
        relay: j['relay'] is Map<String, dynamic>
            ? EntryPoint.fromJson(j['relay'] as Map<String, dynamic>)
            : null,
      );
}
