import AVFoundation
import os

/// Records the host's mic with AVAudioEngine, downsamples to the stream rate
/// and emits fixed frames as [captureWallUs i64][sampleIndex i64][pcm16 LE...],
/// the same layout as Android.
///
/// The real-time sink callback only copies samples into a ring buffer; the
/// filtering and framing happen on a normal queue.
final class AudioCaptureIOS {
  var onFrame: ((Data) -> Void)?

  private var engine: AVAudioEngine?
  private let queue = DispatchQueue(label: "partysync.capture", qos: .userInteractive)
  private var timer: DispatchSourceTimer?
  private let ring = CaptureRing(capacity: 96_000)
  private var downsampler: Downsampler?
  private var pending: [Float] = []
  private var emitted: Int64 = 0
  private var sampleRate = 16000
  private var frameSamples = 320
  private var inRate: Double = 48000

  func start(sampleRate: Int, frameSamples: Int, voiceProcessing: Bool) throws {
    stop()
    self.sampleRate = sampleRate
    self.frameSamples = frameSamples

    let session = AVAudioSession.sharedInstance()
    // voiceChat enables Apple's echo cancellation, noise suppression and AGC.
    try session.setCategory(.playAndRecord,
                            mode: voiceProcessing ? .voiceChat : .default,
                            options: [.allowBluetoothHFP, .defaultToSpeaker])
    try? session.setPreferredIOBufferDuration(0.01)
    try session.setActive(true)

    let engine = AVAudioEngine()
    let input = engine.inputNode
    if voiceProcessing { try? input.setVoiceProcessingEnabled(true) }
    let format = input.outputFormat(forBus: 0)
    guard format.sampleRate > 0, format.channelCount > 0 else {
      throw NSError(domain: "PartySync", code: 2,
                    userInfo: [NSLocalizedDescriptionKey: "No microphone is available."])
    }
    inRate = format.sampleRate
    downsampler = Downsampler(inRate: inRate, outRate: Double(sampleRate))
    queue.sync {
      pending.removeAll()
      emitted = 0
    }
    ring.reset()

    let ring = self.ring
    let inputLatencyUs = Int64(session.inputLatency * 1e6)
    let sink = AVAudioSinkNode { timestamp, frameCount, audioBufferList in
      let list = UnsafeMutableAudioBufferListPointer(UnsafeMutablePointer(mutating: audioBufferList))
      guard let data = list[0].mData?.assumingMemoryBound(to: Float.self) else { return noErr }
      let ts = timestamp.pointee
      let capturedUs = (ts.mFlags.contains(.hostTimeValid)
        ? WallClock.wallUs(fromHostTime: ts.mHostTime)
        : WallClock.nowUs()) - inputLatencyUs
      ring.write(data, count: Int(frameCount), firstFrameWallUs: capturedUs)
      return noErr
    }
    engine.attach(sink)
    engine.connect(input, to: sink, format: format)
    engine.prepare()
    try engine.start()
    self.engine = engine

    let timer = DispatchSource.makeTimerSource(queue: queue)
    timer.schedule(deadline: .now() + .milliseconds(10), repeating: .milliseconds(10))
    timer.setEventHandler { [weak self] in self?.drain() }
    timer.resume()
    self.timer = timer
  }

  func stop() {
    timer?.cancel()
    timer = nil
    engine?.stop()
    engine = nil
    queue.sync {}
  }

  private func drain() {
    guard let chunk = ring.read(), let downsampler else { return }
    pending.append(contentsOf: downsampler.process(chunk.samples))
    let ratio = inRate / Double(sampleRate)
    while pending.count >= frameSamples {
      // Output sample `emitted` sits at input frame emitted * ratio.
      let inputFrame = Double(emitted) * ratio
      let wallUs = chunk.anchorWallUs
        + Int64((inputFrame - Double(chunk.anchorFrame)) / inRate * 1e6)
      var data = Data(count: 16 + frameSamples * 2)
      data.withUnsafeMutableBytes { raw in
        raw.storeBytes(of: wallUs.littleEndian, toByteOffset: 0, as: Int64.self)
        raw.storeBytes(of: emitted.littleEndian, toByteOffset: 8, as: Int64.self)
        for i in 0..<frameSamples {
          let v = max(-1, min(1, pending[i]))
          raw.storeBytes(of: Int16(v * 32767).littleEndian, toByteOffset: 16 + i * 2, as: Int16.self)
        }
      }
      pending.removeFirst(frameSamples)
      emitted += Int64(frameSamples)
      onFrame?(data)
    }
  }
}

/// Single-producer (audio thread) / single-consumer ring of mic samples that
/// also remembers which input frame was captured at which wall time.
final class CaptureRing {
  private let lock: UnsafeMutablePointer<os_unfair_lock>
  private let data: UnsafeMutablePointer<Float>
  private let capacity: Int
  private var writeIndex: Int64 = 0
  private var readIndex: Int64 = 0
  private var anchorFrame: Int64 = 0
  private var anchorWallUs: Int64 = 0
  private var hasAnchor = false

  init(capacity: Int) {
    self.capacity = capacity
    lock = .allocate(capacity: 1)
    lock.initialize(to: os_unfair_lock())
    data = .allocate(capacity: capacity)
    data.initialize(repeating: 0, count: capacity)
  }

  deinit {
    lock.deallocate()
    data.deallocate()
  }

  func reset() {
    os_unfair_lock_lock(lock)
    writeIndex = 0
    readIndex = 0
    hasAnchor = false
    os_unfair_lock_unlock(lock)
  }

  func write(_ src: UnsafePointer<Float>, count: Int, firstFrameWallUs: Int64) {
    os_unfair_lock_lock(lock)
    anchorFrame = writeIndex
    anchorWallUs = firstFrameWallUs
    hasAnchor = true
    for i in 0..<count {
      data[Int((writeIndex + Int64(i)) % Int64(capacity))] = src[i]
    }
    writeIndex += Int64(count)
    if writeIndex - readIndex > Int64(capacity) { readIndex = writeIndex - Int64(capacity) }
    os_unfair_lock_unlock(lock)
  }

  func read() -> (samples: [Float], anchorFrame: Int64, anchorWallUs: Int64)? {
    os_unfair_lock_lock(lock)
    defer { os_unfair_lock_unlock(lock) }
    let n = Int(writeIndex - readIndex)
    guard n > 0, hasAnchor else { return nil }
    var out = [Float](repeating: 0, count: n)
    for i in 0..<n {
      out[i] = data[Int((readIndex + Int64(i)) % Int64(capacity))]
    }
    readIndex = writeIndex
    return (out, anchorFrame, anchorWallUs)
  }
}

/// Windowed-sinc low-pass followed by fractional decimation, e.g. 48 kHz →
/// 16 kHz. Output sample j corresponds to input frame j × (inRate / outRate).
final class Downsampler {
  private let ratio: Double
  private let taps: [Float]
  private var history: [Float]
  private var pos: Double

  init(inRate: Double, outRate: Double) {
    ratio = inRate / outRate
    let count = 33
    let cutoff = min(0.45 * outRate / inRate, 0.45) // cycles per input sample
    let m = Double(count - 1)
    var t = [Float](repeating: 0, count: count)
    for i in 0..<count {
      let x = Double(i) - m / 2
      let sinc = x == 0 ? 2 * cutoff : sin(2 * .pi * cutoff * x) / (.pi * x)
      let blackman = 0.42 - 0.5 * cos(2 * .pi * Double(i) / m) + 0.08 * cos(4 * .pi * Double(i) / m)
      t[i] = Float(sinc * blackman)
    }
    let sum = t.reduce(0, +)
    taps = t.map { $0 / sum }
    history = [Float](repeating: 0, count: count)
    pos = Double(count)
  }

  func process(_ input: [Float]) -> [Float] {
    let buf = history + input
    let tapCount = taps.count
    var out: [Float] = []
    out.reserveCapacity(Int(Double(input.count) / ratio) + 2)
    func filtered(_ k: Int) -> Float {
      var acc: Float = 0
      for j in 0..<tapCount { acc += taps[j] * buf[k - j] }
      return acc
    }
    while Int(pos) + 1 < buf.count {
      let i = Int(pos)
      let frac = Float(pos - Double(i))
      let a = filtered(i)
      let b = filtered(i + 1)
      out.append(a + (b - a) * frac)
      pos += ratio
    }
    let drop = buf.count - tapCount
    history = Array(buf[drop...])
    pos -= Double(drop)
    return out
  }
}
