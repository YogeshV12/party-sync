// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get homeTagline =>
      'اپنے دوستوں کے فون کو ایک بڑے ساؤنڈ سسٹم میں بدل دیں۔ 🔊 ایک فون مائیک سنبھالتا ہے، اور باقی سب فون (ساتھ جڑے بلوٹوتھ اسپیکر بھی) آواز کو ہم آہنگی کے ساتھ چلاتے ہیں۔';

  @override
  String get nameLabel => 'آپ کا نام یا عرفیت';

  @override
  String get nameHelper => 'دوست اپنی اسکرین پر یہی دیکھیں گے';

  @override
  String get homeVibeTitle => 'آج کا موڈ کیا ہے؟';

  @override
  String get hostCardTitle => 'مائیک سنبھالیں 🎤';

  @override
  String get hostCardSubtitle =>
      'پارٹی کی میزبانی کریں۔ آپ جو کچھ بولیں یا اسٹریم کریں وہ سب کے اسپیکروں پر لائیو چلے گا۔';

  @override
  String get joinCardTitle => 'ساؤنڈ میں شامل ہوں 🔊';

  @override
  String get joinCardSubtitle =>
      'میزبان کا QR کوڈ اسکین کریں۔ اس فون یا اپنے بلوٹوتھ اسپیکر کو پارٹی کا حصہ بنائیں۔';

  @override
  String get homeTipRelay =>
      'ٹپ: یہ فون رینج بڑھا سکتا ہے! جڑنے کے بعد آپ قریبی مزید دوستوں کے ساتھ آواز شیئر کر سکتے ہیں۔';

  @override
  String get homeTipIos =>
      'iPhone میزبانی کر سکتے ہیں یا اسپیکر کے طور پر شامل ہو سکتے ہیں۔ دور بیٹھے دوستوں تک سگنل کی رینج بڑھانے کے لیے Android فون استعمال کریں۔';

  @override
  String get homeTipDefault =>
      'پارٹی کی میزبانی کرنے یا ساؤنڈ میں شامل ہونے کے لیے تیار!';

  @override
  String get scanHostQr => 'میزبان کا QR کوڈ اسکین کریں';

  @override
  String get scanHostQrSubtitle =>
      'ایک ٹیپ میں کنکشن: Wi-Fi سے جڑتا ہے اور آواز خود بخود سنک کرتا ہے';

  @override
  String get alreadyOnWifi => 'میں پہلے سے اسی Wi-Fi پر ہوں';

  @override
  String get connectManually => 'دستی طور پر جڑیں';

  @override
  String get wifiNameLabel => 'Wi-Fi کا نام';

  @override
  String get wifiPasswordLabel => 'Wi-Fi پاس ورڈ';

  @override
  String get hostIpLabel => 'میزبان کا IP ایڈریس (اختیاری)';

  @override
  String get hostIpHelper => 'میزبان کے QR کوڈ کے نیچے ملے گا';

  @override
  String get connectToParty => 'پارٹی سے جڑیں';

  @override
  String get enterWifiName => 'براہِ کرم Wi-Fi کا نام درج کریں۔';

  @override
  String get joinTipIos =>
      'پوچھے جانے پر جڑنے کے لیے \"شامل ہوں\" پر ٹیپ کریں۔ آواز چلتی رہے اس کے لیے Crowd Speaker کھلا رکھیں!';

  @override
  String get joinTipAndroid =>
      'پوچھے جانے پر Wi-Fi کنکشن قبول کرنے کے لیے ٹیپ کریں اور آپ سیدھے پارٹی میں پہنچ جائیں گے۔';

  @override
  String get scannerNotACode =>
      'یہ Crowd Speaker کا کوڈ نہیں ہے۔ اپنے دوست کی اسکرین پر موجود QR اسکین کریں!';

  @override
  String get scannerHint =>
      'اپنے دوست کی اسکرین پر موجود QR کوڈ کی طرف کیمرا کریں۔';

  @override
  String get hostSetupTitle => 'پارٹی کی میزبانی کریں 🎤';

  @override
  String get partyNameLabel => 'پارٹی کا نام';

  @override
  String get partyNameHelper => 'شامل ہوتے وقت دوست یہی دیکھیں گے';

  @override
  String partyNameDefault(String name) {
    return '$name کی پارٹی';
  }

  @override
  String get defaultPartyName => 'پارٹی';

  @override
  String get connectQuestion => 'دوست کیسے جڑیں؟';

  @override
  String get instantNetworkTitle => 'فوری پارٹی نیٹ ورک';

  @override
  String get badgeEasiest => 'سب سے آسان';

  @override
  String get instantNetworkSubtitle =>
      'کسی سیٹ اپ کی ضرورت نہیں۔ سب کے جڑنے کے لیے فوراً ایک مقامی نیٹ ورک بناتا ہے۔ (انٹرنیٹ کی ضرورت نہیں)۔';

  @override
  String get usePersonalHotspot => 'پرسنل ہاٹ اسپاٹ استعمال کریں';

  @override
  String get useMyHotspot => 'میرے فون کا ہاٹ اسپاٹ استعمال کریں';

  @override
  String get hotspotSubtitle =>
      'اپنے فون کا ہاٹ اسپاٹ خود آن کریں۔ اس سے دوست آپ کا موبائل انٹرنیٹ بھی استعمال کر سکتے ہیں۔';

  @override
  String get hotspotInfoIos =>
      'سیٹنگز میں پرسنل ہاٹ اسپاٹ آن کریں (\"دوسروں کو شامل ہونے دیں\")، پھر دوستوں کے شامل ہونے کے لیے نیچے اپنے iPhone کا نام اور ہاٹ اسپاٹ پاس ورڈ درج کریں۔';

  @override
  String get hotspotInfoAndroid =>
      'سیٹنگز میں ہاٹ اسپاٹ آن کریں، پھر دوستوں کے شامل ہونے کے لیے نیچے اپنا Wi-Fi نام اور پاس ورڈ درج کریں۔';

  @override
  String get openHotspotSettings => 'ہاٹ اسپاٹ سیٹنگز کھولیں';

  @override
  String get hotspotSettingsHint =>
      'سیٹنگز ← پرسنل ہاٹ اسپاٹ کھولیں اور \"دوسروں کو شامل ہونے دیں\" آن کریں۔';

  @override
  String get hotspotWifiNameLabel => 'ہاٹ اسپاٹ Wi-Fi کا نام';

  @override
  String get hotspotPasswordLabel => 'ہاٹ اسپاٹ پاس ورڈ';

  @override
  String get enterHotspotName =>
      'دوستوں کے شامل ہونے کے لیے اپنے ہاٹ اسپاٹ کا نام درج کریں۔';

  @override
  String get invalidWifiPassword =>
      'Wi-Fi پاس ورڈ 8 سے 63 حروف کا ہونا چاہیے۔ اپنی ہاٹ اسپاٹ سیٹنگز چیک کریں اور دوبارہ کوشش کریں!';

  @override
  String get audioTuning => 'آڈیو ٹیوننگ';

  @override
  String get filterNoiseTitle => 'پس منظر کا شور فلٹر کریں';

  @override
  String get filterNoiseSubtitle =>
      'آوازوں کو صاف رکھتا ہے۔ اگر آپ تیز آواز میں موسیقی چلا رہے ہیں یا DJ کا سامان استعمال کر رہے ہیں تو بند کر دیں۔';

  @override
  String get startParty => 'پارٹی شروع کریں 🔥';

  @override
  String get onTheMic => 'مائیک پر 🎤';

  @override
  String get endParty => 'پارٹی ختم کریں';

  @override
  String get endPartyTitle => 'پارٹی ختم کریں؟';

  @override
  String get endPartyMessage =>
      'اس سے تمام اسپیکر منقطع ہو جائیں گے اور آواز بند ہو جائے گی۔';

  @override
  String get somethingWentWrong => 'کچھ غلط ہو گیا۔';

  @override
  String get firingUpParty => 'پارٹی شروع ہو رہی ہے…';

  @override
  String get creatingPartyNetwork => 'آپ کا پارٹی نیٹ ورک بن رہا ہے';

  @override
  String get scanToJoinSound => 'ساؤنڈ میں شامل ہونے کے لیے اسکین کریں 📲';

  @override
  String get syncBufferTitle => 'ساؤنڈ سنک بفر';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فون جڑے ہوئے',
      one: '$count فون جڑا ہوا',
    );
    return 'دوستوں کے اسپیکر · $_temp0';
  }

  @override
  String get micMuted => 'مائیک میوٹ ہے 🤫';

  @override
  String get liveOnAir => 'لائیو آن ایئر 🎙️';

  @override
  String get tapToUnmute => 'ان میوٹ کر کے واپس آنے کے لیے مائیک پر ٹیپ کریں';

  @override
  String get waitingForSquad => 'دوستوں کے اسکین کر کے شامل ہونے کا انتظار ہے…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فون اسپیکروں',
      one: '$count فون اسپیکر',
    );
    return '$_temp0 پر لائیو اسٹریم ہو رہا ہے';
  }

  @override
  String get bufferDelayLabel => 'آواز چلنے سے پہلے بفر تاخیر';

  @override
  String get syncBufferHelp =>
      'اگر آواز اٹکے یا کٹ جائے تو اسے اوپر کریں۔ بلوٹوتھ اسپیکر اور سگنل بوسٹر کو مکمل سنک میں رہنے کے لیے تھوڑا زیادہ بفر چاہیے۔';

  @override
  String get speakerMode => 'اسپیکر موڈ 🔊';

  @override
  String get leave => 'چھوڑیں';

  @override
  String get leavePartyTitle => 'پارٹی چھوڑیں؟';

  @override
  String get leavePartyBoosterMessage =>
      'آپ کے بوسٹر کے ذریعے جڑے دوست بھی منقطع ہو جائیں گے۔';

  @override
  String get leavePartyMessage => 'یہ فون آواز چلانا بند کر دے گا۔';

  @override
  String get leaveParty => 'پارٹی چھوڑیں';

  @override
  String get audioOutput => 'آڈیو آؤٹ پٹ';

  @override
  String get thisSpeaker => 'یہ اسپیکر';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route میں بلوٹوتھ لیگ زیادہ ہے ($latency ms)، جو میزبان کے سنک بفر سے زیادہ ہے۔ میزبان سے کہیں کہ \"ساؤنڈ سنک بفر\" کو $needed ms یا اس سے زیادہ کر دیں تاکہ آپ کی آواز چل سکے!';
  }

  @override
  String get echoFixTitle => 'گونج کی درستی (سنک کی باریک ٹیوننگ)';

  @override
  String get boostRangeTitle => 'دوستوں کے لیے رینج بڑھائیں 📡';

  @override
  String get partyWrappedUp => 'پارٹی ختم ہو گئی 🎉';

  @override
  String get hostEndedParty => 'میزبان نے پارٹی ختم کر دی۔';

  @override
  String partyEndedByHost(String name) {
    return '\"$name\" کو میزبان نے ختم کر دیا۔';
  }

  @override
  String get backToHome => 'ہوم پر واپس جائیں';

  @override
  String get joinAnotherParty => 'کسی اور پارٹی میں شامل ہوں';

  @override
  String get tuningIn => 'ٹیون ہو رہا ہے…';

  @override
  String get warmingUpSpeakers => 'اسپیکر وارم اپ ہو رہے ہیں';

  @override
  String connectingToWifi(String ssid) {
    return '$ssid سے جڑ رہا ہے…';
  }

  @override
  String get partyWifi => 'پارٹی Wi-Fi';

  @override
  String get tapAllowToConnect =>
      'جڑنے کے لیے پاپ اپ میں اجازت دیں پر ٹیپ کریں۔';

  @override
  String get findingHost => 'میزبان کو ڈھونڈ رہا ہے…';

  @override
  String get searchingParty => 'اس Wi-Fi پر پارٹی تلاش کی جا رہی ہے۔';

  @override
  String get lockingIntoSync => 'سنک ہو رہا ہے…';

  @override
  String get aligningBeat => 'بیٹ کا وقت ملایا جا رہا ہے۔';

  @override
  String get hostIsMuted => 'میزبان میوٹ ہے 🤫';

  @override
  String get hostMutedSubtitle =>
      'جڑ گیا! میزبان کے ان میوٹ کرتے ہی آواز واپس آ جائے گی۔';

  @override
  String get bumpingInSync => 'سنک میں دھوم 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'براہِ راست $name سے جڑا ہوا';
  }

  @override
  String get hostFallback => 'میزبان';

  @override
  String syncedVia(String name, int depth) {
    return '$name کے ذریعے سنک (مائیک سے ہاپ: $depth)';
  }

  @override
  String get boosterFallback => 'بوسٹر';

  @override
  String get reSyncing => 'دوبارہ سنک ہو رہا ہے…';

  @override
  String get reconnectingStream => 'اسٹریم سے دوبارہ جڑ رہا ہے';

  @override
  String get notConnectedYet => 'ابھی تک جڑا نہیں';

  @override
  String get phoneSpeaker => 'فون اسپیکر';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'بلوٹوتھ تاخیر (+$ms ms) خود بخود صفر کر دی گئی۔';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'اسپیکر تاخیر (+$ms ms) خود بخود کیلیبریٹ کی گئی۔';
  }

  @override
  String get syncTiming => 'سنک ٹائمنگ';

  @override
  String get audioBuffer => 'آڈیو بفر';

  @override
  String get streamDrops => 'اسٹریم ڈراپ';

  @override
  String get autoAdjust => 'آٹو ایڈجسٹ';

  @override
  String get defaultSyncZero => 'ڈیفالٹ سنک (صفر آفسیٹ)';

  @override
  String nudgedEarlier(int ms) {
    return '$ms ms پہلے کیا گیا';
  }

  @override
  String nudgedLater(int ms) {
    return '$ms ms بعد میں کیا گیا';
  }

  @override
  String get reset => 'ری سیٹ';

  @override
  String get echoHelp =>
      'گونج سنائی دے رہی ہے؟ اگر یہ اسپیکر باقی سب سے پیچھے بج رہا ہے تو دائیں طرف سلائیڈ کریں۔ اگر آگے ہے تو بائیں طرف۔ (زیادہ تر اسپیکر اس کے بغیر بھی بالکل ٹھیک بجتے ہیں!)';

  @override
  String get relayUnsupportedIos =>
      'iPhone سنتے وقت Wi-Fi شیئر نہیں کر سکتے۔ اس کے بجائے Android والے کسی دوست سے سگنل بوسٹر آن کرنے کو کہیں!';

  @override
  String get relayUnsupportedAndroid =>
      'یہ فون Wi-Fi Direct بوسٹر موڈ کو سپورٹ نہیں کرتا۔';

  @override
  String get boostSignalTitle => 'دوستوں کے لیے سگنل بڑھائیں';

  @override
  String tooFarToBoost(int depth) {
    return 'رینج مزید بڑھانے کے لیے میزبان سے بہت دور ہے (میزبان سے ہاپ: $depth)۔';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دوستوں',
      one: '$count دوست',
    );
    return '$_temp0 کے لیے آواز بڑھائی جا رہی ہے';
  }

  @override
  String get boostSubtitleOff =>
      'آپ کے فون کو Wi-Fi بوسٹر بنا دیتا ہے تاکہ دور کے دوست بھی جڑ سکیں۔';

  @override
  String get chargerTip =>
      'ہو سکے تو چارجر لگا لیں: رینج بڑھانے میں زیادہ بیٹری خرچ ہوتی ہے۔';

  @override
  String get scanToConnectBooster => 'بوسٹر کے ذریعے جڑنے کے لیے اسکین کریں 📲';

  @override
  String get reconnectSameNetwork => 'اسی نیٹ ورک سے دوبارہ جڑیں';

  @override
  String get retry => 'دوبارہ کوشش کریں';

  @override
  String get switchLabel => 'بدلیں';

  @override
  String hostLabel(String name) {
    return '$name (میزبان 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (بوسٹر 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · سنک میں: $count';
  }

  @override
  String get tryAgain => 'دوبارہ کوشش کریں';

  @override
  String get back => 'واپس';

  @override
  String get cancel => 'منسوخ کریں';

  @override
  String get copy => 'کاپی کریں';

  @override
  String get show => 'دکھائیں';

  @override
  String get hide => 'چھپائیں';

  @override
  String copied(String label) {
    return '$label کاپی ہو گیا';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'پاس ورڈ';

  @override
  String get labelAddress => 'پتہ';

  @override
  String get partyCode => 'پارٹی کوڈ';

  @override
  String get cameraQr => 'کیمرا QR';

  @override
  String get settingUpNetwork => 'پارٹی نیٹ ورک سیٹ ہو رہا ہے…';

  @override
  String get qrCameraHelp =>
      'پہلے Wi-Fi میں شامل ہونے کے لیے اپنے فون کی کیمرا ایپ سے اسکین کریں، پھر Crowd Speaker کھولیں اور \"میں پہلے سے اسی Wi-Fi پر ہوں\" پر ٹیپ کریں۔';

  @override
  String get qrAppHelp =>
      'Crowd Speaker سے اسکین کریں ← \"ساؤنڈ میں شامل ہوں\"۔ ایک ٹیپ میں Wi-Fi سے جڑتا ہے اور آواز خود بخود سنک کرتا ہے!';

  @override
  String get noSpeakersYet =>
      'ابھی کوئی اسپیکر نہیں۔ دوستوں سے اپنا QR کوڈ اسکین کروائیں!';

  @override
  String youLabel(String name) {
    return '$name (آپ 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'بوسٹر 📡 · سنک میں: $count';
  }

  @override
  String bufferDetail(int ms) {
    return '$ms ms بفر';
  }

  @override
  String dropsDetail(String pct) {
    return '$pct% ڈراپ';
  }

  @override
  String get errMicNeeded => 'مائیک بننے کے لیے مائیکروفون کی رسائی درکار ہے۔';

  @override
  String get errNearbyCreate =>
      'ایپ نیٹ ورک بنا سکے اس کے لیے \"قریبی آلات\" کی اجازت دیں۔';

  @override
  String get errNearbyShare =>
      'ایپ نیٹ ورک شیئر کر سکے اس کے لیے \"قریبی آلات\" کی اجازت دیں۔';

  @override
  String errNetwork(String message) {
    return 'نیٹ ورک کی خرابی: $message';
  }

  @override
  String get noticeHotspotOff =>
      'آپ کا ہاٹ اسپاٹ ابھی آن نہیں ہے۔ اسے آن کریں، QR کوڈ خود اپ ڈیٹ ہو جائے گا۔';

  @override
  String get noticeLostHost =>
      'میزبان سے کنکشن ٹوٹ گیا۔ دوبارہ کوشش ہو رہی ہے، یا نیچے سے کوئی اور نیٹ ورک چنیں۔';

  @override
  String noticeLostParent(String name) {
    return '$name سے کنکشن ٹوٹ گیا۔ دوبارہ کوشش ہو رہی ہے، یا نیچے سے کوئی اور نیٹ ورک چنیں۔';
  }

  @override
  String get noticeRejectSyncing =>
      'ایک بوسٹر فون ملا، لیکن وہ ابھی سنک ہو رہا ہے۔ تھوڑی دیر بعد دوبارہ کوشش کریں۔';

  @override
  String get noticeRejectLoop =>
      'وہ فون پہلے سے آپ کے ذریعے جڑا ہوا ہے، اس لیے آپ کا ذریعہ نہیں بن سکتا۔';

  @override
  String noticeRejectOther(String reason) {
    return 'ملنے والے فون نے کہا: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'اس کوڈ میں Wi-Fi پاس ورڈ $length حروف کا ہے، جبکہ Wi-Fi پاس ورڈ 8 سے 63 حروف کے ہوتے ہیں۔ شاید میزبان سے ٹائپنگ میں غلطی ہوئی: ان سے دوبارہ درج کرنے کو کہیں، یا Wi-Fi سیٹنگز میں \"$ssid\" سے جڑ کر \"میں پہلے سے اسی Wi-Fi پر ہوں\" پر ٹیپ کریں۔';
  }

  @override
  String get errHostNotFound =>
      'اس Wi-Fi پر میزبان نہیں ملا۔ چیک کریں کہ میزبان لائیو ہے اور آپ درست نیٹ ورک سے جڑے ہیں۔';

  @override
  String get errRelayNeedsAndroid =>
      'شیئر کرنے کے لیے Wi-Fi Direct والا Android فون چاہیے۔';

  @override
  String errTooDeep(int depth, int max) {
    return 'یہ فون میزبان سے بہت دور ہے (میزبان سے ہاپ: $depth، زیادہ سے زیادہ $max)۔ شیئر کرنے کے لیے میزبان کے قریبی نیٹ ورک سے جڑیں۔';
  }

  @override
  String notifHosting(String name) {
    return '\"$name\" کی میزبانی ہو رہی ہے';
  }

  @override
  String notifPlaying(String name) {
    return '\"$name\" چل رہا ہے';
  }
}
