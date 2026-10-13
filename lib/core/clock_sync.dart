/// Estimates the offset between this phone's clock and the host's clock using
/// NTP-style ping/pong exchanges with the parent (which answers in host time,
/// so relays pass the host clock down the tree).
///
/// The sample with the smallest round trip in a sliding window is the most
/// trustworthy one, so it drives the estimate; the estimate glides towards it
/// to avoid audible jumps in playback.
class ClockSync {
  ClockSync({this.window = 12, this.minSamples = 5});

  final int window;
  final int minSamples;
  final List<_Sample> _samples = [];

  int? _offsetUs;
  int _accepted = 0;

  /// host clock − local clock, in microseconds.
  int? get offsetUs => _offsetUs;
  bool get isSynced => _offsetUs != null && _accepted >= minSamples;

  int? get bestRttUs => _samples.isEmpty
      ? null
      : _samples.map((s) => s.rttUs).reduce((a, b) => a < b ? a : b);

  /// Worst-case error of the offset from the best sample (half its RTT).
  double? get errorBoundMs {
    final rtt = bestRttUs;
    return rtt == null ? null : rtt / 2000.0;
  }

  void reset() {
    _samples.clear();
    _offsetUs = null;
    _accepted = 0;
  }

  /// t1: child send (local), t2: parent receive (host), t3: parent send (host),
  /// t4: child receive (local).
  void addSample(int t1, int t2, int t3, int t4) {
    final rtt = (t4 - t1) - (t3 - t2);
    if (rtt < 0 || rtt > 2000000) return;
    final offset = ((t2 - t1) + (t3 - t4)) ~/ 2;
    _samples.add(_Sample(offset, rtt));
    if (_samples.length > window) _samples.removeAt(0);
    _accepted++;

    final best = _samples.reduce((a, b) => a.rttUs <= b.rttUs ? a : b);
    final current = _offsetUs;
    if (current == null || (best.offsetUs - current).abs() > 20000) {
      _offsetUs = best.offsetUs;
    } else {
      _offsetUs = current + ((best.offsetUs - current) * 0.25).round();
    }
  }
}

class _Sample {
  const _Sample(this.offsetUs, this.rttUs);
  final int offsetUs;
  final int rttUs;
}

/// Maps the host's capture sample counter to smooth host-clock timestamps.
/// Raw capture timestamps jitter by a few milliseconds; feeding that jitter to
/// listeners would make them constantly nudge playback.
class CaptureClock {
  CaptureClock(this.sampleRate);

  final int sampleRate;
  double? _baseUs;

  void reset() => _baseUs = null;

  int map(int sampleIndex, int measuredUs) {
    final ideal = sampleIndex * 1e6 / sampleRate;
    final base = measuredUs - ideal;
    final current = _baseUs;
    if (current == null || (base - current).abs() > 50000) {
      _baseUs = base;
    } else {
      _baseUs = current + (base - current) * 0.02;
    }
    return (_baseUs! + ideal).round();
  }
}
