#!/usr/bin/env bash
# Run CrowdMic on a connected phone, emulator or simulator.
#
#   ./scripts/run.sh                  list devices and pick one
#   ./scripts/run.sh <device-id>      run on that device (debug, hot reload)
#   ./scripts/run.sh <device-id> --release
#
# You need at least two phones to hear anything: one host, one listener.
# Mic, Wi-Fi Direct and Bluetooth don't work in emulators/simulators.
set -euo pipefail

cd "$(dirname "$0")/.."
source scripts/lib.sh

if jdk=$(find_java17); then export JAVA_HOME="$jdk"; fi

device="${1:-}"
shift || true

if [[ -z "$device" ]]; then
  step "Connected devices"
  flutter devices
  echo
  read -rp "Device id to run on: " device
fi

step "Running on $device"
flutter run -d "$device" "$@"
