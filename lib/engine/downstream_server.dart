import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import '../core/protocol.dart';
import '../core/util.dart';
import 'udp.dart';

class ChildPeer {
  ChildPeer(this.address, this.port, this.id, this.name);
  final InternetAddress address;
  final int port;
  final String id;
  String name;
  int lastSeenUs = nowUs();
}

/// Serves the phones connected to this one: the host's listeners, or a
/// relay's listeners. Answers joins and clock pings, fans audio out, and
/// passes status reports from below to [onStatus].
class DownstreamServer {
  DownstreamServer({
    required this.endpoint,
    required this.hostNowUs,
    required this.buildWelcome,
    required this.rejectReason,
    this.onStatus,
    this.onChildrenChanged,
  });

  final UdpEndpoint endpoint;

  /// Current time on the host's clock (host: local clock, relay: synced).
  final int Function() hostNowUs;
  final WelcomeMsg Function() buildWelcome;

  /// Returns why a join must be refused, or null to accept it.
  final String? Function(JoinMsg join) rejectReason;
  final void Function(Uint8List raw, NodeStatus status)? onStatus;
  final void Function()? onChildrenChanged;

  static const _childTimeoutUs = 6000000;

  final Map<String, ChildPeer> children = {};
  StreamSubscription<ReceivedDatagram>? _sub;
  Timer? _pruneTimer;

  void start() {
    _sub = endpoint.datagrams.listen(_onDatagram);
    _pruneTimer = Timer.periodic(const Duration(seconds: 2), (_) => _prune());
  }

  void broadcast(Uint8List data) {
    for (final c in children.values) {
      endpoint.send(data, c.address, c.port);
    }
  }

  void close() {
    _sub?.cancel();
    _pruneTimer?.cancel();
    children.clear();
    endpoint.close();
  }

  void _onDatagram(ReceivedDatagram d) {
    final key = '${d.address.address}:${d.port}';
    final type = peekType(d.data);
    if (type != MsgType.ping && type != MsgType.status) {
      trace('server rx $type from $key (${d.data.length}B)');
    }
    switch (peekType(d.data)) {
      case MsgType.join:
        final body = decodeJsonBody(d.data);
        if (body == null) return;
        final join = JoinMsg.fromJson(body);
        final reason = rejectReason(join);
        if (reason != null) {
          trace('server rejected $key: $reason');
          endpoint.send(encodeJson(MsgType.reject, {'reason': reason}), d.address, d.port);
          return;
        }
        final existing = children[key];
        if (existing != null) {
          existing
            ..lastSeenUs = d.rxUs
            ..name = join.name;
        } else {
          children[key] = ChildPeer(d.address, d.port, join.id, join.name);
        }
        endpoint.send(buildWelcome().encode(), d.address, d.port);
        if (existing == null) onChildrenChanged?.call();

      case MsgType.ping:
        final ping = PingPacket.decode(d.data);
        if (ping == null) return;
        final child = children[key];
        if (child == null) {
          // We restarted or pruned them; ask for a fresh join.
          endpoint.send(encodeJson(MsgType.reject, {'reason': 'rejoin'}), d.address, d.port);
          return;
        }
        child.lastSeenUs = d.rxUs;
        final offset = hostNowUs() - nowUs();
        final pong = PongPacket(buildWelcome().sessionId, ping.seq, ping.t1,
            d.rxUs + offset, hostNowUs());
        endpoint.send(pong.encode(), d.address, d.port);

      case MsgType.status:
        children[key]?.lastSeenUs = d.rxUs;
        final body = decodeJsonBody(d.data);
        if (body != null) onStatus?.call(d.data, NodeStatus.fromJson(body));

      case MsgType.leave:
        if (children.remove(key) != null) onChildrenChanged?.call();

      default:
        break;
    }
  }

  void _prune() {
    final cutoff = nowUs() - _childTimeoutUs;
    final before = children.length;
    children.removeWhere((_, c) => c.lastSeenUs < cutoff);
    if (children.length != before) onChildrenChanged?.call();
  }
}
