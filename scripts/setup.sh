#!/usr/bin/env bash
# One-time setup for CrowdMic development.
#
#   ./scripts/setup.sh            check tools, fetch packages, analyze, run Dart tests
#   ./scripts/setup.sh --quick    check tools and fetch packages only
#
# Safe to re-run. It never installs system software; it tells you what's missing.
set -euo pipefail

cd "$(dirname "$0")/.."
source scripts/lib.sh

QUICK=false
[[ "${1:-}" == "--quick" ]] && QUICK=true

step "Checking required tools"
missing=0

if have flutter; then
  ok "Flutter $(flutter --version --machine 2>/dev/null | sed -n 's/.*"frameworkVersion": *"\([^"]*\)".*/\1/p')"
  require_flutter_version || missing=1
else
  fail "Flutter not found. Install: https://docs.flutter.dev/get-started/install"
  missing=1
fi

if find_java17 >/dev/null; then
  ok "JDK 17 at $(find_java17)"
else
  warn "JDK 17 not found (needed for Android builds and Kotlin tests)."
  warn "  macOS: brew install openjdk@17   Linux: install openjdk-17-jdk"
  warn "  Then: flutter config --jdk-dir=<path-to-jdk17>"
fi

if have flutter; then
  if flutter doctor 2>/dev/null | grep -q "\[✓\] Android toolchain\|\[!\] Android toolchain"; then
    ok "Android SDK found"
    if flutter doctor 2>/dev/null | grep -q "Android licenses not accepted"; then
      warn "Some Android SDK licenses are not accepted. Run: flutter doctor --android-licenses"
    fi
  else
    warn "Android SDK not found (needed for Android). Install Android Studio or the command-line tools."
  fi
fi

if [[ "$(uname)" == "Darwin" ]]; then
  if have xcodebuild; then ok "$(xcodebuild -version | head -1)"; else warn "Xcode not found (needed for iOS)."; fi
  if have pod; then ok "CocoaPods $(pod --version)"; else warn "CocoaPods not found (brew install cocoapods)."; fi
else
  warn "Not on macOS: iOS builds are unavailable, Android and Dart work fine."
fi

[[ $missing -eq 0 ]] || { fail "Fix the items above, then re-run."; exit 1; }

step "Fetching Dart packages"
flutter pub get

if $QUICK; then
  ok "Setup done (quick)."
  exit 0
fi

step "Static analysis"
flutter analyze

step "Dart tests (includes a host → relay → listener run over local UDP)"
flutter test

cat <<EOF

$(ok "Setup complete.")

Next:
  ./scripts/run.sh                 pick a connected phone and run the app
  ./scripts/test.sh                Dart + Kotlin unit tests
  ./scripts/build.sh android       build an APK
  ./scripts/build.sh ios           build for iOS (no signing)

See CONTRIBUTING.md for how the code is organised.
EOF
