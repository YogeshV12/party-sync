#!/usr/bin/env bash
# Run every automated check: analyzer, Dart tests, Kotlin unit tests, and
# (on macOS) the Swift playout-buffer/downsampler checks.
#
#   ./scripts/test.sh            everything available on this machine
#   ./scripts/test.sh dart       analyzer + Dart tests only
set -euo pipefail

cd "$(dirname "$0")/.."
source scripts/lib.sh

only="${1:-all}"

step "Static analysis"
flutter analyze

step "Dart tests"
flutter test

[[ "$only" == "dart" ]] && exit 0

step "Kotlin unit tests (android/app/src/test)"
if jdk=$(find_java17); then
  # gradlew is git-ignored; a fresh clone needs Flutter to generate it.
  [[ -x android/gradlew ]] || JAVA_HOME="$jdk" flutter build apk --config-only
  (cd android && JAVA_HOME="$jdk" ./gradlew :app:testDebugUnitTest --console=plain -q)
  ok "Kotlin tests passed"
else
  warn "Skipped: JDK 17 not found (see scripts/setup.sh)"
fi

if [[ "$(uname)" == "Darwin" ]] && have xcrun; then
  step "Swift checks (ios/Runner/PlayoutBuffer.swift + Downsampler)"
  tmp=$(mktemp -d)
  trap 'rm -rf "$tmp"' EXIT
  { echo "import Foundation"; awk '/^final class Downsampler/,0' ios/Runner/AudioCaptureIOS.swift; } > "$tmp/Downsampler.swift"
  xcrun swiftc -O -o "$tmp/check" ios/Runner/PlayoutBuffer.swift "$tmp/Downsampler.swift" tool/swift_checks/main.swift
  "$tmp/check"
fi

ok "All checks passed"
