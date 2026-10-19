// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homeTagline =>
      'Turn your squad\'s phones into one massive sound system. 🔊 One phone grabs the mic, and every phone (plus any Bluetooth speaker hooked up) pumps the sound in sync.';

  @override
  String get nameLabel => 'Your name or nickname';

  @override
  String get nameHelper => 'What the squad sees on their screen';

  @override
  String get homeVibeTitle => 'What\'s the vibe?';

  @override
  String get hostCardTitle => 'Grab the Mic 🎤';

  @override
  String get hostCardSubtitle =>
      'Host the party. Whatever you say or stream plays in real-time through everyone\'s speakers.';

  @override
  String get joinCardTitle => 'Join the Sound 🔊';

  @override
  String get joinCardSubtitle =>
      'Scan the host\'s QR code. Turn this phone or your Bluetooth speaker into part of the party.';

  @override
  String get homeTipRelay =>
      'Pro tip: This phone can boost range! Once you are connected, you can share the vibe with even more friends nearby.';

  @override
  String get homeTipIos =>
      'iPhones can host or join as speakers. To boost signal range for friends further away, use an Android phone.';

  @override
  String get homeTipDefault => 'Ready to host the party or join the sound!';

  @override
  String get scanHostQr => 'Scan Host QR Code';

  @override
  String get scanHostQrSubtitle =>
      'One-tap connect: links to Wi-Fi and syncs the sound automatically';

  @override
  String get alreadyOnWifi => 'I\'m already on the same Wi-Fi';

  @override
  String get connectManually => 'Connect manually';

  @override
  String get wifiNameLabel => 'Wi-Fi name';

  @override
  String get wifiPasswordLabel => 'Wi-Fi password';

  @override
  String get hostIpLabel => 'Host IP address (optional)';

  @override
  String get hostIpHelper => 'Found under the host’s QR code';

  @override
  String get connectToParty => 'Connect to Party';

  @override
  String get enterWifiName => 'Please enter the Wi-Fi name.';

  @override
  String get joinTipIos =>
      'When prompted, tap \"Join\" to connect. Keep Crowd Speaker running so the sound keeps playing!';

  @override
  String get joinTipAndroid =>
      'When prompted, tap to accept the Wi-Fi connection and you’ll jump right into the party.';

  @override
  String get scannerNotACode =>
      'Not a Crowd Speaker code. Scan the QR on your friend\'s screen!';

  @override
  String get scannerHint =>
      'Point your camera at the QR code on your friend\'s screen.';

  @override
  String get hostSetupTitle => 'Host the Party 🎤';

  @override
  String get partyNameLabel => 'Party name';

  @override
  String get partyNameHelper => 'What friends will see when they join';

  @override
  String partyNameDefault(String name) {
    return '$name\'s party';
  }

  @override
  String get defaultPartyName => 'Party';

  @override
  String get connectQuestion => 'How should friends connect?';

  @override
  String get instantNetworkTitle => 'Instant Party Network';

  @override
  String get badgeEasiest => 'Easiest';

  @override
  String get instantNetworkSubtitle =>
      'Zero setup needed. Creates an instant local bubble for everyone to tap in. (No internet needed).';

  @override
  String get usePersonalHotspot => 'Use Personal Hotspot';

  @override
  String get useMyHotspot => 'Use my phone hotspot';

  @override
  String get hotspotSubtitle =>
      'Turn on your phone\'s hotspot manually. Also lets friends share your mobile internet.';

  @override
  String get hotspotInfoIos =>
      'Turn on Personal Hotspot in Settings (\"Allow Others to Join\"), then enter your iPhone name & hotspot password below so friends can join.';

  @override
  String get hotspotInfoAndroid =>
      'Turn on your hotspot in Settings, then enter your Wi-Fi name and password below so friends can join.';

  @override
  String get openHotspotSettings => 'Open hotspot settings';

  @override
  String get hotspotSettingsHint =>
      'Open Settings → Personal Hotspot and turn on \"Allow Others to Join\".';

  @override
  String get hotspotWifiNameLabel => 'Hotspot Wi-Fi name';

  @override
  String get hotspotPasswordLabel => 'Hotspot password';

  @override
  String get enterHotspotName => 'Enter your hotspot name so friends can join.';

  @override
  String get invalidWifiPassword =>
      'Wi-Fi passwords must be 8–63 characters. Check your hotspot settings and try again!';

  @override
  String get audioTuning => 'Audio Tuning';

  @override
  String get filterNoiseTitle => 'Filter background noise';

  @override
  String get filterNoiseSubtitle =>
      'Keeps voices crisp. Toggle off if you are blasting music or using DJ gear.';

  @override
  String get startParty => 'Start the Party 🔥';

  @override
  String get onTheMic => 'On the Mic 🎤';

  @override
  String get endParty => 'End Party';

  @override
  String get endPartyTitle => 'End the party?';

  @override
  String get endPartyMessage =>
      'This will disconnect all speakers and stop the sound.';

  @override
  String get somethingWentWrong => 'Something went wrong.';

  @override
  String get firingUpParty => 'Firing up the party…';

  @override
  String get creatingPartyNetwork => 'Creating your party network';

  @override
  String get scanToJoinSound => 'Scan to join the sound 📲';

  @override
  String get syncBufferTitle => 'Sound sync buffer';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count phones connected',
      one: '$count phone connected',
    );
    return 'Squad speakers · $_temp0';
  }

  @override
  String get micMuted => 'Mic Muted 🤫';

  @override
  String get liveOnAir => 'Live on Air 🎙️';

  @override
  String get tapToUnmute => 'Tap the mic to unmute and drop back in';

  @override
  String get waitingForSquad => 'Waiting for the squad to scan and join…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count phone speakers',
      one: '$count phone speaker',
    );
    return 'Streaming live to $_temp0';
  }

  @override
  String get bufferDelayLabel => 'Buffer delay before sound plays';

  @override
  String get syncBufferHelp =>
      'Slide up if audio stutters or drops out. Bluetooth speakers and signal boosters need a bit more buffer time to stay perfectly in sync.';

  @override
  String get speakerMode => 'Speaker Mode 🔊';

  @override
  String get leave => 'Leave';

  @override
  String get leavePartyTitle => 'Leave the party?';

  @override
  String get leavePartyBoosterMessage =>
      'Friends connected through your booster will disconnect too.';

  @override
  String get leavePartyMessage => 'This phone will stop playing sound.';

  @override
  String get leaveParty => 'Leave Party';

  @override
  String get audioOutput => 'Audio output';

  @override
  String get thisSpeaker => 'This speaker';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route has high Bluetooth lag ($latency ms), longer than the host\'s sync buffer. Ask the host to raise \"Sound sync buffer\" to $needed ms or more so your sound can play!';
  }

  @override
  String get echoFixTitle => 'Echo fix (fine-tune sync)';

  @override
  String get boostRangeTitle => 'Boost range for friends 📡';

  @override
  String get partyWrappedUp => 'The party has wrapped up 🎉';

  @override
  String get hostEndedParty => 'The host ended the party.';

  @override
  String partyEndedByHost(String name) {
    return '\"$name\" was ended by the host.';
  }

  @override
  String get backToHome => 'Back to Home';

  @override
  String get joinAnotherParty => 'Join another party';

  @override
  String get tuningIn => 'Tuning in…';

  @override
  String get warmingUpSpeakers => 'Warming up the speakers';

  @override
  String connectingToWifi(String ssid) {
    return 'Connecting to $ssid…';
  }

  @override
  String get partyWifi => 'party Wi-Fi';

  @override
  String get tapAllowToConnect => 'Tap Allow on the pop-up to connect.';

  @override
  String get findingHost => 'Finding the host…';

  @override
  String get searchingParty => 'Searching for the party on this Wi-Fi.';

  @override
  String get lockingIntoSync => 'Locking into sync…';

  @override
  String get aligningBeat => 'Aligning beat timing.';

  @override
  String get hostIsMuted => 'Host is muted 🤫';

  @override
  String get hostMutedSubtitle =>
      'Connected! Sound will drop back in when they unmute.';

  @override
  String get bumpingInSync => 'Bumping in Sync 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'Directly linked to $name';
  }

  @override
  String get hostFallback => 'host';

  @override
  String syncedVia(String name, int depth) {
    return 'Synced via $name (hops from mic: $depth)';
  }

  @override
  String get boosterFallback => 'booster';

  @override
  String get reSyncing => 'Re-syncing…';

  @override
  String get reconnectingStream => 'Reconnecting to the stream';

  @override
  String get notConnectedYet => 'Not connected yet';

  @override
  String get phoneSpeaker => 'Phone speaker';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'Bluetooth delay (+$ms ms) automatically zeroed out.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'Speaker delay (+$ms ms) automatically calibrated.';
  }

  @override
  String get syncTiming => 'Sync timing';

  @override
  String get audioBuffer => 'Audio buffer';

  @override
  String get streamDrops => 'Stream drops';

  @override
  String get autoAdjust => 'Auto-adjust';

  @override
  String get defaultSyncZero => 'Default sync (Zero offset)';

  @override
  String nudgedEarlier(int ms) {
    return 'Nudged $ms ms earlier';
  }

  @override
  String nudgedLater(int ms) {
    return 'Nudged $ms ms later';
  }

  @override
  String get reset => 'Reset';

  @override
  String get echoHelp =>
      'Hearing an echo? If this speaker sounds behind the squad, slide right. If it sounds ahead, slide left. (Most speakers already sound perfect without this!)';

  @override
  String get relayUnsupportedIos =>
      'iPhones can\'t share Wi-Fi while listening. Have an Android friend turn on signal booster instead!';

  @override
  String get relayUnsupportedAndroid =>
      'This phone doesn\'t support Wi-Fi Direct booster mode.';

  @override
  String get boostSignalTitle => 'Boost signal for friends';

  @override
  String tooFarToBoost(int depth) {
    return 'Too far from host to boost range further (hops from host: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count friends',
      one: '$count friend',
    );
    return 'Boosting sound for $_temp0';
  }

  @override
  String get boostSubtitleOff =>
      'Turns your phone into a Wi-Fi booster so friends further away can connect.';

  @override
  String get chargerTip =>
      'Plug into a charger if possible: boosting range uses extra battery.';

  @override
  String get scanToConnectBooster => 'Scan to connect through booster 📲';

  @override
  String get reconnectSameNetwork => 'Reconnect to same network';

  @override
  String get retry => 'Retry';

  @override
  String get switchLabel => 'Switch';

  @override
  String hostLabel(String name) {
    return '$name (host 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (booster 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · in sync: $count';
  }

  @override
  String get tryAgain => 'Try again';

  @override
  String get back => 'Back';

  @override
  String get cancel => 'Cancel';

  @override
  String get copy => 'Copy';

  @override
  String get show => 'Show';

  @override
  String get hide => 'Hide';

  @override
  String copied(String label) {
    return '$label copied';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'Password';

  @override
  String get labelAddress => 'Address';

  @override
  String get partyCode => 'Party code';

  @override
  String get cameraQr => 'Camera QR';

  @override
  String get settingUpNetwork => 'Setting up party network…';

  @override
  String get qrCameraHelp =>
      'Scan with your phone\'s Camera app to join the Wi-Fi first, then open Crowd Speaker and tap \"I\'m already on the same Wi-Fi\".';

  @override
  String get qrAppHelp =>
      'Scan with Crowd Speaker → \"Join the Sound\". Connects to Wi-Fi and syncs the sound automatically in one tap!';

  @override
  String get noSpeakersYet =>
      'No speakers yet. Have the squad scan your QR code to turn up!';

  @override
  String youLabel(String name) {
    return '$name (you 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'Booster 📡 · synced: $count';
  }

  @override
  String bufferDetail(int ms) {
    return '$ms ms buffer';
  }

  @override
  String dropsDetail(String pct) {
    return '$pct% drops';
  }

  @override
  String get errMicNeeded => 'Microphone access is needed to be the mic.';

  @override
  String get errNearbyCreate =>
      'Allow \"Nearby devices\" so the app can create a network.';

  @override
  String get errNearbyShare =>
      'Allow \"Nearby devices\" so the app can share a network.';

  @override
  String errNetwork(String message) {
    return 'Network error: $message';
  }

  @override
  String get noticeHotspotOff =>
      'Your hotspot isn\'t on yet. Turn it on and the QR code updates by itself.';

  @override
  String get noticeLostHost =>
      'Lost the host. Trying again, or pick another network below.';

  @override
  String noticeLostParent(String name) {
    return 'Lost $name. Trying again, or pick another network below.';
  }

  @override
  String get noticeRejectSyncing =>
      'Found a booster phone, but it is still syncing. Try again in a moment.';

  @override
  String get noticeRejectLoop =>
      'That phone is already connected through you, so it can\'t be your source.';

  @override
  String noticeRejectOther(String reason) {
    return 'Found a phone that said: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'The Wi-Fi password in this code is $length characters, but Wi-Fi passwords are 8-63. The host probably mistyped it: ask them to re-enter it, or join \"$ssid\" in your Wi-Fi settings and tap \"I\'m already on the same Wi-Fi\".';
  }

  @override
  String get errHostNotFound =>
      'Couldn\'t find the host on this Wi-Fi. Check the host is live and that you joined the right network.';

  @override
  String get errRelayNeedsAndroid =>
      'Sharing needs an Android phone with Wi-Fi Direct.';

  @override
  String errTooDeep(int depth, int max) {
    return 'This phone is too far from the host (hops from host: $depth, max $max). Join a network closer to the host to share.';
  }

  @override
  String notifHosting(String name) {
    return 'Hosting \"$name\"';
  }

  @override
  String notifPlaying(String name) {
    return 'Playing \"$name\"';
  }
}
