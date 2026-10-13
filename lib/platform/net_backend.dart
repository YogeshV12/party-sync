import 'package:flutter/services.dart';

enum AppPermission { microphone, notifications, wifi }

/// What this phone can do in a session.
class DeviceCaps {
  const DeviceCaps({
    required this.platform,
    required this.model,
    required this.canCreateNetwork,
    required this.canRelay,
  });

  static const unknown = DeviceCaps(
      platform: 'unknown', model: '', canCreateNetwork: false, canRelay: false);

  /// 'android' or 'ios'.
  final String platform;
  final String model;

  /// Android: can spin up its own Wi-Fi network (Wi-Fi Direct group).
  final bool canCreateNetwork;

  /// Can stay connected upstream while sharing a network downstream.
  final bool canRelay;

  bool get isAndroid => platform == 'android';
  bool get isIOS => platform == 'ios';

  static DeviceCaps fromMap(Map<Object?, Object?> m) => DeviceCaps(
        platform: m['platform'] as String? ?? 'unknown',
        model: m['model'] as String? ?? '',
        canCreateNetwork: m['canCreateNetwork'] as bool? ?? false,
        canRelay: m['canRelay'] as bool? ?? false,
      );
}

class HostedNetwork {
  const HostedNetwork({required this.ssid, required this.password, required this.ip});
  final String ssid;
  final String password;
  final String ip;
}

abstract class NetBackend {
  Future<DeviceCaps> capabilities();
  Future<Map<AppPermission, bool>> requestPermissions(Set<AppPermission> permissions);

  /// Connects to a Wi-Fi network. The OS shows its own confirmation prompt.
  Future<void> joinWifi(String ssid, String password);
  Future<void> leaveWifi();

  /// Runs [open] with new sockets routed over Wi-Fi. On Android a Wi-Fi without
  /// internet is not the default network, so the upstream socket must be pinned
  /// to it; sockets created afterwards (a relay's downstream) stay unpinned so
  /// they can reach the phone's own hotspot clients.
  Future<T> withUpstreamBinding<T>(Future<T> Function() open);

  /// Android only: creates a Wi-Fi network (Wi-Fi Direct group) other phones,
  /// including iPhones, join like a normal hotspot.
  Future<HostedNetwork> createNetwork({required String name, required String password});
  Future<void> removeNetwork();

  /// Returns false if the platform can't open hotspot settings directly.
  Future<bool> openHotspotSettings();
  Future<int?> batteryLevel();

  /// Keeps the session running with the screen off (Android foreground
  /// service + Wi-Fi lock; iOS relies on background audio).
  Future<void> startKeepAlive({required bool microphone, required String text});
  Future<void> stopKeepAlive();
}

class PlatformNetBackend implements NetBackend {
  static const _channel = MethodChannel('party_sync/net');

  @override
  Future<DeviceCaps> capabilities() async {
    final m = await _channel.invokeMapMethod<Object?, Object?>('capabilities');
    return m == null ? DeviceCaps.unknown : DeviceCaps.fromMap(m);
  }

  @override
  Future<Map<AppPermission, bool>> requestPermissions(
      Set<AppPermission> permissions) async {
    final result = await _channel.invokeMapMethod<String, bool>(
        'requestPermissions', [for (final p in permissions) p.name]);
    return {
      for (final p in permissions) p: result?[p.name] ?? false,
    };
  }

  @override
  Future<void> joinWifi(String ssid, String password) =>
      _channel.invokeMethod('joinWifi', {'ssid': ssid, 'password': password});

  @override
  Future<void> leaveWifi() => _channel.invokeMethod('leaveWifi');

  @override
  Future<T> withUpstreamBinding<T>(Future<T> Function() open) async {
    await _channel.invokeMethod('bindProcessToWifi');
    try {
      return await open();
    } finally {
      await _channel.invokeMethod('unbindProcess');
    }
  }

  @override
  Future<HostedNetwork> createNetwork(
      {required String name, required String password}) async {
    final m = await _channel.invokeMapMethod<String, Object?>(
        'createNetwork', {'name': name, 'password': password});
    if (m == null) throw PlatformException(code: 'network', message: 'No network info');
    return HostedNetwork(
      ssid: m['ssid'] as String,
      password: m['password'] as String,
      ip: m['ip'] as String,
    );
  }

  @override
  Future<void> removeNetwork() => _channel.invokeMethod('removeNetwork');

  @override
  Future<bool> openHotspotSettings() async =>
      await _channel.invokeMethod<bool>('openHotspotSettings') ?? false;

  @override
  Future<int?> batteryLevel() => _channel.invokeMethod<int>('battery');

  @override
  Future<void> startKeepAlive({required bool microphone, required String text}) =>
      _channel.invokeMethod('startKeepAlive', {'microphone': microphone, 'text': text});

  @override
  Future<void> stopKeepAlive() => _channel.invokeMethod('stopKeepAlive');
}
