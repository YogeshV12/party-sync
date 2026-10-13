import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart' show debugPrint;

/// Connection diagnostics: `adb logcat -s flutter` (or `flutter logs`).
void trace(String message) => debugPrint('[PS] $message');

/// Wall-clock microseconds. This is the shared local timebase between Dart and
/// the native audio engines (both read the same realtime clock).
int nowUs() => DateTime.now().microsecondsSinceEpoch;

final Random _random = Random.secure();

String randomId() {
  const hex = '0123456789abcdef';
  return List.generate(12, (_) => hex[_random.nextInt(16)]).join();
}

int randomSessionId() => 1 + _random.nextInt(0x7FFFFFFE);

/// Easy to read aloud and type: no 0/O, 1/l/I.
String randomPassword([int length = 10]) {
  const alphabet = 'abcdefghjkmnpqrstuvwxyz23456789';
  return List.generate(length, (_) => alphabet[_random.nextInt(alphabet.length)])
      .join();
}

/// WPA2 passphrases are 8-63 characters (empty means an open network). Android
/// rejects anything else outright, before the join sheet can appear.
bool isValidWifiPassword(String password) =>
    password.isEmpty || (password.length >= 8 && password.length <= 63);

/// Wi-Fi Direct groups must be named "DIRECT-xy..." on Android.
String groupNetworkName(String displayName) {
  final clean = displayName.replaceAll(RegExp(r'[^A-Za-z0-9_-]'), '');
  final suffix = clean.isEmpty ? randomPassword(4) : clean;
  final name = 'DIRECT-PS-$suffix';
  return name.length > 30 ? name.substring(0, 30) : name;
}

const _ignoredInterfacePrefixes = [
  'lo', 'rmnet', 'ccmni', 'pdp_ip', 'v4-', 'clat', 'tun', 'utun', 'ipsec', //
  'dummy', 'llw', 'awdl', 'anpi', 'ap_br_', 'radio', 'ifb', 'umts',
];

bool _isLocalLanInterface(String name) =>
    !_ignoredInterfacePrefixes.any((p) => name.startsWith(p));

/// IPv4 addresses this phone can be reached on by nearby devices, with
/// hotspot-style interfaces first (ap0, swlan0, bridge100, p2p-...).
Future<List<String>> localLanAddresses() async {
  final List<NetworkInterface> interfaces;
  try {
    interfaces = await NetworkInterface.list(
      includeLoopback: false,
      type: InternetAddressType.IPv4,
    );
  } catch (_) {
    return const [];
  }
  int rank(String name) {
    if (name.startsWith('ap') || name.startsWith('swlan') ||
        name.startsWith('softap') || name.startsWith('bridge') ||
        name.startsWith('p2p') || name == 'wlan1') {
      return 0;
    }
    return 1;
  }

  final usable = interfaces.where((i) => _isLocalLanInterface(i.name)).toList()
    ..sort((a, b) => rank(a.name).compareTo(rank(b.name)));
  return [
    for (final i in usable)
      for (final a in i.addresses)
        if (!a.isLinkLocal) a.address,
  ];
}

/// Where a listener should look for its parent: addresses from the QR code,
/// the likely gateway of each local subnet, then well-known hotspot gateways
/// (Android Wi-Fi Direct, iPhone Personal Hotspot, legacy Android hotspot).
Future<List<String>> discoveryCandidates(List<String> hinted) async {
  final own = await localLanAddresses();
  final out = <String>{};
  for (final h in hinted) {
    if (InternetAddress.tryParse(h) != null) out.add(h);
  }
  for (final a in own) {
    final parts = a.split('.');
    if (parts.length == 4) out.add('${parts[0]}.${parts[1]}.${parts[2]}.1');
  }
  out.addAll(const ['192.168.49.1', '172.20.10.1', '192.168.43.1']);
  out.removeAll(own);
  return out.toList();
}

/// Every other address in each local /24, used as a last-resort search when
/// the hotspot hands out an unusual gateway address.
Future<List<String>> subnetSweepTargets() async {
  final own = await localLanAddresses();
  final out = <String>{};
  for (final a in own) {
    final parts = a.split('.');
    if (parts.length != 4) continue;
    final prefix = '${parts[0]}.${parts[1]}.${parts[2]}';
    for (var i = 1; i < 255; i++) {
      out.add('$prefix.$i');
    }
  }
  out.removeAll(own);
  return out.toList();
}
