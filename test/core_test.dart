import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:party_sync/core/clock_sync.dart';
import 'package:party_sync/core/join_info.dart';
import 'package:party_sync/core/mulaw.dart';
import 'package:party_sync/core/protocol.dart';

void main() {
  group('MuLaw', () {
    test('round trip stays within companding error', () {
      final pcm = Int16List.fromList([
        for (var i = 0; i < 320; i++) (12000 * math.sin(i / 7)).round(),
        0, 1, -1, 32767, -32768, 100, -100,
      ]);
      final decoded = MuLaw.decode(MuLaw.encode(pcm));
      for (var i = 0; i < pcm.length; i++) {
        final tolerance = math.max(8, pcm[i].abs() ~/ 16);
        expect((decoded[i] - pcm[i]).abs(), lessThanOrEqualTo(tolerance + 600 * (pcm[i].abs() > 32000 ? 1 : 0)),
            reason: 'sample $i: ${pcm[i]} -> ${decoded[i]}');
      }
    });

    test('silence encodes to the standard code', () {
      expect(MuLaw.encodeSample(0), 0xFF);
      expect(MuLaw.decodeSample(0xFF), 0);
    });
  });

  group('Protocol', () {
    test('audio packet round trip', () {
      final payload = Uint8List.fromList(List.generate(320, (i) => i & 0xFF));
      final p = AudioPacket(
        sessionId: 123456,
        seq: 0xFFFFFFFF,
        firstSample: 987654321,
        playAtHostUs: 1760000000123456,
        sampleRate: 16000,
        codec: AudioCodec.mulaw,
        sampleCount: 320,
        payload: payload,
      );
      final d = AudioPacket.decode(p.encode())!;
      expect(d.sessionId, 123456);
      expect(d.seq, 0xFFFFFFFF);
      expect(d.firstSample, 987654321);
      expect(d.playAtHostUs, 1760000000123456);
      expect(d.sampleRate, 16000);
      expect(d.sampleCount, 320);
      expect(d.payload, payload);
    });

    test('ping and pong round trip', () {
      final ping = PingPacket.decode(const PingPacket(7, 42, 1000).encode())!;
      expect([ping.sessionId, ping.seq, ping.t1], [7, 42, 1000]);
      final pong = PongPacket.decode(const PongPacket(7, 42, 1, 2, 3).encode())!;
      expect([pong.t1, pong.t2, pong.t3], [1, 2, 3]);
    });

    test('rejects foreign datagrams', () {
      expect(peekType(Uint8List.fromList([1, 2, 3, 4, 5])), isNull);
      expect(AudioPacket.decode(const PingPacket(1, 1, 1).encode()), isNull);
    });

    test('status carries relay entry point', () {
      final status = NodeStatus(
        id: 'a',
        parentId: 'h',
        name: 'Relay',
        role: 'relay',
        platform: 'android',
        depth: 1,
        relay: const EntryPoint(
          id: 'a', name: 'Relay', depth: 1, ssid: 'DIRECT-PS-x', password: 'pw123456',
          hosts: ['192.168.49.1'], port: 47800, path: ['h'],
        ),
      );
      final decoded = NodeStatus.fromJson(decodeJsonBody(status.encode())!);
      expect(decoded.relay!.ssid, 'DIRECT-PS-x');
      expect(decoded.relay!.path, ['h']);
    });
  });

  group('ClockSync', () {
    test('recovers a fixed offset despite asymmetric jitter', () {
      final clock = ClockSync();
      const offset = 5000000; // host is 5 s ahead
      final rnd = math.Random(1);
      var local = 1000000;
      for (var i = 0; i < 12; i++) {
        final up = 2000 + rnd.nextInt(20000);
        final down = 2000 + rnd.nextInt(20000);
        final t1 = local;
        final t2 = t1 + up + offset;
        final t3 = t2 + 100;
        final t4 = t3 - offset + down;
        clock.addSample(t1, t2, t3, t4);
        local += 1000000;
      }
      expect(clock.isSynced, isTrue);
      expect((clock.offsetUs! - offset).abs(), lessThan(clock.bestRttUs! ~/ 2 + 1));
    });

    test('capture clock smooths jitter', () {
      final cc = CaptureClock(16000);
      final rnd = math.Random(2);
      int? last;
      for (var i = 0; i < 200; i++) {
        final ideal = 1000000 + i * 20000;
        final mapped = cc.map(i * 320, ideal + rnd.nextInt(4000));
        if (last != null && i > 50) {
          expect((mapped - last - 20000).abs(), lessThan(300));
        }
        last = mapped;
      }
    });
  });

  group('JoinInfo', () {
    test('app uri round trip', () {
      const info = JoinInfo(
        ssid: 'DIRECT-PS-Party net',
        password: 'p&ss=word',
        hosts: ['192.168.49.1', '10.0.0.5'],
        port: 47811,
        sessionName: "Asha's party",
        sessionId: 99,
      );
      final parsed = JoinInfo.tryParse(info.toUri())!;
      expect(parsed.ssid, info.ssid);
      expect(parsed.password, info.password);
      expect(parsed.hosts, info.hosts);
      expect(parsed.port, 47811);
      expect(parsed.sessionName, "Asha's party");
      expect(parsed.sessionId, 99);
    });

    test('wifi qr round trip with escaping', () {
      const info = JoinInfo(ssid: r'My;Net:1', password: r'a\b,c"d');
      final parsed = JoinInfo.tryParse(info.toWifiQr())!;
      expect(parsed.ssid, info.ssid);
      expect(parsed.password, info.password);
    });

    test('parses camera-style wifi codes', () {
      final parsed = JoinInfo.tryParse('WIFI:S:Hotspot;T:WPA;P:secret123;H:false;;')!;
      expect(parsed.ssid, 'Hotspot');
      expect(parsed.password, 'secret123');
    });

    test('ignores unrelated codes', () {
      expect(JoinInfo.tryParse('https://example.com'), isNull);
    });
  });
}
