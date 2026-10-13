import AVFoundation
import Flutter
import UIKit

/// Bridges the Dart session engine to iOS audio and Wi-Fi.
///
///   party_sync/audio   (methods)  capture + scheduled playback
///   party_sync/capture (events)   mic frames for the host
///   party_sync/net     (methods)  Wi-Fi join, permissions, device info
///
/// iPhones can't host a network while joined to one, so relay and
/// "create network" calls report unsupported; the Dart side hides them.
final class PartySyncPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
  private var captureSink: FlutterEventSink?
  private var capture: AudioCaptureIOS?
  private var playout: AudioPlayoutIOS?
  private var outputOffsetUs: Int64 = 0
  private let wifi = WifiControllerIOS()
  private var scratch = UnsafeMutablePointer<Int16>.allocate(capacity: 4096)
  private var scratchCapacity = 4096

  static func register(with registrar: FlutterPluginRegistrar) {
    WallClock.prime()
    let instance = PartySyncPlugin()
    let messenger = registrar.messenger()
    FlutterMethodChannel(name: "party_sync/audio", binaryMessenger: messenger)
      .setMethodCallHandler { call, result in instance.handleAudio(call, result) }
    FlutterMethodChannel(name: "party_sync/net", binaryMessenger: messenger)
      .setMethodCallHandler { call, result in instance.handleNet(call, result) }
    FlutterEventChannel(name: "party_sync/capture", binaryMessenger: messenger)
      .setStreamHandler(instance)
  }

  deinit {
    scratch.deallocate()
  }

  func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    captureSink = events
    return nil
  }

  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    captureSink = nil
    return nil
  }

  // MARK: Audio

  private func handleAudio(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    let args = call.arguments as? [String: Any]
    do {
      switch call.method {
      case "startCapture":
        capture?.stop()
        let c = AudioCaptureIOS()
        c.onFrame = { [weak self] data in
          DispatchQueue.main.async { self?.captureSink?(FlutterStandardTypedData(bytes: data)) }
        }
        try c.start(sampleRate: args?["sampleRate"] as? Int ?? 16000,
                    frameSamples: args?["frameSamples"] as? Int ?? 320,
                    voiceProcessing: args?["voiceProcessing"] as? Bool ?? true)
        capture = c
        result(nil)
      case "stopCapture":
        capture?.stop()
        capture = nil
        result(nil)
      case "startPlayback":
        playout?.stop()
        let p = AudioPlayoutIOS()
        p.userOffsetUs = outputOffsetUs
        try p.start(sampleRate: args?["sampleRate"] as? Int ?? 16000,
                    frameSamples: args?["frameSamples"] as? Int ?? 320)
        playout = p
        result(nil)
      case "stopPlayback":
        playout?.stop()
        playout = nil
        result(nil)
      case "push":
        if let typed = call.arguments as? FlutterStandardTypedData { push(typed.data) }
        result(nil)
      case "setOutputOffset":
        outputOffsetUs = Int64(((args?["ms"] as? Double) ?? 0) * 1000)
        playout?.userOffsetUs = outputOffsetUs
        result(nil)
      case "stats":
        result(playout?.stats() ?? [:])
      default:
        result(FlutterMethodNotImplemented)
      }
    } catch {
      result(FlutterError(code: "audio", message: error.localizedDescription, details: nil))
    }
  }

  /// [firstSample i64][playAtUs i64][pcm16 LE...]
  private func push(_ data: Data) {
    guard let playout, data.count >= 16 else { return }
    let count = (data.count - 16) / 2
    if count > scratchCapacity {
      scratch.deallocate()
      scratch = .allocate(capacity: count)
      scratchCapacity = count
    }
    data.withUnsafeBytes { raw in
      let first = Int64(littleEndian: raw.loadUnaligned(fromByteOffset: 0, as: Int64.self))
      let playAt = Int64(littleEndian: raw.loadUnaligned(fromByteOffset: 8, as: Int64.self))
      for i in 0..<count {
        scratch[i] = Int16(littleEndian: raw.loadUnaligned(fromByteOffset: 16 + i * 2, as: Int16.self))
      }
      playout.buffer.push(first: first, playAtUs: playAt, pcm: scratch, count: count)
    }
  }

  // MARK: Network & device

  private func handleNet(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    let args = call.arguments as? [String: Any]
    switch call.method {
    case "capabilities":
      result([
        "platform": "ios",
        "model": UIDevice.current.model,
        "canCreateNetwork": false,
        "canRelay": false,
      ])
    case "requestPermissions":
      requestPermissions(call.arguments as? [String] ?? [], completion: result)
    case "joinWifi":
      wifi.join(ssid: args?["ssid"] as? String ?? "",
                password: args?["password"] as? String ?? "") { error in
        result(error.map { FlutterError(code: "wifi", message: $0, details: nil) })
      }
    case "leaveWifi":
      wifi.leave()
      result(nil)
    case "bindProcessToWifi":
      // iOS routes local-subnet traffic over Wi-Fi even when cellular is on.
      result(true)
    case "unbindProcess", "removeNetwork", "stopKeepAlive":
      result(nil)
    case "startKeepAlive":
      // Background audio (UIBackgroundModes: audio) keeps the session alive.
      result(nil)
    case "createNetwork":
      result(FlutterError(code: "unsupported",
                          message: "iPhones can't create a network for other phones. Use Personal Hotspot instead.",
                          details: nil))
    case "openHotspotSettings":
      result(false)
    case "battery":
      UIDevice.current.isBatteryMonitoringEnabled = true
      let level = UIDevice.current.batteryLevel
      result(level < 0 ? nil : Int(level * 100))
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func requestPermissions(_ names: [String], completion: @escaping FlutterResult) {
    var granted: [String: Bool] = [:]
    for name in names where name != "microphone" { granted[name] = true }
    guard names.contains("microphone") else {
      completion(granted)
      return
    }
    let base = granted
    let finish: (Bool) -> Void = { ok in
      DispatchQueue.main.async {
        var all = base
        all["microphone"] = ok
        completion(all)
      }
    }
    if #available(iOS 17.0, *) {
      AVAudioApplication.requestRecordPermission(completionHandler: finish)
    } else {
      AVAudioSession.sharedInstance().requestRecordPermission(finish)
    }
  }
}
