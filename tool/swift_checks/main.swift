// Standalone checks for ios/Runner/PlayoutBuffer.swift and the Downsampler.
// Compiled for macOS by scripts/test.sh; mirrors the Kotlin PlayoutBufferTest.

import Foundation

var failures = 0
func check(_ ok: Bool, _ msg: String) { if !ok { failures += 1; print("FAIL: \(msg)") } }

let rate = 16000, frame = 320, t0: Int64 = 1_000_000_000, wrap = 16384
func push(_ b: PlayoutBuffer, _ from: Int, _ until: Int, shift: Int64 = 0, skip: Set<Int> = []) {
  for k in from..<until where !skip.contains(k) {
    let pcm = (0..<frame).map { Int16((k * frame + $0) % wrap) }
    pcm.withUnsafeBufferPointer { b.push(first: Int64(k * frame), playAtUs: t0 + Int64(k) * 20_000 + shift, pcm: $0.baseAddress!, count: frame) }
  }
}
func value(_ f: Float) -> Int { Int((f * 32768).rounded()) }
func dist(_ a: Int, _ b: Int) -> Int { let d = abs(a - b) % wrap; return min(d, wrap - d) }

// Exact scheduling
do {
  let b = PlayoutBuffer(); b.configure(sampleRate: rate, frameSamples: frame); push(b, 0, 50)
  var out = [Float](repeating: 0, count: 160)
  b.render(into: &out, count: 160, outRate: 16000, startUs: t0 + 100_000)
  check(value(out[0]) == 1600 && value(out[159]) == 1759, "exact: \(value(out[0])) \(value(out[159]))")
}
// Resampling to 48k
do {
  let b = PlayoutBuffer(); b.configure(sampleRate: rate, frameSamples: frame); push(b, 0, 50)
  var out = [Float](repeating: 0, count: 480)
  b.render(into: &out, count: 480, outRate: 48000, startUs: t0 + 100_000)
  check(value(out[0]) == 1600 && value(out[3]) == 1601 && value(out[477]) == 1759, "48k: \(value(out[0])) \(value(out[3])) \(value(out[477]))")
}
// Smooth 3 ms shift
do {
  let b = PlayoutBuffer(); b.configure(sampleRate: rate, frameSamples: frame); push(b, 0, 10)
  var out = [Float](repeating: 0, count: 160)
  var t = t0 + 100_000
  b.render(into: &out, count: 160, outRate: 16000, startUs: t)
  push(b, 10, 260, shift: 3_000)
  var maxStep = 0; var last = value(out[159])
  for _ in 0..<400 { t += 10_000; b.render(into: &out, count: 160, outRate: 16000, startUs: t); maxStep = max(maxStep, dist(value(out[0]), last)); last = value(out[159]) }
  let expected = Int((t - t0 - 3_000) * Int64(rate) / 1_000_000) % wrap
  check(dist(value(out[0]), expected) <= 2 && maxStep <= 2 && b.resyncs == 0, "shift: got \(value(out[0])) want \(expected) step \(maxStep) resyncs \(b.resyncs)")
}
// Missing packet
do {
  let b = PlayoutBuffer(); b.configure(sampleRate: rate, frameSamples: frame); push(b, 0, 30, skip: [10])
  var out = [Float](repeating: 0, count: 160)
  b.render(into: &out, count: 160, outRate: 16000, startUs: t0 + 200_000)
  b.render(into: &out, count: 160, outRate: 16000, startUs: t0 + 210_000)
  check(out.allSatisfy { $0 == 0 } && b.lostSamples >= 320, "missing: lost \(b.lostSamples)")
  b.render(into: &out, count: 160, outRate: 16000, startUs: t0 + 220_000)
  check(value(out[0]) == 11 * frame, "after gap: \(value(out[0]))")
}
// Downsampler: 1 kHz tone passes, 12 kHz tone is removed, timing preserved
do {
  let ds = Downsampler(inRate: 48000, outRate: 16000)
  func tone(_ f: Double, _ n: Int, _ offset: Int) -> [Float] { (0..<n).map { Float(sin(2 * .pi * f * Double($0 + offset) / 48000)) } }
  var out: [Float] = []
  for c in 0..<20 { out += ds.process(tone(1000, 480, c * 480)) }
  check(abs(out.count - 3200) <= 1, "count \(out.count)")
  let peak = out[1000..<3000].map(abs).max()!
  check(peak > 0.95 && peak < 1.05, "1k peak \(peak)")
  // Output j should equal input at frame 3j, delayed by the FIR group delay (16 input frames).
  let j = 2000; let expected = Float(sin(2 * .pi * 1000 * Double(3 * j - 16) / 48000))
  check(abs(out[j] - expected) < 0.05, "phase \(out[j]) vs \(expected)")
  let ds2 = Downsampler(inRate: 48000, outRate: 16000)
  var hi: [Float] = []
  for c in 0..<20 { hi += ds2.process(tone(12000, 480, c * 480)) }
  let hiPeak = hi[1000..<3000].map(abs).max()!
  check(hiPeak < 0.05, "12k leaked \(hiPeak)")
  let ds3 = Downsampler(inRate: 44100, outRate: 16000)
  var n = 0; for _ in 0..<100 { n += ds3.process([Float](repeating: 0, count: 441)).count }
  check(abs(n - 16000) <= 2, "44.1k count \(n)")
}
print(failures == 0 ? "ALL SWIFT CHECKS PASSED" : "\(failures) FAILED")
exit(failures == 0 ? 0 : 1)
