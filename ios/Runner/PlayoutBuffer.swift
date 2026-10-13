import os

/// Jitter buffer that plays every packet at its scheduled wall-clock time.
///
/// Packets carry a global sample index and the local time their first sample
/// must be heard. For each output buffer we work out which source sample
/// should be audible at that moment and nudge playback speed (±0.5%,
/// inaudible) to converge on it, so clock drift and sync updates never click.
/// Errors over 40 ms (new stream, long gap) jump straight to the right spot.
///
/// Mirrors android/.../PlayoutBuffer.kt; keep the two in step. Storage is
/// preallocated so the render path never allocates on the audio thread.
final class PlayoutBuffer {
  private let lock: UnsafeMutablePointer<os_unfair_lock>
  private let ringSize = 256
  private var srcRate = 16000
  private var frame = 320
  private var capacity: Int
  private let slotFirst: UnsafeMutablePointer<Int64>
  private var samples: UnsafeMutablePointer<Int16>

  private var refFirst: Int64 = -1
  private var refPlayUs: Int64 = 0
  private var newestEnd: Int64 = -1
  private var cursor: Double = 0
  private var cursorValid = false
  private var errFiltered: Double = 0

  private(set) var bufferedMs: Double = 0
  private(set) var syncErrorMs: Double = 0
  private(set) var lostSamples: Int64 = 0
  private(set) var starvedSamples: Int64 = 0
  private(set) var resyncs = 0

  var sampleRate: Int { srcRate }

  init() {
    lock = .allocate(capacity: 1)
    lock.initialize(to: os_unfair_lock())
    slotFirst = .allocate(capacity: ringSize)
    slotFirst.initialize(repeating: -1, count: ringSize)
    capacity = ringSize * frame
    samples = .allocate(capacity: capacity)
    samples.initialize(repeating: 0, count: capacity)
  }

  deinit {
    lock.deallocate()
    slotFirst.deallocate()
    samples.deallocate()
  }

  func configure(sampleRate: Int, frameSamples: Int) {
    os_unfair_lock_lock(lock)
    defer { os_unfair_lock_unlock(lock) }
    srcRate = sampleRate
    frame = frameSamples
    if ringSize * frame > capacity {
      samples.deallocate()
      capacity = ringSize * frame
      samples = .allocate(capacity: capacity)
    }
    samples.update(repeating: 0, count: capacity)
    slotFirst.update(repeating: -1, count: ringSize)
    refFirst = -1
    newestEnd = -1
    cursorValid = false
    errFiltered = 0
    bufferedMs = 0
    syncErrorMs = 0
    lostSamples = 0
    starvedSamples = 0
    resyncs = 0
  }

  func push(first: Int64, playAtUs: Int64, pcm: UnsafePointer<Int16>, count: Int) {
    guard first >= 0 else { return }
    os_unfair_lock_lock(lock)
    defer { os_unfair_lock_unlock(lock) }
    let slot = Int((first / Int64(frame)) % Int64(ringSize))
    let n = min(count, frame)
    (samples + slot * frame).update(from: pcm, count: n)
    if n < frame { (samples + slot * frame + n).update(repeating: 0, count: frame - n) }
    slotFirst[slot] = first
    if first >= refFirst {
      refFirst = first
      refPlayUs = playAtUs
    }
    if first + Int64(n) > newestEnd { newestEnd = first + Int64(n) }
  }

  /// Fills `out` with `n` samples at `outRate` that will be heard starting at `startUs`.
  func render(into out: UnsafeMutablePointer<Float>, count n: Int, outRate: Double, startUs: Int64) {
    os_unfair_lock_lock(lock)
    defer { os_unfair_lock_unlock(lock) }
    if refFirst < 0 {
      out.update(repeating: 0, count: n)
      return
    }
    let rate = Double(srcRate)
    let ideal = Double(refFirst) + Double(startUs - refPlayUs) * rate / 1e6
    var err = ideal - cursor
    if !cursorValid || abs(err) > rate * 0.04 {
      if cursorValid { resyncs += 1 }
      cursor = ideal
      cursorValid = true
      errFiltered = 0
      err = 0
    }
    errFiltered += (err - errFiltered) * 0.1
    let correction = min(max(errFiltered / rate / 0.25, -0.005), 0.005)
    let step = rate / outRate * (1 + correction)

    var c = cursor
    for k in 0..<n {
      let i0 = Int64(c.rounded(.down))
      let frac = Float(c - Double(i0))
      if let s0 = sample(at: i0) {
        let s1 = sample(at: i0 + 1) ?? s0
        out[k] = (Float(s0) + (Float(s1) - Float(s0)) * frac) / 32768
      } else {
        if i0 < newestEnd { lostSamples += 1 } else { starvedSamples += 1 }
        out[k] = 0
      }
      c += step
    }
    cursor = c
    bufferedMs = (Double(newestEnd) - cursor) * 1000 / rate
    syncErrorMs = errFiltered * 1000 / rate
  }

  @inline(__always)
  private func sample(at i: Int64) -> Int16? {
    if i < 0 { return nil }
    let slot = Int((i / Int64(frame)) % Int64(ringSize))
    let first = slotFirst[slot]
    let offset = i - first
    if first < 0 || offset < 0 || offset >= Int64(frame) { return nil }
    return samples[slot * frame + Int(offset)]
  }
}
