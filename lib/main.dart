import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_scope.dart';
import 'engine/session_engine.dart';
import 'l10n/app_localizations.dart';
import 'platform/audio_backend.dart';
import 'platform/net_backend.dart';
import 'ui/home_screen.dart';
import 'ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = AppPrefs(await SharedPreferences.getInstance());
  final engine = SessionEngine(
    audio: PlatformAudioBackend(),
    net: PlatformNetBackend(),
  );
  try {
    engine.caps = await engine.net.capabilities();
  } catch (_) {}
  engine
    ..displayName = prefs.displayName.isNotEmpty
        ? prefs.displayName
        : (engine.caps.model.isNotEmpty ? engine.caps.model : 'Phone')
    ..outputOffsetMs = prefs.outputOffsetMs
    ..syncDelayMs = prefs.syncDelayMs;

  runApp(PartySyncApp(engine: engine, prefs: prefs));
}

class PartySyncApp extends StatelessWidget {
  const PartySyncApp({super.key, required this.engine, required this.prefs});

  final SessionEngine engine;
  final AppPrefs prefs;

  @override
  Widget build(BuildContext context) {
    return AppScope(
      engine: engine,
      prefs: prefs,
      child: MaterialApp(
        title: 'Crowd Speaker',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) {
          // The engine writes some of its own messages, so give it the strings.
          engine.l10n = AppLocalizations.of(context);
          return child!;
        },
        theme: buildTheme(Brightness.light),
        darkTheme: buildTheme(Brightness.dark),
        home: const HomeScreen(),
      ),
    );
  }
}
