import AVFoundation

/// Values the render thread reads; kept outside the engine owner so the audio
/// callback never touches `self`.
final class PlayoutTiming {
  var userOffsetUs: Int64 = 0
  var outputLatencyUs: Int64 = 0
}

/// Plays the PlayoutBuffer through AVAudioEngine. Each render callback knows
/// the host time its buffer goes out; adding the session's output latency
/// (which includes Bluetooth delay on iOS) gives the moment it is heard.
final class AudioPlayoutIOS {
  let buffer = PlayoutBuffer()
  private let timing = PlayoutTiming()
  private var engine: AVAudioEngine?
  private var observers: [NSObjectProtocol] = []
  private var running = false

  var userOffsetUs: Int64 {
    get { timing.userOffsetUs }
    set { timing.userOffsetUs = newValue }
  }

  func start(sampleRate: Int, frameSamples: Int) throws {
    stop()
    buffer.configure(sampleRate: sampleRate, frameSamples: frameSamples)
    let session = AVAudioSession.sharedInstance()
    // .playback routes to Bluetooth A2DP speakers and keeps playing in the
    // background (UIBackgroundModes: audio).
    try session.setCategory(.playback, mode: .default, options: [])
    try session.setActive(true)
    running = true
    try buildEngine()
    observe()
  }

  func stop() {
    running = false
    for observer in observers { NotificationCenter.default.removeObserver(observer) }
    observers.removeAll()
    engine?.stop()
    engine = nil
    try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
  }

  private func buildEngine() throws {
    let session = AVAudioSession.sharedInstance()
    let engine = AVAudioEngine()
    let hardware = engine.outputNode.outputFormat(forBus: 0)
    let rate = hardware.sampleRate > 0 ? hardware.sampleRate : session.sampleRate
    guard let format = AVAudioFormat(standardFormatWithSampleRate: rate, channels: 1) else {
      throw NSError(domain: "PartySync", code: 1,
                    userInfo: [NSLocalizedDescriptionKey: "Unsupported output format"])
    }
    refreshLatency()

    let buffer = self.buffer
    let timing = self.timing
    let source = AVAudioSourceNode(format: format) { _, timestamp, frameCount, audioBufferList in
      let list = UnsafeMutableAudioBufferListPointer(audioBufferList)
      guard let out = list[0].mData?.assumingMemoryBound(to: Float.self) else { return noErr }
      let ts = timestamp.pointee
      let outputUs = ts.mFlags.contains(.hostTimeValid)
        ? WallClock.wallUs(fromHostTime: ts.mHostTime)
        : WallClock.nowUs()
      let heardUs = outputUs + timing.outputLatencyUs
      buffer.render(into: out, count: Int(frameCount), outRate: rate,
                    startUs: heardUs + timing.userOffsetUs)
      return noErr
    }
    engine.attach(source)
    engine.connect(source, to: engine.mainMixerNode, format: format)
    engine.prepare()
    try engine.start()
    self.engine = engine
  }

  private func refreshLatency() {
    timing.outputLatencyUs = Int64(AVAudioSession.sharedInstance().outputLatency * 1e6)
  }

  private func rebuild() {
    guard running else { return }
    engine?.stop()
    engine = nil
    try? buildEngine()
  }

  private func observe() {
    let center = NotificationCenter.default
    let session = AVAudioSession.sharedInstance()
    observers.append(center.addObserver(
      forName: AVAudioSession.routeChangeNotification, object: session, queue: .main
    ) { [weak self] _ in self?.refreshLatency() })
    observers.append(center.addObserver(
      forName: AVAudioSession.interruptionNotification, object: session, queue: .main
    ) { [weak self] note in
      guard let raw = note.userInfo?[AVAudioSessionInterruptionTypeKey] as? UInt,
            AVAudioSession.InterruptionType(rawValue: raw) == .ended else { return }
      try? AVAudioSession.sharedInstance().setActive(true)
      self?.rebuild()
    })
    // A new Bluetooth speaker can change the hardware format; the engine
    // stops itself and must be rebuilt.
    observers.append(center.addObserver(
      forName: .AVAudioEngineConfigurationChange, object: nil, queue: .main
    ) { [weak self] note in
      guard let self, (note.object as? AVAudioEngine) === self.engine else { return }
      self.refreshLatency()
      self.rebuild()
    })
    observers.append(center.addObserver(
      forName: AVAudioSession.mediaServicesWereResetNotification, object: session, queue: .main
    ) { [weak self] _ in self?.rebuild() })
  }

  func stats() -> [String: Any] {
    let port = AVAudioSession.sharedInstance().currentRoute.outputs.first
    let kind: String
    switch port?.portType {
    case .some(.bluetoothA2DP), .some(.bluetoothHFP): kind = "bluetooth"
    case .some(.bluetoothLE): kind = "bluetooth-le"
    case .some(.builtInSpeaker), .some(.builtInReceiver): kind = "speaker"
    case .some(.headphones), .some(.lineOut): kind = "wired"
    case .some(.usbAudio): kind = "usb"
    case .some(.airPlay): kind = "airplay"
    case .some(.HDMI): kind = "hdmi"
    default: kind = "other"
    }
    let ms = 1000.0 / Double(buffer.sampleRate)
    return [
      "route": kind == "speaker" ? "Phone speaker" : (port?.portName ?? ""),
      "routeKind": kind,
      "outputLatencyMs": Double(timing.outputLatencyUs) / 1000,
      "bufferedMs": buffer.bufferedMs,
      "syncErrorMs": buffer.syncErrorMs,
      "lostMs": Double(buffer.lostSamples) * ms,
      "starvedMs": Double(buffer.starvedSamples) * ms,
      "resyncs": buffer.resyncs,
    ]
  }
}
