#!/usr/bin/env bash
# Build signed release artifacts into build_artifacts/.
#
#   ./scripts/release.sh android   signed APK + AAB (needs android/key.properties)
#   ./scripts/release.sh ios       App Store IPA for upload via Transporter (team 8CG36Z5NKK)
#   ./scripts/release.sh install   dev-signed release build installed on the connected iPhone
#   ./scripts/release.sh all       android + ios
#
# Bump `version:` in pubspec.yaml (the +N build number) before every new upload.
set -euo pipefail

cd "$(dirname "$0")/.."
source scripts/lib.sh

target="${1:-}"
version=$(sed -n 's/^version: *//p' pubspec.yaml)
out=build_artifacts
mkdir -p "$out"

if jdk=$(find_java17); then export JAVA_HOME="$jdk"; export PATH="$jdk/bin:$PATH"; fi

release_android() {
  [[ -f android/key.properties ]] || warn "android/key.properties missing: falling back to the debug key"
  step "Android release APK + AAB"
  flutter build apk --release
  flutter build appbundle --release
  cp build/app/outputs/flutter-apk/app-release.apk "$out/CrowdMic-$version.apk"
  cp build/app/outputs/bundle/release/app-release.aab "$out/CrowdMic-$version.aab"
  ok "$out/CrowdMic-$version.{apk,aab}"
}

release_ios() {
  step "iOS App Store IPA"
  flutter build ipa --release --export-options-plist=ios/export/ExportOptions-appstore.plist
  cp build/ios/ipa/*.ipa "$out/CrowdMic-$version.ipa"
  ok "$out/CrowdMic-$version.ipa (upload with Transporter)"
}

install_ios() {
  step "Install on connected iPhone"
  local id
  id=$(xcrun devicectl list devices 2>/dev/null | awk '/iPhone|iPad/ && /available|connected/ {for(i=1;i<=NF;i++) if($i ~ /^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$/){print $i; exit}}')
  [[ -n "$id" ]] || { fail "No available iPhone found (unlock it and check the cable/Wi-Fi pairing)"; exit 1; }
  flutter build ios --release
  xcrun devicectl device install app --device "$id" build/ios/iphoneos/Runner.app
  ok "Installed on $id"
}

case "$target" in
  android) release_android ;;
  ios) release_ios ;;
  install) install_ios ;;
  all) release_android; release_ios ;;
  *) sed -n '2,9p' "$0" | sed 's/^# \{0,1\}//'; exit 1 ;;
esac
