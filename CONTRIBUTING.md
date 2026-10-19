# Contributing to Crowd Speaker

## Get running in 5 minutes

```bash
git clone https://github.com/YogeshV12/party-sync.git
cd party-sync
./scripts/setup.sh      # checks tools, fetches packages, runs analyzer + Dart tests
./scripts/run.sh        # pick a connected phone
```

| Tool | Version | Needed for |
|---|---|---|
| Flutter | 3.47+ | everything |
| JDK | 17 | Android builds, Kotlin tests |
| Android SDK | 36 (minSdk 29) | Android |
| Xcode + CocoaPods | 26+ / 1.16+ | iOS (macOS only) |

`setup.sh` tells you what's missing; it never installs system software.

### Scripts

| Command | What it does |
|---|---|
| `./scripts/setup.sh` | First-time check + `pub get` + analyze + Dart tests (`--quick` skips the checks) |
| `./scripts/run.sh [device-id] [--release]` | Run on a phone with hot reload |
| `./scripts/build.sh android [release]` | Build an APK |
| `./scripts/build.sh ios` / `ios-sim` | iOS device build without signing / Simulator build |
| `./scripts/test.sh` | Analyzer, Dart tests, Kotlin tests, Swift checks |

### iOS signing

The Xcode project is signed with the maintainer's team. To run on your own iPhone, open
`ios/Runner.xcworkspace` → Runner → **Signing & Capabilities** and choose your team. Don't commit that change.

The app uses the **Hotspot Configuration** capability to join Wi-Fi from inside the app,
which needs a paid Apple Developer account. On a free account, remove
`CODE_SIGN_ENTITLEMENTS` from the Runner target locally. Listeners then join the host's Wi-Fi
from the Wi-Fi QR code and tap "I'm already on the host's Wi-Fi".

### Testing on real phones

Emulators and simulators can't do mic, Wi-Fi Direct or Bluetooth, so the real check needs
at least two phones:

1. Phone A: **Be the mic** → Go live.
2. Phone B: **Join as a speaker** → scan A's QR code. You should hear A within a second.
3. Relay: on an Android listener, turn on **Relay to more phones**; a third phone scans its QR code.

When reporting results, include each phone's model, OS version, speaker (phone / Bluetooth
model), and the **Clock sync / Buffer ahead / Packet loss** values from the listener screen.

## How the code is organised

```
lib/
  core/        protocol (wire format), µ-law codec, clock sync, QR payloads   ← pure Dart, unit-tested
  engine/      SessionEngine: host / listener / relay roles, UDP, discovery, failover
  platform/    Dart side of the platform channels (AudioBackend, NetBackend)
  ui/          screens and widgets
android/app/src/main/kotlin/com/partysync/party_sync/
  PartySyncPlugin.kt   channel handlers + permissions
  AudioCapture.kt      mic → timestamped frames
  AudioPlayout.kt      AudioTrack driven by getTimestamp()
  PlayoutBuffer.kt     jitter buffer + drift correction        ← mirrored in Swift
  WifiController.kt    join Wi-Fi, socket pinning, Wi-Fi Direct groups
  KeepAliveService.kt  foreground service + Wi-Fi lock
ios/Runner/
  PartySyncPlugin.swift, AudioCaptureIOS.swift, AudioPlayoutIOS.swift,
  PlayoutBuffer.swift, WifiControllerIOS.swift, WallClock.swift
test/          Dart tests, including a full host → relay → listener run over loopback UDP
tool/swift_checks/   macOS harness for the Swift playout buffer and downsampler
```

Platform channels: `party_sync/audio` (methods), `party_sync/capture` (mic events),
`party_sync/net` (Wi-Fi, permissions, keep-alive). Byte layouts are documented in
`lib/platform/audio_backend.dart`.

### Rules of thumb

- **Timing is wall-clock microseconds everywhere** (Dart `DateTime.now()`, Kotlin `WallClock`,
  Swift `WallClock`). Packets carry *host* time; listeners convert using `ClockSync.offsetUs`.
- **`PlayoutBuffer.kt` and `PlayoutBuffer.swift` must stay identical in behaviour.** Change both,
  and update `PlayoutBufferTest.kt` and `tool/swift_checks/main.swift` together.
- **Relays never decode-and-re-encode.** They forward packets byte for byte; that keeps sync exact at any depth.
- **Protocol changes** bump `protocolVersion` in `lib/core/protocol.dart`. Phones on different versions ignore each other.
- Keep the iOS render callback allocation- and lock-light; heavy work belongs on the capture queue or in Dart.

## Pull requests

1. Branch from `main`: `feature/<short-name>` or `fix/<short-name>`.
2. Run `./scripts/test.sh` before pushing; it must pass.
3. Add or update tests for engine, protocol or playout changes.
4. Describe what you tested on real phones (if anything) in the PR.

Good first areas: Opus codec, chirp-based speaker auto-calibration, WPA3 join on Android,
UI polish for the network tree. See "Known limits" in the README.
