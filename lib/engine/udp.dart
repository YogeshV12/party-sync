import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import '../core/util.dart';

class ReceivedDatagram {
  const ReceivedDatagram(this.data, this.address, this.port, this.rxUs);
  final Uint8List data;
  final InternetAddress address;
  final int port;

  /// Local wall-clock time the datagram was read, for clock sync.
  final int rxUs;
}

/// Thin wrapper over a UDP socket that stamps every datagram on arrival.
class UdpEndpoint {
  UdpEndpoint(this._socket) {
    _socket.listen(_onEvent, onError: (Object _) {});
  }

  final RawDatagramSocket _socket;
  final _rx = StreamController<ReceivedDatagram>.broadcast(sync: true);

  Stream<ReceivedDatagram> get datagrams => _rx.stream;
  int get port => _socket.port;

  static Future<UdpEndpoint> bind(int port) async => UdpEndpoint(
      await RawDatagramSocket.bind(InternetAddress.anyIPv4, port, reuseAddress: true));

  void _onEvent(RawSocketEvent event) {
    if (event != RawSocketEvent.read) return;
    final rxUs = nowUs();
    Datagram? d;
    while ((d = _socket.receive()) != null) {
      _rx.add(ReceivedDatagram(d!.data, d.address, d.port, rxUs));
    }
  }

  bool send(Uint8List data, InternetAddress address, int port) {
    try {
      return _socket.send(data, address, port) > 0;
    } on SocketException {
      return false;
    }
  }

  void close() {
    _socket.close();
    _rx.close();
  }
}
