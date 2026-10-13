import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'engine/session_engine.dart';

/// Small typed wrapper over saved settings.
class AppPrefs {
  AppPrefs(this._prefs);
  final SharedPreferences _prefs;

  String get displayName => _prefs.getString('displayName') ?? '';
  set displayName(String v) => _prefs.setString('displayName', v);

  String get hotspotSsid => _prefs.getString('hotspotSsid') ?? '';
  set hotspotSsid(String v) => _prefs.setString('hotspotSsid', v);

  String get hotspotPassword => _prefs.getString('hotspotPassword') ?? '';
  set hotspotPassword(String v) => _prefs.setString('hotspotPassword', v);

  double get outputOffsetMs => _prefs.getDouble('outputOffsetMs') ?? 0;
  set outputOffsetMs(double v) => _prefs.setDouble('outputOffsetMs', v);

  int get syncDelayMs =>
      _prefs.getInt('syncDelayMs') ?? SessionConfig.defaultSyncDelayMs;
  set syncDelayMs(int v) => _prefs.setInt('syncDelayMs', v);

  bool get voiceProcessing => _prefs.getBool('voiceProcessing') ?? true;
  set voiceProcessing(bool v) => _prefs.setBool('voiceProcessing', v);
}

class AppScope extends InheritedWidget {
  const AppScope({
    super.key,
    required this.engine,
    required this.prefs,
    required super.child,
  });

  final SessionEngine engine;
  final AppPrefs prefs;

  static AppScope of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppScope>()!;

  @override
  bool updateShouldNotify(AppScope oldWidget) =>
      engine != oldWidget.engine || prefs != oldWidget.prefs;
}
