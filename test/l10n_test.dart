import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:party_sync/l10n/app_localizations.dart';
import 'package:party_sync/ui/widgets/common.dart';

Widget _app(Locale locale, Widget child) => MaterialApp(
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: child),
    );

void main() {
  test('ships at least 25 languages', () {
    expect(AppLocalizations.supportedLocales.length, greaterThanOrEqualTo(25));
  });

  for (final locale in AppLocalizations.supportedLocales) {
    test('${locale.languageCode}: every parameterised message formats cleanly', () async {
      final l = await AppLocalizations.delegate.load(locale);
      final messages = <String>[
        for (var n = 0; n <= 30; n++) ...[
          l.squadSpeakers(n),
          l.streamingTo(n),
          l.boostingFor(n),
        ],
        l.partyNameDefault('Ana'),
        l.bluetoothLagWarning('JBL', 180, 400),
        l.partyEndedByHost('Ana'),
        l.connectingToWifi('Home'),
        l.linkedDirectlyTo('Ana'),
        l.syncedVia('Ana', 2),
        l.bluetoothDelayZeroed(120),
        l.speakerDelayCalibrated(10),
        l.nudgedEarlier(40),
        l.nudgedLater(40),
        l.tooFarToBoost(3),
        l.hostLabel('Ana'),
        l.boosterLabel('Ana'),
        l.inSyncCount('Home', 3),
        l.copied('Wi-Fi'),
        l.youLabel('Ana'),
        l.boosterDetail(2),
        l.bufferDetail(80),
        l.dropsDetail('1.5'),
        l.errNetwork('x'),
        l.noticeLostParent('Ana'),
        l.noticeRejectOther('x'),
        l.errPasswordLength(5, 'Home'),
        l.errTooDeep(4, 3),
        l.notifHosting('Ana'),
        l.notifPlaying('Ana'),
      ];
      for (final m in messages) {
        expect(m.trim(), isNotEmpty);
        expect(m, isNot(contains('{')), reason: m);
        expect(m, isNot(contains('}')), reason: m);
      }
      // Values are substituted, not dropped.
      expect(l.partyNameDefault('Ana'), contains('Ana'));
      expect(l.squadSpeakers(7), contains('7'));
    });
  }

  testWidgets('Turkish section titles upper-case i correctly', (tester) async {
    await tester.pumpWidget(_app(const Locale('tr'), const SectionTitle('bilgi')));
    expect(find.text('BİLGİ'), findsOneWidget);
  });

  testWidgets('Arabic is right-to-left and section titles are not tracked',
      (tester) async {
    await tester.pumpWidget(_app(const Locale('ar'), const SectionTitle('ab')));
    final text = tester.widget<Text>(find.text('ab'));
    expect(text.style?.letterSpacing, 0);
    expect(Directionality.of(tester.element(find.text('ab'))), TextDirection.rtl);
  });

  testWidgets('English section titles are upper-cased and tracked',
      (tester) async {
    await tester.pumpWidget(_app(const Locale('en'), const SectionTitle('ab')));
    final text = tester.widget<Text>(find.text('AB'));
    expect(text.style?.letterSpacing, 1.2);
  });
}
