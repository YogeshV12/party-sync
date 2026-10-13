#!/usr/bin/env bash
# Build Party Sync.
#
#   ./scripts/build.sh android           debug APK  → build/app/outputs/flutter-apk/app-debug.apk
#   ./scripts/build.sh android release   release APK (signed with the debug key until you add your own)
#   ./scripts/build.sh ios               device build without code signing (compile check)
#   ./scripts/build.sh ios-sim           iOS Simulator .app
#   ./scripts/build.sh all               android + ios-sim
set -euo pipefail

cd "$(dirname "$0")/.."
source scripts/lib.sh

target="${1:-}"
mode="${2:-debug}"
[[ "$mode" == "debug" || "$mode" == "release" ]] || { fail "Mode must be debug or release"; exit 1; }

if jdk=$(find_java17); then export JAVA_HOME="$jdk"; fi

build_android() {
  step "Android APK ($mode)"
  flutter build apk "--$mode"
  ok "build/app/outputs/flutter-apk/app-$mode.apk"
}

build_ios() {
  [[ "$(uname)" == "Darwin" ]] || { fail "iOS builds need macOS + Xcode"; exit 1; }
  step "iOS device build ($mode, no codesign)"
  flutter build ios "--$mode" --no-codesign
  ok "build/ios/iphoneos/Runner.app (open ios/Runner.xcworkspace in Xcode to sign and install)"
}

build_ios_sim() {
  [[ "$(uname)" == "Darwin" ]] || { fail "iOS builds need macOS + Xcode"; exit 1; }
  step "iOS Simulator build"
  flutter build ios --simulator --debug
  ok "build/ios/iphonesimulator/Runner.app"
}

case "$target" in
  android) build_android ;;
  ios) build_ios ;;
  ios-sim) build_ios_sim ;;
  all) build_android; build_ios_sim ;;
  *) sed -n '2,8p' "$0" | sed 's/^# \{0,1\}//'; exit 1 ;;
esac
