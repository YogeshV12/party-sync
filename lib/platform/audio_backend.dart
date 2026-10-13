import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter/services.dart';

/// One chunk of microphone audio from the native engine.
class CaptureFrame {
  const CaptureFrame(this.captureWallUs, this.sampleIndex, this.pcm);

  /// Wall-clock time the first sample hit the microphone.
  final int captureWallUs;

  /// Running sample counter since capture started (multiple of the frame size).
  final int sampleIndex;
  final Int16List pcm;

  /// Native layout (little-endian): [captureWallUs i64][sampleIndex i64][pcm16...]
  static CaptureFrame fromBytes(Uint8List bytes) {
    final b = ByteData.sublistView(bytes);
    final count = (bytes.length - 16) ~/ 2;
    final pcm = Int16List(count);
    for (var i = 0; i < count; i++) {
      pcm[i] = b.getInt16(16 + i * 2, Endian.little);
    }
    return CaptureFrame(
        b.getInt64(0, Endian.little), b.getInt64(8, Endian.little), pcm);
  }
}

class PlaybackStats {
  const PlaybackStats({
    this.route = '',
    this.routeKind = '',
    this.outputLatencyMs = 0,
    this.bufferedMs = 0,
    this.syncErrorMs = 0,
    this.lostMs = 0,
    this.starvedMs = 0,
    this.resyncs = 0,
  });

  static const empty = PlaybackStats();

  /// e.g. "JBL Flip 6" and "bluetooth".
  final String route;
  final String routeKind;

  /// Time from handing audio to the OS until it leaves the speaker, as reported
  /// by the platform (includes Bluetooth delay where the OS knows it).
  final double outputLatencyMs;

  /// Audio queued ahead of the play position. Near zero means packets arrive
  /// too late: raise the host's sync delay.
  final double bufferedMs;
  final double syncErrorMs;
  final double lostMs;
  final double starvedMs;
  final int resyncs;

  bool get isBluetooth => routeKind.startsWith('bluetooth');

  static PlaybackStats fromMap(Map<Object?, Object?> m) => PlaybackStats(
        route: m['route'] as String? ?? '',
        routeKind: m['routeKind'] as String? ?? '',
        outputLatencyMs: (m['outputLatencyMs'] as num?)?.toDouble() ?? 0,
        // Negative means the stream ran dry (e.g. host gone); show it as empty.
        bufferedMs: math.max(0, (m['bufferedMs'] as num?)?.toDouble() ?? 0),
        syncErrorMs: (m['syncErrorMs'] as num?)?.toDouble() ?? 0,
        lostMs: (m['lostMs'] as num?)?.toDouble() ?? 0,
        starvedMs: (m['starvedMs'] as num?)?.toDouble() ?? 0,
        resyncs: (m['resyncs'] as num?)?.toInt() ?? 0,
      );
}

abstract class AudioBackend {
  Stream<CaptureFrame> get captureFrames;
  Future<void> startCapture({
    required int sampleRate,
    required int frameSamples,
    required bool voiceProcessing,
  });
  Future<void> stopCapture();

  Future<void> startPlayback({required int sampleRate, required int frameSamples});
  Future<void> stopPlayback();

  /// Queue decoded audio so its first sample is heard at [playAtLocalUs]
  /// (wall clock of this phone). The native engine handles output latency.
  void push(int firstSample, int playAtLocalUs, Int16List pcm);

  /// Extra lag of this speaker beyond what the OS reports (positive = speaker
  /// is late, so play earlier).
  Future<void> setOutputOffsetMs(double ms);
  Future<PlaybackStats> stats();
}

class PlatformAudioBackend implements AudioBackend {
  static const _channel = MethodChannel('party_sync/audio');
  static const _events = EventChannel('party_sync/capture');

  Stream<CaptureFrame>? _frames;

  @override
  Stream<CaptureFrame> get captureFrames => _frames ??= _events
      .receiveBroadcastStream()
      .map((e) => CaptureFrame.fromBytes(e as Uint8List));

  @override
  Future<void> startCapture({
    required int sampleRate,
    required int frameSamples,
    required bool voiceProcessing,
  }) =>
      _channel.invokeMethod('startCapture', {
        'sampleRate': sampleRate,
        'frameSamples': frameSamples,
        'voiceProcessing': voiceProcessing,
      });

  @override
  Future<void> stopCapture() => _channel.invokeMethod('stopCapture');

  @override
  Future<void> startPlayback({required int sampleRate, required int frameSamples}) =>
      _channel.invokeMethod('startPlayback',
          {'sampleRate': sampleRate, 'frameSamples': frameSamples});

  @override
  Future<void> stopPlayback() => _channel.invokeMethod('stopPlayback');

  @override
  void push(int firstSample, int playAtLocalUs, Int16List pcm) {
    final out = Uint8List(16 + pcm.lengthInBytes);
    ByteData.sublistView(out)
      ..setInt64(0, firstSample, Endian.little)
      ..setInt64(8, playAtLocalUs, Endian.little);
    out.setRange(16, out.length,
        pcm.buffer.asUint8List(pcm.offsetInBytes, pcm.lengthInBytes));
    _channel.invokeMethod('push', out);
  }

  @override
  Future<void> setOutputOffsetMs(double ms) =>
      _channel.invokeMethod('setOutputOffset', {'ms': ms});

  @override
  Future<PlaybackStats> stats() async {
    final m = await _channel.invokeMapMethod<Object?, Object?>('stats');
    return m == null ? PlaybackStats.empty : PlaybackStats.fromMap(m);
  }
}
