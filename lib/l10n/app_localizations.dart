import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('mr'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('sv'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @homeTagline.
  ///
  /// In en, this message translates to:
  /// **'Turn your squad\'s phones into one massive sound system. 🔊 One phone grabs the mic, and every phone (plus any Bluetooth speaker hooked up) pumps the sound in sync.'**
  String get homeTagline;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Your name or nickname'**
  String get nameLabel;

  /// No description provided for @nameHelper.
  ///
  /// In en, this message translates to:
  /// **'What the squad sees on their screen'**
  String get nameHelper;

  /// No description provided for @homeVibeTitle.
  ///
  /// In en, this message translates to:
  /// **'What\'s the vibe?'**
  String get homeVibeTitle;

  /// No description provided for @hostCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Grab the Mic 🎤'**
  String get hostCardTitle;

  /// No description provided for @hostCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Host the party. Whatever you say or stream plays in real-time through everyone\'s speakers.'**
  String get hostCardSubtitle;

  /// No description provided for @joinCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Join the Sound 🔊'**
  String get joinCardTitle;

  /// No description provided for @joinCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Scan the host\'s QR code. Turn this phone or your Bluetooth speaker into part of the party.'**
  String get joinCardSubtitle;

  /// No description provided for @homeTipRelay.
  ///
  /// In en, this message translates to:
  /// **'Pro tip: This phone can boost range! Once you are connected, you can share the vibe with even more friends nearby.'**
  String get homeTipRelay;

  /// No description provided for @homeTipIos.
  ///
  /// In en, this message translates to:
  /// **'iPhones can host or join as speakers. To boost signal range for friends further away, use an Android phone.'**
  String get homeTipIos;

  /// No description provided for @homeTipDefault.
  ///
  /// In en, this message translates to:
  /// **'Ready to host the party or join the sound!'**
  String get homeTipDefault;

  /// No description provided for @scanHostQr.
  ///
  /// In en, this message translates to:
  /// **'Scan Host QR Code'**
  String get scanHostQr;

  /// No description provided for @scanHostQrSubtitle.
  ///
  /// In en, this message translates to:
  /// **'One-tap connect: links to Wi-Fi and syncs the sound automatically'**
  String get scanHostQrSubtitle;

  /// No description provided for @alreadyOnWifi.
  ///
  /// In en, this message translates to:
  /// **'I\'m already on the same Wi-Fi'**
  String get alreadyOnWifi;

  /// No description provided for @connectManually.
  ///
  /// In en, this message translates to:
  /// **'Connect manually'**
  String get connectManually;

  /// No description provided for @wifiNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi name'**
  String get wifiNameLabel;

  /// No description provided for @wifiPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi password'**
  String get wifiPasswordLabel;

  /// No description provided for @hostIpLabel.
  ///
  /// In en, this message translates to:
  /// **'Host IP address (optional)'**
  String get hostIpLabel;

  /// No description provided for @hostIpHelper.
  ///
  /// In en, this message translates to:
  /// **'Found under the host’s QR code'**
  String get hostIpHelper;

  /// No description provided for @connectToParty.
  ///
  /// In en, this message translates to:
  /// **'Connect to Party'**
  String get connectToParty;

  /// No description provided for @enterWifiName.
  ///
  /// In en, this message translates to:
  /// **'Please enter the Wi-Fi name.'**
  String get enterWifiName;

  /// No description provided for @joinTipIos.
  ///
  /// In en, this message translates to:
  /// **'When prompted, tap \"Join\" to connect. Keep Crowd Speaker running so the sound keeps playing!'**
  String get joinTipIos;

  /// No description provided for @joinTipAndroid.
  ///
  /// In en, this message translates to:
  /// **'When prompted, tap to accept the Wi-Fi connection and you’ll jump right into the party.'**
  String get joinTipAndroid;

  /// No description provided for @scannerNotACode.
  ///
  /// In en, this message translates to:
  /// **'Not a Crowd Speaker code. Scan the QR on your friend\'s screen!'**
  String get scannerNotACode;

  /// No description provided for @scannerHint.
  ///
  /// In en, this message translates to:
  /// **'Point your camera at the QR code on your friend\'s screen.'**
  String get scannerHint;

  /// No description provided for @hostSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Host the Party 🎤'**
  String get hostSetupTitle;

  /// No description provided for @partyNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Party name'**
  String get partyNameLabel;

  /// No description provided for @partyNameHelper.
  ///
  /// In en, this message translates to:
  /// **'What friends will see when they join'**
  String get partyNameHelper;

  /// No description provided for @partyNameDefault.
  ///
  /// In en, this message translates to:
  /// **'{name}\'s party'**
  String partyNameDefault(String name);

  /// No description provided for @defaultPartyName.
  ///
  /// In en, this message translates to:
  /// **'Party'**
  String get defaultPartyName;

  /// No description provided for @connectQuestion.
  ///
  /// In en, this message translates to:
  /// **'How should friends connect?'**
  String get connectQuestion;

  /// No description provided for @instantNetworkTitle.
  ///
  /// In en, this message translates to:
  /// **'Instant Party Network'**
  String get instantNetworkTitle;

  /// No description provided for @badgeEasiest.
  ///
  /// In en, this message translates to:
  /// **'Easiest'**
  String get badgeEasiest;

  /// No description provided for @instantNetworkSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Zero setup needed. Creates an instant local bubble for everyone to tap in. (No internet needed).'**
  String get instantNetworkSubtitle;

  /// No description provided for @usePersonalHotspot.
  ///
  /// In en, this message translates to:
  /// **'Use Personal Hotspot'**
  String get usePersonalHotspot;

  /// No description provided for @useMyHotspot.
  ///
  /// In en, this message translates to:
  /// **'Use my phone hotspot'**
  String get useMyHotspot;

  /// No description provided for @hotspotSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Turn on your phone\'s hotspot manually. Also lets friends share your mobile internet.'**
  String get hotspotSubtitle;

  /// No description provided for @hotspotInfoIos.
  ///
  /// In en, this message translates to:
  /// **'Turn on Personal Hotspot in Settings (\"Allow Others to Join\"), then enter your iPhone name & hotspot password below so friends can join.'**
  String get hotspotInfoIos;

  /// No description provided for @hotspotInfoAndroid.
  ///
  /// In en, this message translates to:
  /// **'Turn on your hotspot in Settings, then enter your Wi-Fi name and password below so friends can join.'**
  String get hotspotInfoAndroid;

  /// No description provided for @openHotspotSettings.
  ///
  /// In en, this message translates to:
  /// **'Open hotspot settings'**
  String get openHotspotSettings;

  /// No description provided for @hotspotSettingsHint.
  ///
  /// In en, this message translates to:
  /// **'Open Settings → Personal Hotspot and turn on \"Allow Others to Join\".'**
  String get hotspotSettingsHint;

  /// No description provided for @hotspotWifiNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Hotspot Wi-Fi name'**
  String get hotspotWifiNameLabel;

  /// No description provided for @hotspotPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Hotspot password'**
  String get hotspotPasswordLabel;

  /// No description provided for @enterHotspotName.
  ///
  /// In en, this message translates to:
  /// **'Enter your hotspot name so friends can join.'**
  String get enterHotspotName;

  /// No description provided for @invalidWifiPassword.
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi passwords must be 8–63 characters. Check your hotspot settings and try again!'**
  String get invalidWifiPassword;

  /// No description provided for @audioTuning.
  ///
  /// In en, this message translates to:
  /// **'Audio Tuning'**
  String get audioTuning;

  /// No description provided for @filterNoiseTitle.
  ///
  /// In en, this message translates to:
  /// **'Filter background noise'**
  String get filterNoiseTitle;

  /// No description provided for @filterNoiseSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Keeps voices crisp. Toggle off if you are blasting music or using DJ gear.'**
  String get filterNoiseSubtitle;

  /// No description provided for @startParty.
  ///
  /// In en, this message translates to:
  /// **'Start the Party 🔥'**
  String get startParty;

  /// No description provided for @onTheMic.
  ///
  /// In en, this message translates to:
  /// **'On the Mic 🎤'**
  String get onTheMic;

  /// No description provided for @endParty.
  ///
  /// In en, this message translates to:
  /// **'End Party'**
  String get endParty;

  /// No description provided for @endPartyTitle.
  ///
  /// In en, this message translates to:
  /// **'End the party?'**
  String get endPartyTitle;

  /// No description provided for @endPartyMessage.
  ///
  /// In en, this message translates to:
  /// **'This will disconnect all speakers and stop the sound.'**
  String get endPartyMessage;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get somethingWentWrong;

  /// No description provided for @firingUpParty.
  ///
  /// In en, this message translates to:
  /// **'Firing up the party…'**
  String get firingUpParty;

  /// No description provided for @creatingPartyNetwork.
  ///
  /// In en, this message translates to:
  /// **'Creating your party network'**
  String get creatingPartyNetwork;

  /// No description provided for @scanToJoinSound.
  ///
  /// In en, this message translates to:
  /// **'Scan to join the sound 📲'**
  String get scanToJoinSound;

  /// No description provided for @syncBufferTitle.
  ///
  /// In en, this message translates to:
  /// **'Sound sync buffer'**
  String get syncBufferTitle;

  /// No description provided for @squadSpeakers.
  ///
  /// In en, this message translates to:
  /// **'Squad speakers · {count, plural, one{{count} phone connected} other{{count} phones connected}}'**
  String squadSpeakers(int count);

  /// No description provided for @micMuted.
  ///
  /// In en, this message translates to:
  /// **'Mic Muted 🤫'**
  String get micMuted;

  /// No description provided for @liveOnAir.
  ///
  /// In en, this message translates to:
  /// **'Live on Air 🎙️'**
  String get liveOnAir;

  /// No description provided for @tapToUnmute.
  ///
  /// In en, this message translates to:
  /// **'Tap the mic to unmute and drop back in'**
  String get tapToUnmute;

  /// No description provided for @waitingForSquad.
  ///
  /// In en, this message translates to:
  /// **'Waiting for the squad to scan and join…'**
  String get waitingForSquad;

  /// No description provided for @streamingTo.
  ///
  /// In en, this message translates to:
  /// **'Streaming live to {count, plural, one{{count} phone speaker} other{{count} phone speakers}}'**
  String streamingTo(int count);

  /// No description provided for @bufferDelayLabel.
  ///
  /// In en, this message translates to:
  /// **'Buffer delay before sound plays'**
  String get bufferDelayLabel;

  /// No description provided for @syncBufferHelp.
  ///
  /// In en, this message translates to:
  /// **'Slide up if audio stutters or drops out. Bluetooth speakers and signal boosters need a bit more buffer time to stay perfectly in sync.'**
  String get syncBufferHelp;

  /// No description provided for @speakerMode.
  ///
  /// In en, this message translates to:
  /// **'Speaker Mode 🔊'**
  String get speakerMode;

  /// No description provided for @leave.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get leave;

  /// No description provided for @leavePartyTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave the party?'**
  String get leavePartyTitle;

  /// No description provided for @leavePartyBoosterMessage.
  ///
  /// In en, this message translates to:
  /// **'Friends connected through your booster will disconnect too.'**
  String get leavePartyBoosterMessage;

  /// No description provided for @leavePartyMessage.
  ///
  /// In en, this message translates to:
  /// **'This phone will stop playing sound.'**
  String get leavePartyMessage;

  /// No description provided for @leaveParty.
  ///
  /// In en, this message translates to:
  /// **'Leave Party'**
  String get leaveParty;

  /// No description provided for @audioOutput.
  ///
  /// In en, this message translates to:
  /// **'Audio output'**
  String get audioOutput;

  /// No description provided for @thisSpeaker.
  ///
  /// In en, this message translates to:
  /// **'This speaker'**
  String get thisSpeaker;

  /// No description provided for @bluetoothLagWarning.
  ///
  /// In en, this message translates to:
  /// **'{route} has high Bluetooth lag ({latency} ms), longer than the host\'s sync buffer. Ask the host to raise \"Sound sync buffer\" to {needed} ms or more so your sound can play!'**
  String bluetoothLagWarning(String route, int latency, int needed);

  /// No description provided for @echoFixTitle.
  ///
  /// In en, this message translates to:
  /// **'Echo fix (fine-tune sync)'**
  String get echoFixTitle;

  /// No description provided for @boostRangeTitle.
  ///
  /// In en, this message translates to:
  /// **'Boost range for friends 📡'**
  String get boostRangeTitle;

  /// No description provided for @partyWrappedUp.
  ///
  /// In en, this message translates to:
  /// **'The party has wrapped up 🎉'**
  String get partyWrappedUp;

  /// No description provided for @hostEndedParty.
  ///
  /// In en, this message translates to:
  /// **'The host ended the party.'**
  String get hostEndedParty;

  /// No description provided for @partyEndedByHost.
  ///
  /// In en, this message translates to:
  /// **'\"{name}\" was ended by the host.'**
  String partyEndedByHost(String name);

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @joinAnotherParty.
  ///
  /// In en, this message translates to:
  /// **'Join another party'**
  String get joinAnotherParty;

  /// No description provided for @tuningIn.
  ///
  /// In en, this message translates to:
  /// **'Tuning in…'**
  String get tuningIn;

  /// No description provided for @warmingUpSpeakers.
  ///
  /// In en, this message translates to:
  /// **'Warming up the speakers'**
  String get warmingUpSpeakers;

  /// No description provided for @connectingToWifi.
  ///
  /// In en, this message translates to:
  /// **'Connecting to {ssid}…'**
  String connectingToWifi(String ssid);

  /// No description provided for @partyWifi.
  ///
  /// In en, this message translates to:
  /// **'party Wi-Fi'**
  String get partyWifi;

  /// No description provided for @tapAllowToConnect.
  ///
  /// In en, this message translates to:
  /// **'Tap Allow on the pop-up to connect.'**
  String get tapAllowToConnect;

  /// No description provided for @findingHost.
  ///
  /// In en, this message translates to:
  /// **'Finding the host…'**
  String get findingHost;

  /// No description provided for @searchingParty.
  ///
  /// In en, this message translates to:
  /// **'Searching for the party on this Wi-Fi.'**
  String get searchingParty;

  /// No description provided for @lockingIntoSync.
  ///
  /// In en, this message translates to:
  /// **'Locking into sync…'**
  String get lockingIntoSync;

  /// No description provided for @aligningBeat.
  ///
  /// In en, this message translates to:
  /// **'Aligning beat timing.'**
  String get aligningBeat;

  /// No description provided for @hostIsMuted.
  ///
  /// In en, this message translates to:
  /// **'Host is muted 🤫'**
  String get hostIsMuted;

  /// No description provided for @hostMutedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Connected! Sound will drop back in when they unmute.'**
  String get hostMutedSubtitle;

  /// No description provided for @bumpingInSync.
  ///
  /// In en, this message translates to:
  /// **'Bumping in Sync 🔥'**
  String get bumpingInSync;

  /// No description provided for @linkedDirectlyTo.
  ///
  /// In en, this message translates to:
  /// **'Directly linked to {name}'**
  String linkedDirectlyTo(String name);

  /// No description provided for @hostFallback.
  ///
  /// In en, this message translates to:
  /// **'host'**
  String get hostFallback;

  /// No description provided for @syncedVia.
  ///
  /// In en, this message translates to:
  /// **'Synced via {name} (hops from mic: {depth})'**
  String syncedVia(String name, int depth);

  /// No description provided for @boosterFallback.
  ///
  /// In en, this message translates to:
  /// **'booster'**
  String get boosterFallback;

  /// No description provided for @reSyncing.
  ///
  /// In en, this message translates to:
  /// **'Re-syncing…'**
  String get reSyncing;

  /// No description provided for @reconnectingStream.
  ///
  /// In en, this message translates to:
  /// **'Reconnecting to the stream'**
  String get reconnectingStream;

  /// No description provided for @notConnectedYet.
  ///
  /// In en, this message translates to:
  /// **'Not connected yet'**
  String get notConnectedYet;

  /// No description provided for @phoneSpeaker.
  ///
  /// In en, this message translates to:
  /// **'Phone speaker'**
  String get phoneSpeaker;

  /// No description provided for @bluetoothDelayZeroed.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth delay (+{ms} ms) automatically zeroed out.'**
  String bluetoothDelayZeroed(int ms);

  /// No description provided for @speakerDelayCalibrated.
  ///
  /// In en, this message translates to:
  /// **'Speaker delay (+{ms} ms) automatically calibrated.'**
  String speakerDelayCalibrated(int ms);

  /// No description provided for @syncTiming.
  ///
  /// In en, this message translates to:
  /// **'Sync timing'**
  String get syncTiming;

  /// No description provided for @audioBuffer.
  ///
  /// In en, this message translates to:
  /// **'Audio buffer'**
  String get audioBuffer;

  /// No description provided for @streamDrops.
  ///
  /// In en, this message translates to:
  /// **'Stream drops'**
  String get streamDrops;

  /// No description provided for @autoAdjust.
  ///
  /// In en, this message translates to:
  /// **'Auto-adjust'**
  String get autoAdjust;

  /// No description provided for @defaultSyncZero.
  ///
  /// In en, this message translates to:
  /// **'Default sync (Zero offset)'**
  String get defaultSyncZero;

  /// No description provided for @nudgedEarlier.
  ///
  /// In en, this message translates to:
  /// **'Nudged {ms} ms earlier'**
  String nudgedEarlier(int ms);

  /// No description provided for @nudgedLater.
  ///
  /// In en, this message translates to:
  /// **'Nudged {ms} ms later'**
  String nudgedLater(int ms);

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @echoHelp.
  ///
  /// In en, this message translates to:
  /// **'Hearing an echo? If this speaker sounds behind the squad, slide right. If it sounds ahead, slide left. (Most speakers already sound perfect without this!)'**
  String get echoHelp;

  /// No description provided for @relayUnsupportedIos.
  ///
  /// In en, this message translates to:
  /// **'iPhones can\'t share Wi-Fi while listening. Have an Android friend turn on signal booster instead!'**
  String get relayUnsupportedIos;

  /// No description provided for @relayUnsupportedAndroid.
  ///
  /// In en, this message translates to:
  /// **'This phone doesn\'t support Wi-Fi Direct booster mode.'**
  String get relayUnsupportedAndroid;

  /// No description provided for @boostSignalTitle.
  ///
  /// In en, this message translates to:
  /// **'Boost signal for friends'**
  String get boostSignalTitle;

  /// No description provided for @tooFarToBoost.
  ///
  /// In en, this message translates to:
  /// **'Too far from host to boost range further (hops from host: {depth}).'**
  String tooFarToBoost(int depth);

  /// No description provided for @boostingFor.
  ///
  /// In en, this message translates to:
  /// **'Boosting sound for {count, plural, one{{count} friend} other{{count} friends}}'**
  String boostingFor(int count);

  /// No description provided for @boostSubtitleOff.
  ///
  /// In en, this message translates to:
  /// **'Turns your phone into a Wi-Fi booster so friends further away can connect.'**
  String get boostSubtitleOff;

  /// No description provided for @chargerTip.
  ///
  /// In en, this message translates to:
  /// **'Plug into a charger if possible: boosting range uses extra battery.'**
  String get chargerTip;

  /// No description provided for @scanToConnectBooster.
  ///
  /// In en, this message translates to:
  /// **'Scan to connect through booster 📲'**
  String get scanToConnectBooster;

  /// No description provided for @reconnectSameNetwork.
  ///
  /// In en, this message translates to:
  /// **'Reconnect to same network'**
  String get reconnectSameNetwork;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @switchLabel.
  ///
  /// In en, this message translates to:
  /// **'Switch'**
  String get switchLabel;

  /// No description provided for @hostLabel.
  ///
  /// In en, this message translates to:
  /// **'{name} (host 🎤)'**
  String hostLabel(String name);

  /// No description provided for @boosterLabel.
  ///
  /// In en, this message translates to:
  /// **'{name} (booster 📡)'**
  String boosterLabel(String name);

  /// No description provided for @inSyncCount.
  ///
  /// In en, this message translates to:
  /// **'{ssid} · in sync: {count}'**
  String inSyncCount(String ssid, int count);

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @show.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get show;

  /// No description provided for @hide.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hide;

  /// No description provided for @copied.
  ///
  /// In en, this message translates to:
  /// **'{label} copied'**
  String copied(String label);

  /// No description provided for @labelWifi.
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi'**
  String get labelWifi;

  /// No description provided for @labelPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get labelPassword;

  /// No description provided for @labelAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get labelAddress;

  /// No description provided for @partyCode.
  ///
  /// In en, this message translates to:
  /// **'Party code'**
  String get partyCode;

  /// No description provided for @cameraQr.
  ///
  /// In en, this message translates to:
  /// **'Camera QR'**
  String get cameraQr;

  /// No description provided for @settingUpNetwork.
  ///
  /// In en, this message translates to:
  /// **'Setting up party network…'**
  String get settingUpNetwork;

  /// No description provided for @qrCameraHelp.
  ///
  /// In en, this message translates to:
  /// **'Scan with your phone\'s Camera app to join the Wi-Fi first, then open Crowd Speaker and tap \"I\'m already on the same Wi-Fi\".'**
  String get qrCameraHelp;

  /// No description provided for @qrAppHelp.
  ///
  /// In en, this message translates to:
  /// **'Scan with Crowd Speaker → \"Join the Sound\". Connects to Wi-Fi and syncs the sound automatically in one tap!'**
  String get qrAppHelp;

  /// No description provided for @noSpeakersYet.
  ///
  /// In en, this message translates to:
  /// **'No speakers yet. Have the squad scan your QR code to turn up!'**
  String get noSpeakersYet;

  /// No description provided for @youLabel.
  ///
  /// In en, this message translates to:
  /// **'{name} (you 🎤)'**
  String youLabel(String name);

  /// No description provided for @boosterDetail.
  ///
  /// In en, this message translates to:
  /// **'Booster 📡 · synced: {count}'**
  String boosterDetail(int count);

  /// No description provided for @bufferDetail.
  ///
  /// In en, this message translates to:
  /// **'{ms} ms buffer'**
  String bufferDetail(int ms);

  /// No description provided for @dropsDetail.
  ///
  /// In en, this message translates to:
  /// **'{pct}% drops'**
  String dropsDetail(String pct);

  /// No description provided for @errMicNeeded.
  ///
  /// In en, this message translates to:
  /// **'Microphone access is needed to be the mic.'**
  String get errMicNeeded;

  /// No description provided for @errNearbyCreate.
  ///
  /// In en, this message translates to:
  /// **'Allow \"Nearby devices\" so the app can create a network.'**
  String get errNearbyCreate;

  /// No description provided for @errNearbyShare.
  ///
  /// In en, this message translates to:
  /// **'Allow \"Nearby devices\" so the app can share a network.'**
  String get errNearbyShare;

  /// No description provided for @errNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network error: {message}'**
  String errNetwork(String message);

  /// No description provided for @noticeHotspotOff.
  ///
  /// In en, this message translates to:
  /// **'Your hotspot isn\'t on yet. Turn it on and the QR code updates by itself.'**
  String get noticeHotspotOff;

  /// No description provided for @noticeLostHost.
  ///
  /// In en, this message translates to:
  /// **'Lost the host. Trying again, or pick another network below.'**
  String get noticeLostHost;

  /// No description provided for @noticeLostParent.
  ///
  /// In en, this message translates to:
  /// **'Lost {name}. Trying again, or pick another network below.'**
  String noticeLostParent(String name);

  /// No description provided for @noticeRejectSyncing.
  ///
  /// In en, this message translates to:
  /// **'Found a booster phone, but it is still syncing. Try again in a moment.'**
  String get noticeRejectSyncing;

  /// No description provided for @noticeRejectLoop.
  ///
  /// In en, this message translates to:
  /// **'That phone is already connected through you, so it can\'t be your source.'**
  String get noticeRejectLoop;

  /// No description provided for @noticeRejectOther.
  ///
  /// In en, this message translates to:
  /// **'Found a phone that said: {reason}'**
  String noticeRejectOther(String reason);

  /// No description provided for @errPasswordLength.
  ///
  /// In en, this message translates to:
  /// **'The Wi-Fi password in this code is {length} characters, but Wi-Fi passwords are 8-63. The host probably mistyped it: ask them to re-enter it, or join \"{ssid}\" in your Wi-Fi settings and tap \"I\'m already on the same Wi-Fi\".'**
  String errPasswordLength(int length, String ssid);

  /// No description provided for @errHostNotFound.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t find the host on this Wi-Fi. Check the host is live and that you joined the right network.'**
  String get errHostNotFound;

  /// No description provided for @errRelayNeedsAndroid.
  ///
  /// In en, this message translates to:
  /// **'Sharing needs an Android phone with Wi-Fi Direct.'**
  String get errRelayNeedsAndroid;

  /// No description provided for @errTooDeep.
  ///
  /// In en, this message translates to:
  /// **'This phone is too far from the host (hops from host: {depth}, max {max}). Join a network closer to the host to share.'**
  String errTooDeep(int depth, int max);

  /// No description provided for @notifHosting.
  ///
  /// In en, this message translates to:
  /// **'Hosting \"{name}\"'**
  String notifHosting(String name);

  /// No description provided for @notifPlaying.
  ///
  /// In en, this message translates to:
  /// **'Playing \"{name}\"'**
  String notifPlaying(String name);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'mr',
    'nl',
    'pl',
    'pt',
    'ru',
    'sv',
    'ta',
    'te',
    'th',
    'tr',
    'uk',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'mr':
      return AppLocalizationsMr();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'sv':
      return AppLocalizationsSv();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
