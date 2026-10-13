# Party Sync

One phone is the mic. Every other phone, and the Bluetooth speaker connected to
it, plays the host's voice in sync. Phones that can't reach the host directly
join through **relays**: Android phones that stay connected upstream and share
their own Wi-Fi network downstream.

```
                       HOST (mic + hotspot / app network)
              ┌──────────────┼──────────────┐
          Relay A         Relay B        Listener
       (Android, shares (Android, shares
        its own Wi-Fi)    its own Wi-Fi)
        ┌────┼────┐     ┌────┼────┐
       L     L     L    L    L     L        L = any phone, iPhone or Android
```

## How it works

| Piece | Where | What it does |
|---|---|---|
| Capture | native | Mic → 16 kHz PCM in 20 ms frames, stamped with the capture time (AudioRecord timestamps / AVAudioEngine host time) |
| Encode + send | Dart | µ-law (128 kbps), UDP to every child. Each packet carries **the host-clock time it must play** (capture time + sync delay) |
| Relay | Dart | Forwards packets untouched and answers clock pings *in host time*, so a phone 2 hops away plays at exactly the same moment as one next to the host |
| Clock sync | Dart | NTP-style ping/pong with the parent; the lowest-latency sample in a sliding window wins (±0.1–1 ms on local Wi-Fi) |
| Playout | native | Jitter buffer asks "which sample should be audible *right now*?" using the OS's own output timestamps, which include Bluetooth delay where the OS knows it. Drift is fixed with a ±0.5% speed nudge (inaudible); big jumps resync |
| Tree health | Dart | Every phone reports buffer, loss, battery and route up the tree; the host shows the whole network and broadcasts a map of entry points for one-tap failover |

### Platform-specific features

**Android** (`android/app/src/main/kotlin/com/partysync/party_sync/`)
- `WifiController`: joins the host's network with `WifiNetworkSpecifier` (one-tap system sheet), pins the upstream socket to that Wi-Fi even when mobile data is the default, and creates a **Wi-Fi Direct group** that iPhones and Androids join like a normal hotspot, while staying connected upstream (relay mode).
- `AudioCapture` / `AudioPlayout` / `PlayoutBuffer`: `AudioRecord` with voice processing, and `AudioTrack` scheduled by `getTimestamp()`.
- `KeepAliveService`: foreground service (microphone / media playback) with a low-latency Wi-Fi lock so screen-off power saving doesn't add jitter.

**iOS** (`ios/Runner/`)
- `WifiControllerIOS`: joins the host's network in-app with `NEHotspotConfiguration`.
- `AudioCaptureIOS`: `AVAudioEngine` input with Apple voice processing (echo/noise/AGC), sink-node capture, and a windowed-sinc downsampler.
- `AudioPlayoutIOS` / `PlayoutBuffer`: `AVAudioSourceNode` scheduled from render timestamps and `outputLatency` (includes Bluetooth). It rebuilds itself on route changes and interruptions.
- Background audio (`UIBackgroundModes: audio`), Local Network, mic and camera permission strings.

iPhones can **host** (Personal Hotspot) and **listen**, but can't relay: iOS doesn't let apps create a Wi-Fi network, and an iPhone can't share Wi-Fi while joined to one.

## Running it

Requirements: Flutter 3.47+, Xcode 26+, Android SDK 36, JDK 17.

```bash
./scripts/setup.sh                # check tools, fetch packages, analyze, run tests
./scripts/run.sh                  # pick a connected phone and run
./scripts/build.sh android        # or: ios, ios-sim, all
```

New contributors: start with [CONTRIBUTING.md](CONTRIBUTING.md).

### Android (minSdk 29 / Android 10)
```bash
flutter run -d <android-device-id>
```

### iOS (15+)
1. Open `ios/Runner.xcworkspace` → Runner target → **Signing & Capabilities** and pick your team.
2. The app uses the **Hotspot Configuration** capability (`Runner/Runner.entitlements`) to join Wi-Fi from inside the app. That needs a paid Apple Developer account. On a free account, delete the `CODE_SIGN_ENTITLEMENTS` setting. Listeners then join the host's Wi-Fi by scanning the **Wi-Fi code** with the Camera app and choose "I'm already on the host's Wi-Fi".
3. `flutter run -d <iphone-id>`

### Using it
1. **Host:** Be the mic → Android: "Create a network for me" (no setup), or your normal hotspot (enter its name/password once for the QR code) → Go live.
2. **Listeners:** Join as a speaker → scan the QR code. The app joins the Wi-Fi, finds the host, syncs and plays. Connect a Bluetooth speaker to the phone as usual.
3. **More people than one hotspot holds (about 8–10):** on an Android listener, turn on **Relay to more phones** and let others scan *its* QR code. Up to 3 hops from the mic.
4. If a speaker sounds behind the others, use **Speaker lag correction** on that phone. If sound cuts out, raise the host's **sync delay**.

## Tests

```bash
./scripts/test.sh        # analyzer, Dart tests (incl. a real host → relay → listener run over UDP),
                         # Kotlin playout-buffer tests, Swift playout/downsampler checks (macOS)
./scripts/test.sh dart   # Dart only
```

## Known limits and next steps

- **Not yet tested on real phones.** The tests cover the Dart engine over loopback UDP, the Kotlin and Swift playout buffers, and an iOS Simulator listener joining a host on the Mac. Next: try it on two or three real phones on a hotspot, then add a relay.
- **Same-room echo with Bluetooth:** Bluetooth adds 150–300 ms, so people near a speaker hear the speaker after the live voice. This is fine across rooms or outdoors. Wired or phone speakers are tighter.
- **Codec:** µ-law at 16 kHz is about 128 kbps per listener. Switching to Opus would cut that about 4× (the packet header already has a codec field).
- **Auto-calibration:** the speaker lag correction is set by hand today. Next step: play a chirp on each speaker and measure it with the host mic.
- **Android join** assumes WPA2 or WPA2/WPA3 transition networks. A WPA3-only hotspot needs `setWpa3Passphrase`.
- Android apps can't switch on the system hotspot themselves, which is why "Create a network for me" uses Wi-Fi Direct.
