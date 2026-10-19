// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get homeTagline =>
      'বন্ধুদের ফোনকে একটি বিশাল সাউন্ড সিস্টেমে পরিণত করুন। 🔊 একটি ফোন মাইক ধরে, আর বাকি সব ফোন (সাথে যুক্ত ব্লুটুথ স্পিকারও) সিঙ্কে শব্দ বাজায়।';

  @override
  String get nameLabel => 'আপনার নাম বা ডাকনাম';

  @override
  String get nameHelper => 'বন্ধুরা তাদের স্ক্রিনে যা দেখবে';

  @override
  String get homeVibeTitle => 'আজকের মুড কী?';

  @override
  String get hostCardTitle => 'মাইক ধরুন 🎤';

  @override
  String get hostCardSubtitle =>
      'পার্টি হোস্ট করুন। আপনি যা বলবেন বা স্ট্রিম করবেন তা সবার স্পিকারে রিয়েল-টাইমে বাজবে।';

  @override
  String get joinCardTitle => 'সাউন্ডে যোগ দিন 🔊';

  @override
  String get joinCardSubtitle =>
      'হোস্টের QR কোড স্ক্যান করুন। এই ফোন বা আপনার ব্লুটুথ স্পিকারকে পার্টির অংশ করে তুলুন।';

  @override
  String get homeTipRelay =>
      'টিপ: এই ফোন রেঞ্জ বাড়াতে পারে! সংযুক্ত হওয়ার পর আপনি কাছের আরও বন্ধুদের সাথে শব্দ ভাগ করতে পারবেন।';

  @override
  String get homeTipIos =>
      'iPhone হোস্ট করতে বা স্পিকার হিসেবে যোগ দিতে পারে। দূরের বন্ধুদের জন্য সিগন্যাল রেঞ্জ বাড়াতে Android ফোন ব্যবহার করুন।';

  @override
  String get homeTipDefault =>
      'পার্টি হোস্ট করতে বা সাউন্ডে যোগ দিতে প্রস্তুত!';

  @override
  String get scanHostQr => 'হোস্টের QR কোড স্ক্যান করুন';

  @override
  String get scanHostQrSubtitle =>
      'এক ট্যাপে সংযোগ: Wi-Fi-এ যুক্ত হয় এবং স্বয়ংক্রিয়ভাবে শব্দ সিঙ্ক করে';

  @override
  String get alreadyOnWifi => 'আমি ইতিমধ্যে একই Wi-Fi-এ আছি';

  @override
  String get connectManually => 'নিজে সংযোগ করুন';

  @override
  String get wifiNameLabel => 'Wi-Fi-এর নাম';

  @override
  String get wifiPasswordLabel => 'Wi-Fi পাসওয়ার্ড';

  @override
  String get hostIpLabel => 'হোস্টের IP ঠিকানা (ঐচ্ছিক)';

  @override
  String get hostIpHelper => 'হোস্টের QR কোডের নিচে পাওয়া যাবে';

  @override
  String get connectToParty => 'পার্টিতে সংযুক্ত হন';

  @override
  String get enterWifiName => 'অনুগ্রহ করে Wi-Fi-এর নাম লিখুন।';

  @override
  String get joinTipIos =>
      'জিজ্ঞেস করলে সংযুক্ত হতে \"যোগ দিন\"-এ ট্যাপ করুন। শব্দ বাজতে থাকার জন্য Crowd Speaker চালু রাখুন!';

  @override
  String get joinTipAndroid =>
      'জিজ্ঞেস করলে Wi-Fi সংযোগ গ্রহণ করতে ট্যাপ করুন, আর আপনি সরাসরি পার্টিতে ঢুকে যাবেন।';

  @override
  String get scannerNotACode =>
      'এটি Crowd Speaker-এর কোড নয়। বন্ধুর স্ক্রিনের QR স্ক্যান করুন!';

  @override
  String get scannerHint => 'বন্ধুর স্ক্রিনের QR কোডের দিকে ক্যামেরা ধরুন।';

  @override
  String get hostSetupTitle => 'পার্টি হোস্ট করুন 🎤';

  @override
  String get partyNameLabel => 'পার্টির নাম';

  @override
  String get partyNameHelper => 'যোগ দেওয়ার সময় বন্ধুরা যা দেখবে';

  @override
  String partyNameDefault(String name) {
    return '$name-এর পার্টি';
  }

  @override
  String get defaultPartyName => 'পার্টি';

  @override
  String get connectQuestion => 'বন্ধুরা কীভাবে সংযুক্ত হবে?';

  @override
  String get instantNetworkTitle => 'ইনস্ট্যান্ট পার্টি নেটওয়ার্ক';

  @override
  String get badgeEasiest => 'সবচেয়ে সহজ';

  @override
  String get instantNetworkSubtitle =>
      'কোনো সেটআপ লাগে না। সবার ঢোকার জন্য তাৎক্ষণিক একটি লোকাল নেটওয়ার্ক তৈরি করে। (ইন্টারনেট লাগে না)।';

  @override
  String get usePersonalHotspot => 'পার্সোনাল হটস্পট ব্যবহার করুন';

  @override
  String get useMyHotspot => 'আমার ফোনের হটস্পট ব্যবহার করুন';

  @override
  String get hotspotSubtitle =>
      'নিজে ফোনের হটস্পট চালু করুন। এতে বন্ধুরা আপনার মোবাইল ইন্টারনেটও ব্যবহার করতে পারবে।';

  @override
  String get hotspotInfoIos =>
      'সেটিংসে পার্সোনাল হটস্পট চালু করুন (\"অন্যদের যোগ দিতে দিন\"), তারপর বন্ধুদের যোগ দেওয়ার জন্য নিচে আপনার iPhone-এর নাম ও হটস্পট পাসওয়ার্ড লিখুন।';

  @override
  String get hotspotInfoAndroid =>
      'সেটিংসে হটস্পট চালু করুন, তারপর বন্ধুদের যোগ দেওয়ার জন্য নিচে Wi-Fi-এর নাম ও পাসওয়ার্ড লিখুন।';

  @override
  String get openHotspotSettings => 'হটস্পট সেটিংস খুলুন';

  @override
  String get hotspotSettingsHint =>
      'সেটিংস → পার্সোনাল হটস্পট খুলে \"অন্যদের যোগ দিতে দিন\" চালু করুন।';

  @override
  String get hotspotWifiNameLabel => 'হটস্পট Wi-Fi-এর নাম';

  @override
  String get hotspotPasswordLabel => 'হটস্পট পাসওয়ার্ড';

  @override
  String get enterHotspotName =>
      'বন্ধুরা যাতে যোগ দিতে পারে সেজন্য হটস্পটের নাম লিখুন।';

  @override
  String get invalidWifiPassword =>
      'Wi-Fi পাসওয়ার্ড ৮–৬৩ অক্ষরের হতে হবে। হটস্পট সেটিংস দেখে আবার চেষ্টা করুন!';

  @override
  String get audioTuning => 'অডিও টিউনিং';

  @override
  String get filterNoiseTitle => 'ব্যাকগ্রাউন্ড শব্দ ফিল্টার করুন';

  @override
  String get filterNoiseSubtitle =>
      'কণ্ঠস্বর পরিষ্কার রাখে। জোরে গান বাজালে বা DJ সরঞ্জাম ব্যবহার করলে বন্ধ করুন।';

  @override
  String get startParty => 'পার্টি শুরু করুন 🔥';

  @override
  String get onTheMic => 'মাইকে আছেন 🎤';

  @override
  String get endParty => 'পার্টি শেষ করুন';

  @override
  String get endPartyTitle => 'পার্টি শেষ করবেন?';

  @override
  String get endPartyMessage =>
      'এতে সব স্পিকারের সংযোগ বিচ্ছিন্ন হবে এবং শব্দ বন্ধ হয়ে যাবে।';

  @override
  String get somethingWentWrong => 'কিছু একটা ভুল হয়েছে।';

  @override
  String get firingUpParty => 'পার্টি শুরু হচ্ছে…';

  @override
  String get creatingPartyNetwork => 'আপনার পার্টি নেটওয়ার্ক তৈরি হচ্ছে';

  @override
  String get scanToJoinSound => 'সাউন্ডে যোগ দিতে স্ক্যান করুন 📲';

  @override
  String get syncBufferTitle => 'সাউন্ড সিঙ্ক বাফার';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ফোন সংযুক্ত',
      one: '$countটি ফোন সংযুক্ত',
    );
    return 'বন্ধুদের স্পিকার · $_temp0';
  }

  @override
  String get micMuted => 'মাইক মিউট 🤫';

  @override
  String get liveOnAir => 'লাইভ অন এয়ার 🎙️';

  @override
  String get tapToUnmute => 'আনমিউট করে ফিরে আসতে মাইকে ট্যাপ করুন';

  @override
  String get waitingForSquad => 'বন্ধুদের স্ক্যান করে যোগ দেওয়ার অপেক্ষায়…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ফোন স্পিকারে',
      one: '$countটি ফোন স্পিকারে',
    );
    return '$_temp0 লাইভ স্ট্রিম হচ্ছে';
  }

  @override
  String get bufferDelayLabel => 'শব্দ বাজার আগে বাফার বিলম্ব';

  @override
  String get syncBufferHelp =>
      'শব্দ আটকে গেলে বা কেটে গেলে এটি বাড়ান। ব্লুটুথ স্পিকার ও সিগন্যাল বুস্টারকে পুরোপুরি সিঙ্কে থাকতে একটু বেশি বাফার লাগে।';

  @override
  String get speakerMode => 'স্পিকার মোড 🔊';

  @override
  String get leave => 'ছাড়ুন';

  @override
  String get leavePartyTitle => 'পার্টি ছাড়বেন?';

  @override
  String get leavePartyBoosterMessage =>
      'আপনার বুস্টারের মাধ্যমে সংযুক্ত বন্ধুদেরও সংযোগ বিচ্ছিন্ন হবে।';

  @override
  String get leavePartyMessage => 'এই ফোন আর শব্দ বাজাবে না।';

  @override
  String get leaveParty => 'পার্টি ছাড়ুন';

  @override
  String get audioOutput => 'অডিও আউটপুট';

  @override
  String get thisSpeaker => 'এই স্পিকার';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route-এর ব্লুটুথ ল্যাগ বেশি ($latency ms), যা হোস্টের সিঙ্ক বাফারের চেয়ে বড়। আপনার শব্দ বাজার জন্য হোস্টকে \"সাউন্ড সিঙ্ক বাফার\" $needed ms বা তার বেশি করতে বলুন!';
  }

  @override
  String get echoFixTitle => 'ইকো ঠিক করুন (সিঙ্ক ফাইন-টিউন)';

  @override
  String get boostRangeTitle => 'বন্ধুদের জন্য রেঞ্জ বাড়ান 📡';

  @override
  String get partyWrappedUp => 'পার্টি শেষ হয়েছে 🎉';

  @override
  String get hostEndedParty => 'হোস্ট পার্টি শেষ করেছেন।';

  @override
  String partyEndedByHost(String name) {
    return '\"$name\" হোস্ট শেষ করেছেন।';
  }

  @override
  String get backToHome => 'হোমে ফিরুন';

  @override
  String get joinAnotherParty => 'অন্য পার্টিতে যোগ দিন';

  @override
  String get tuningIn => 'টিউন করা হচ্ছে…';

  @override
  String get warmingUpSpeakers => 'স্পিকার গরম করা হচ্ছে';

  @override
  String connectingToWifi(String ssid) {
    return '$ssid-এ সংযোগ হচ্ছে…';
  }

  @override
  String get partyWifi => 'পার্টি Wi-Fi';

  @override
  String get tapAllowToConnect => 'সংযোগ করতে পপ-আপে অনুমতি দিন-এ ট্যাপ করুন।';

  @override
  String get findingHost => 'হোস্ট খোঁজা হচ্ছে…';

  @override
  String get searchingParty => 'এই Wi-Fi-তে পার্টি খোঁজা হচ্ছে।';

  @override
  String get lockingIntoSync => 'সিঙ্ক হচ্ছে…';

  @override
  String get aligningBeat => 'বিটের সময় মেলানো হচ্ছে।';

  @override
  String get hostIsMuted => 'হোস্ট মিউট করা আছেন 🤫';

  @override
  String get hostMutedSubtitle => 'সংযুক্ত! হোস্ট আনমিউট করলেই শব্দ ফিরে আসবে।';

  @override
  String get bumpingInSync => 'সিঙ্কে জমে উঠেছে 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'সরাসরি $name-এর সাথে যুক্ত';
  }

  @override
  String get hostFallback => 'হোস্ট';

  @override
  String syncedVia(String name, int depth) {
    return '$name-এর মাধ্যমে সিঙ্ক (মাইক থেকে হপ: $depth)';
  }

  @override
  String get boosterFallback => 'বুস্টার';

  @override
  String get reSyncing => 'আবার সিঙ্ক হচ্ছে…';

  @override
  String get reconnectingStream => 'স্ট্রিমে আবার সংযোগ হচ্ছে';

  @override
  String get notConnectedYet => 'এখনও সংযুক্ত নয়';

  @override
  String get phoneSpeaker => 'ফোন স্পিকার';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'ব্লুটুথ বিলম্ব (+$ms ms) স্বয়ংক্রিয়ভাবে শূন্য করা হয়েছে।';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'স্পিকার বিলম্ব (+$ms ms) স্বয়ংক্রিয়ভাবে ক্যালিব্রেট করা হয়েছে।';
  }

  @override
  String get syncTiming => 'সিঙ্ক টাইমিং';

  @override
  String get audioBuffer => 'অডিও বাফার';

  @override
  String get streamDrops => 'স্ট্রিম ড্রপ';

  @override
  String get autoAdjust => 'অটো-অ্যাডজাস্ট';

  @override
  String get defaultSyncZero => 'ডিফল্ট সিঙ্ক (শূন্য অফসেট)';

  @override
  String nudgedEarlier(int ms) {
    return '$ms ms আগে সরানো হয়েছে';
  }

  @override
  String nudgedLater(int ms) {
    return '$ms ms পরে সরানো হয়েছে';
  }

  @override
  String get reset => 'রিসেট';

  @override
  String get echoHelp =>
      'ইকো শুনতে পাচ্ছেন? এই স্পিকার বাকিদের থেকে পিছিয়ে থাকলে ডানে স্লাইড করুন। এগিয়ে থাকলে বামে। (বেশিরভাগ স্পিকার এটা ছাড়াই নিখুঁত বাজে!)';

  @override
  String get relayUnsupportedIos =>
      'iPhone শোনার সময় Wi-Fi শেয়ার করতে পারে না। বরং Android ব্যবহারকারী কোনো বন্ধুকে সিগন্যাল বুস্টার চালু করতে বলুন!';

  @override
  String get relayUnsupportedAndroid =>
      'এই ফোন Wi-Fi Direct বুস্টার মোড সমর্থন করে না।';

  @override
  String get boostSignalTitle => 'বন্ধুদের জন্য সিগন্যাল বাড়ান';

  @override
  String tooFarToBoost(int depth) {
    return 'রেঞ্জ আরও বাড়াতে হোস্ট থেকে অনেক দূরে (হোস্ট থেকে হপ: $depth)।';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count জন বন্ধুর',
      one: '$count জন বন্ধুর',
    );
    return '$_temp0 জন্য শব্দ বাড়ানো হচ্ছে';
  }

  @override
  String get boostSubtitleOff =>
      'আপনার ফোনকে Wi-Fi বুস্টার বানায়, যাতে দূরের বন্ধুরা সংযুক্ত হতে পারে।';

  @override
  String get chargerTip =>
      'সম্ভব হলে চার্জার লাগান: রেঞ্জ বাড়াতে বাড়তি ব্যাটারি খরচ হয়।';

  @override
  String get scanToConnectBooster =>
      'বুস্টারের মাধ্যমে সংযুক্ত হতে স্ক্যান করুন 📲';

  @override
  String get reconnectSameNetwork => 'একই নেটওয়ার্কে আবার সংযোগ করুন';

  @override
  String get retry => 'আবার চেষ্টা';

  @override
  String get switchLabel => 'বদলান';

  @override
  String hostLabel(String name) {
    return '$name (হোস্ট 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (বুস্টার 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · সিঙ্কে: $count';
  }

  @override
  String get tryAgain => 'আবার চেষ্টা করুন';

  @override
  String get back => 'ফিরে যান';

  @override
  String get cancel => 'বাতিল';

  @override
  String get copy => 'কপি';

  @override
  String get show => 'দেখান';

  @override
  String get hide => 'লুকান';

  @override
  String copied(String label) {
    return '$label কপি হয়েছে';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'পাসওয়ার্ড';

  @override
  String get labelAddress => 'ঠিকানা';

  @override
  String get partyCode => 'পার্টি কোড';

  @override
  String get cameraQr => 'ক্যামেরা QR';

  @override
  String get settingUpNetwork => 'পার্টি নেটওয়ার্ক সেট করা হচ্ছে…';

  @override
  String get qrCameraHelp =>
      'আগে Wi-Fi-এ যুক্ত হতে ফোনের ক্যামেরা অ্যাপ দিয়ে স্ক্যান করুন, তারপর Crowd Speaker খুলে \"আমি ইতিমধ্যে একই Wi-Fi-এ আছি\"-তে ট্যাপ করুন।';

  @override
  String get qrAppHelp =>
      'Crowd Speaker দিয়ে স্ক্যান করুন → \"সাউন্ডে যোগ দিন\"। এক ট্যাপে Wi-Fi-এ যুক্ত হয় এবং স্বয়ংক্রিয়ভাবে শব্দ সিঙ্ক করে!';

  @override
  String get noSpeakersYet =>
      'এখনও কোনো স্পিকার নেই। বন্ধুদের আপনার QR কোড স্ক্যান করে যোগ দিতে বলুন!';

  @override
  String youLabel(String name) {
    return '$name (আপনি 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'বুস্টার 📡 · সিঙ্কে: $count';
  }

  @override
  String bufferDetail(int ms) {
    return '$ms ms বাফার';
  }

  @override
  String dropsDetail(String pct) {
    return '$pct% ড্রপ';
  }

  @override
  String get errMicNeeded => 'মাইক হতে মাইক্রোফোনের অনুমতি প্রয়োজন।';

  @override
  String get errNearbyCreate =>
      'অ্যাপ যাতে নেটওয়ার্ক তৈরি করতে পারে সেজন্য \"কাছের ডিভাইস\" অনুমতি দিন।';

  @override
  String get errNearbyShare =>
      'অ্যাপ যাতে নেটওয়ার্ক শেয়ার করতে পারে সেজন্য \"কাছের ডিভাইস\" অনুমতি দিন।';

  @override
  String errNetwork(String message) {
    return 'নেটওয়ার্ক ত্রুটি: $message';
  }

  @override
  String get noticeHotspotOff =>
      'আপনার হটস্পট এখনও চালু হয়নি। চালু করলে QR কোড নিজে থেকেই আপডেট হবে।';

  @override
  String get noticeLostHost =>
      'হোস্টের সংযোগ হারিয়ে গেছে। আবার চেষ্টা চলছে, অথবা নিচে থেকে অন্য নেটওয়ার্ক বেছে নিন।';

  @override
  String noticeLostParent(String name) {
    return '$name-এর সংযোগ হারিয়ে গেছে। আবার চেষ্টা চলছে, অথবা নিচে থেকে অন্য নেটওয়ার্ক বেছে নিন।';
  }

  @override
  String get noticeRejectSyncing =>
      'একটি বুস্টার ফোন পাওয়া গেছে, কিন্তু সেটি এখনও সিঙ্ক হচ্ছে। একটু পরে আবার চেষ্টা করুন।';

  @override
  String get noticeRejectLoop =>
      'ওই ফোন ইতিমধ্যে আপনার মাধ্যমে সংযুক্ত, তাই এটি আপনার উৎস হতে পারে না।';

  @override
  String noticeRejectOther(String reason) {
    return 'পাওয়া ফোনটি বলেছে: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'এই কোডের Wi-Fi পাসওয়ার্ড $length অক্ষরের, কিন্তু Wi-Fi পাসওয়ার্ড ৮-৬৩ অক্ষরের হয়। হোস্ট সম্ভবত ভুল টাইপ করেছেন: আবার লিখতে বলুন, অথবা Wi-Fi সেটিংসে \"$ssid\"-এ যুক্ত হয়ে \"আমি ইতিমধ্যে একই Wi-Fi-এ আছি\"-তে ট্যাপ করুন।';
  }

  @override
  String get errHostNotFound =>
      'এই Wi-Fi-তে হোস্টকে পাওয়া যায়নি। হোস্ট লাইভ আছেন এবং আপনি সঠিক নেটওয়ার্কে যুক্ত হয়েছেন কি না দেখুন।';

  @override
  String get errRelayNeedsAndroid =>
      'শেয়ার করতে Wi-Fi Direct সহ একটি Android ফোন লাগবে।';

  @override
  String errTooDeep(int depth, int max) {
    return 'এই ফোন হোস্ট থেকে অনেক দূরে (হোস্ট থেকে হপ: $depth, সর্বোচ্চ $max)। শেয়ার করতে হোস্টের কাছের নেটওয়ার্কে যুক্ত হোন।';
  }

  @override
  String notifHosting(String name) {
    return '\"$name\" হোস্ট করা হচ্ছে';
  }

  @override
  String notifPlaying(String name) {
    return '\"$name\" বাজছে';
  }
}
