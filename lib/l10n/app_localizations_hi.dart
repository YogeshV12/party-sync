// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get homeTagline =>
      'अपने दोस्तों के फ़ोन को एक विशाल साउंड सिस्टम बना दें। 🔊 एक फ़ोन माइक संभालता है, और बाकी सभी फ़ोन (साथ में जुड़े ब्लूटूथ स्पीकर भी) आवाज़ को सिंक में बजाते हैं।';

  @override
  String get nameLabel => 'आपका नाम या उपनाम';

  @override
  String get nameHelper => 'दोस्तों को अपनी स्क्रीन पर यही दिखेगा';

  @override
  String get homeVibeTitle => 'आज का मूड क्या है?';

  @override
  String get hostCardTitle => 'माइक संभालें 🎤';

  @override
  String get hostCardSubtitle =>
      'पार्टी होस्ट करें। आप जो भी बोलें या स्ट्रीम करें, वह सबके स्पीकर पर रियल-टाइम में बजेगा।';

  @override
  String get joinCardTitle => 'साउंड से जुड़ें 🔊';

  @override
  String get joinCardSubtitle =>
      'होस्ट का QR कोड स्कैन करें। इस फ़ोन या अपने ब्लूटूथ स्पीकर को पार्टी का हिस्सा बनाएँ।';

  @override
  String get homeTipRelay =>
      'टिप: यह फ़ोन रेंज बढ़ा सकता है! कनेक्ट होने के बाद आप आसपास के और दोस्तों तक आवाज़ पहुँचा सकते हैं।';

  @override
  String get homeTipIos =>
      'iPhone होस्ट कर सकते हैं या स्पीकर के रूप में जुड़ सकते हैं। दूर बैठे दोस्तों तक सिग्नल की रेंज बढ़ाने के लिए Android फ़ोन इस्तेमाल करें।';

  @override
  String get homeTipDefault =>
      'पार्टी होस्ट करने या साउंड से जुड़ने के लिए तैयार!';

  @override
  String get scanHostQr => 'होस्ट का QR कोड स्कैन करें';

  @override
  String get scanHostQrSubtitle =>
      'एक टैप में कनेक्ट: Wi-Fi से जुड़ता है और आवाज़ अपने-आप सिंक करता है';

  @override
  String get alreadyOnWifi => 'मैं पहले से उसी Wi-Fi पर हूँ';

  @override
  String get connectManually => 'मैन्युअली कनेक्ट करें';

  @override
  String get wifiNameLabel => 'Wi-Fi का नाम';

  @override
  String get wifiPasswordLabel => 'Wi-Fi पासवर्ड';

  @override
  String get hostIpLabel => 'होस्ट का IP पता (वैकल्पिक)';

  @override
  String get hostIpHelper => 'होस्ट के QR कोड के नीचे मिलेगा';

  @override
  String get connectToParty => 'पार्टी से कनेक्ट करें';

  @override
  String get enterWifiName => 'कृपया Wi-Fi का नाम दर्ज करें।';

  @override
  String get joinTipIos =>
      'पूछे जाने पर कनेक्ट करने के लिए \"जुड़ें\" पर टैप करें। आवाज़ बजती रहे, इसके लिए Crowd Speaker को चालू रखें!';

  @override
  String get joinTipAndroid =>
      'पूछे जाने पर Wi-Fi कनेक्शन स्वीकार करने के लिए टैप करें और आप सीधे पार्टी में पहुँच जाएँगे।';

  @override
  String get scannerNotACode =>
      'यह Crowd Speaker का कोड नहीं है। अपने दोस्त की स्क्रीन पर दिख रहा QR स्कैन करें!';

  @override
  String get scannerHint =>
      'अपने दोस्त की स्क्रीन पर दिख रहे QR कोड की ओर कैमरा करें।';

  @override
  String get hostSetupTitle => 'पार्टी होस्ट करें 🎤';

  @override
  String get partyNameLabel => 'पार्टी का नाम';

  @override
  String get partyNameHelper => 'जुड़ते समय दोस्तों को यही दिखेगा';

  @override
  String partyNameDefault(String name) {
    return '$name की पार्टी';
  }

  @override
  String get defaultPartyName => 'पार्टी';

  @override
  String get connectQuestion => 'दोस्त कैसे कनेक्ट हों?';

  @override
  String get instantNetworkTitle => 'इंस्टैंट पार्टी नेटवर्क';

  @override
  String get badgeEasiest => 'सबसे आसान';

  @override
  String get instantNetworkSubtitle =>
      'किसी सेटअप की ज़रूरत नहीं। सबके जुड़ने के लिए तुरंत एक लोकल नेटवर्क बनाता है। (इंटरनेट की ज़रूरत नहीं)।';

  @override
  String get usePersonalHotspot => 'पर्सनल हॉटस्पॉट इस्तेमाल करें';

  @override
  String get useMyHotspot => 'मेरे फ़ोन का हॉटस्पॉट इस्तेमाल करें';

  @override
  String get hotspotSubtitle =>
      'अपने फ़ोन का हॉटस्पॉट खुद चालू करें। इससे दोस्त आपका मोबाइल इंटरनेट भी इस्तेमाल कर सकते हैं।';

  @override
  String get hotspotInfoIos =>
      'सेटिंग्स में पर्सनल हॉटस्पॉट चालू करें (\"दूसरों को जुड़ने दें\"), फिर दोस्तों के जुड़ने के लिए नीचे अपने iPhone का नाम और हॉटस्पॉट पासवर्ड दर्ज करें।';

  @override
  String get hotspotInfoAndroid =>
      'सेटिंग्स में अपना हॉटस्पॉट चालू करें, फिर दोस्तों के जुड़ने के लिए नीचे Wi-Fi का नाम और पासवर्ड दर्ज करें।';

  @override
  String get openHotspotSettings => 'हॉटस्पॉट सेटिंग्स खोलें';

  @override
  String get hotspotSettingsHint =>
      'सेटिंग्स → पर्सनल हॉटस्पॉट खोलें और \"दूसरों को जुड़ने दें\" चालू करें।';

  @override
  String get hotspotWifiNameLabel => 'हॉटस्पॉट Wi-Fi का नाम';

  @override
  String get hotspotPasswordLabel => 'हॉटस्पॉट पासवर्ड';

  @override
  String get enterHotspotName =>
      'दोस्तों के जुड़ने के लिए अपने हॉटस्पॉट का नाम दर्ज करें।';

  @override
  String get invalidWifiPassword =>
      'Wi-Fi पासवर्ड 8–63 अक्षरों का होना चाहिए। अपनी हॉटस्पॉट सेटिंग्स जाँचें और फिर कोशिश करें!';

  @override
  String get audioTuning => 'ऑडियो ट्यूनिंग';

  @override
  String get filterNoiseTitle => 'बैकग्राउंड शोर फ़िल्टर करें';

  @override
  String get filterNoiseSubtitle =>
      'आवाज़ें साफ़ रखता है। अगर आप तेज़ संगीत बजा रहे हैं या DJ उपकरण इस्तेमाल कर रहे हैं तो इसे बंद करें।';

  @override
  String get startParty => 'पार्टी शुरू करें 🔥';

  @override
  String get onTheMic => 'माइक पर 🎤';

  @override
  String get endParty => 'पार्टी खत्म करें';

  @override
  String get endPartyTitle => 'पार्टी खत्म करें?';

  @override
  String get endPartyMessage =>
      'इससे सभी स्पीकर डिस्कनेक्ट हो जाएँगे और आवाज़ बंद हो जाएगी।';

  @override
  String get somethingWentWrong => 'कुछ गड़बड़ हो गई।';

  @override
  String get firingUpParty => 'पार्टी शुरू हो रही है…';

  @override
  String get creatingPartyNetwork => 'आपका पार्टी नेटवर्क बन रहा है';

  @override
  String get scanToJoinSound => 'साउंड से जुड़ने के लिए स्कैन करें 📲';

  @override
  String get syncBufferTitle => 'साउंड सिंक बफ़र';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोन कनेक्टेड',
      one: '$count फ़ोन कनेक्टेड',
    );
    return 'दोस्तों के स्पीकर · $_temp0';
  }

  @override
  String get micMuted => 'माइक म्यूट है 🤫';

  @override
  String get liveOnAir => 'लाइव ऑन एयर 🎙️';

  @override
  String get tapToUnmute => 'अनम्यूट करके वापस आने के लिए माइक पर टैप करें';

  @override
  String get waitingForSquad => 'दोस्तों के स्कैन करके जुड़ने का इंतज़ार है…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोन स्पीकर',
      one: '$count फ़ोन स्पीकर',
    );
    return '$_temp0 पर लाइव स्ट्रीम हो रहा है';
  }

  @override
  String get bufferDelayLabel => 'आवाज़ बजने से पहले बफ़र देरी';

  @override
  String get syncBufferHelp =>
      'अगर आवाज़ अटके या कट जाए तो इसे ऊपर करें। ब्लूटूथ स्पीकर और सिग्नल बूस्टर को पूरी तरह सिंक रहने के लिए थोड़ा ज़्यादा बफ़र चाहिए।';

  @override
  String get speakerMode => 'स्पीकर मोड 🔊';

  @override
  String get leave => 'छोड़ें';

  @override
  String get leavePartyTitle => 'पार्टी छोड़ें?';

  @override
  String get leavePartyBoosterMessage =>
      'आपके बूस्टर से जुड़े दोस्त भी डिस्कनेक्ट हो जाएँगे।';

  @override
  String get leavePartyMessage => 'यह फ़ोन आवाज़ बजाना बंद कर देगा।';

  @override
  String get leaveParty => 'पार्टी छोड़ें';

  @override
  String get audioOutput => 'ऑडियो आउटपुट';

  @override
  String get thisSpeaker => 'यह स्पीकर';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route में ब्लूटूथ लैग ज़्यादा है ($latency ms), जो होस्ट के सिंक बफ़र से ज़्यादा है। होस्ट से \"साउंड सिंक बफ़र\" को $needed ms या उससे ज़्यादा करने को कहें, ताकि आपकी आवाज़ बज सके!';
  }

  @override
  String get echoFixTitle => 'इको ठीक करें (सिंक की फ़ाइन-ट्यूनिंग)';

  @override
  String get boostRangeTitle => 'दोस्तों के लिए रेंज बढ़ाएँ 📡';

  @override
  String get partyWrappedUp => 'पार्टी खत्म हो गई 🎉';

  @override
  String get hostEndedParty => 'होस्ट ने पार्टी खत्म कर दी।';

  @override
  String partyEndedByHost(String name) {
    return '\"$name\" को होस्ट ने खत्म कर दिया।';
  }

  @override
  String get backToHome => 'होम पर वापस जाएँ';

  @override
  String get joinAnotherParty => 'दूसरी पार्टी से जुड़ें';

  @override
  String get tuningIn => 'ट्यून हो रहा है…';

  @override
  String get warmingUpSpeakers => 'स्पीकर वार्म-अप हो रहे हैं';

  @override
  String connectingToWifi(String ssid) {
    return '$ssid से कनेक्ट हो रहा है…';
  }

  @override
  String get partyWifi => 'पार्टी Wi-Fi';

  @override
  String get tapAllowToConnect =>
      'कनेक्ट करने के लिए पॉप-अप में अनुमति दें पर टैप करें।';

  @override
  String get findingHost => 'होस्ट को ढूँढ रहे हैं…';

  @override
  String get searchingParty => 'इस Wi-Fi पर पार्टी खोजी जा रही है।';

  @override
  String get lockingIntoSync => 'सिंक हो रहा है…';

  @override
  String get aligningBeat => 'बीट का समय मिलाया जा रहा है।';

  @override
  String get hostIsMuted => 'होस्ट म्यूट है 🤫';

  @override
  String get hostMutedSubtitle =>
      'कनेक्ट हो गया! होस्ट के अनम्यूट करते ही आवाज़ वापस आ जाएगी।';

  @override
  String get bumpingInSync => 'सिंक में धमाल 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'सीधे $name से जुड़ा है';
  }

  @override
  String get hostFallback => 'होस्ट';

  @override
  String syncedVia(String name, int depth) {
    return '$name के ज़रिए सिंक (माइक से हॉप: $depth)';
  }

  @override
  String get boosterFallback => 'बूस्टर';

  @override
  String get reSyncing => 'दोबारा सिंक हो रहा है…';

  @override
  String get reconnectingStream => 'स्ट्रीम से दोबारा कनेक्ट हो रहा है';

  @override
  String get notConnectedYet => 'अभी कनेक्ट नहीं है';

  @override
  String get phoneSpeaker => 'फ़ोन स्पीकर';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'ब्लूटूथ देरी (+$ms ms) अपने-आप शून्य कर दी गई।';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'स्पीकर देरी (+$ms ms) अपने-आप कैलिब्रेट की गई।';
  }

  @override
  String get syncTiming => 'सिंक टाइमिंग';

  @override
  String get audioBuffer => 'ऑडियो बफ़र';

  @override
  String get streamDrops => 'स्ट्रीम ड्रॉप';

  @override
  String get autoAdjust => 'ऑटो-एडजस्ट';

  @override
  String get defaultSyncZero => 'डिफ़ॉल्ट सिंक (ज़ीरो ऑफ़सेट)';

  @override
  String nudgedEarlier(int ms) {
    return '$ms ms पहले किया गया';
  }

  @override
  String nudgedLater(int ms) {
    return '$ms ms बाद में किया गया';
  }

  @override
  String get reset => 'रीसेट';

  @override
  String get echoHelp =>
      'इको सुनाई दे रहा है? अगर यह स्पीकर बाकी सबसे पीछे बज रहा है तो दाईं ओर स्लाइड करें। अगर आगे बज रहा है तो बाईं ओर। (ज़्यादातर स्पीकर इसके बिना भी बिल्कुल सही बजते हैं!)';

  @override
  String get relayUnsupportedIos =>
      'iPhone सुनते समय Wi-Fi शेयर नहीं कर सकते। इसके बजाय किसी Android वाले दोस्त से सिग्नल बूस्टर चालू करवाएँ!';

  @override
  String get relayUnsupportedAndroid =>
      'यह फ़ोन Wi-Fi Direct बूस्टर मोड को सपोर्ट नहीं करता।';

  @override
  String get boostSignalTitle => 'दोस्तों के लिए सिग्नल बढ़ाएँ';

  @override
  String tooFarToBoost(int depth) {
    return 'रेंज और बढ़ाने के लिए होस्ट से बहुत दूर हैं (होस्ट से हॉप: $depth)।';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दोस्तों',
      one: '$count दोस्त',
    );
    return '$_temp0 के लिए आवाज़ बढ़ाई जा रही है';
  }

  @override
  String get boostSubtitleOff =>
      'आपके फ़ोन को Wi-Fi बूस्टर बना देता है, ताकि दूर के दोस्त भी कनेक्ट हो सकें।';

  @override
  String get chargerTip =>
      'हो सके तो चार्जर लगा लें: रेंज बढ़ाने में ज़्यादा बैटरी लगती है।';

  @override
  String get scanToConnectBooster =>
      'बूस्टर से कनेक्ट करने के लिए स्कैन करें 📲';

  @override
  String get reconnectSameNetwork => 'उसी नेटवर्क से दोबारा कनेक्ट करें';

  @override
  String get retry => 'फिर कोशिश करें';

  @override
  String get switchLabel => 'बदलें';

  @override
  String hostLabel(String name) {
    return '$name (होस्ट 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (बूस्टर 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · सिंक में: $count';
  }

  @override
  String get tryAgain => 'फिर कोशिश करें';

  @override
  String get back => 'वापस';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get copy => 'कॉपी करें';

  @override
  String get show => 'दिखाएँ';

  @override
  String get hide => 'छिपाएँ';

  @override
  String copied(String label) {
    return '$label कॉपी किया गया';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'पासवर्ड';

  @override
  String get labelAddress => 'पता';

  @override
  String get partyCode => 'पार्टी कोड';

  @override
  String get cameraQr => 'कैमरा QR';

  @override
  String get settingUpNetwork => 'पार्टी नेटवर्क सेट हो रहा है…';

  @override
  String get qrCameraHelp =>
      'पहले Wi-Fi से जुड़ने के लिए अपने फ़ोन के कैमरा ऐप से स्कैन करें, फिर Crowd Speaker खोलें और \"मैं पहले से उसी Wi-Fi पर हूँ\" पर टैप करें।';

  @override
  String get qrAppHelp =>
      'Crowd Speaker से स्कैन करें → \"साउंड से जुड़ें\"। एक टैप में Wi-Fi से जुड़ता है और आवाज़ अपने-आप सिंक करता है!';

  @override
  String get noSpeakersYet =>
      'अभी कोई स्पीकर नहीं है। दोस्तों से अपना QR कोड स्कैन करवाएँ!';

  @override
  String youLabel(String name) {
    return '$name (आप 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'बूस्टर 📡 · सिंक में: $count';
  }

  @override
  String bufferDetail(int ms) {
    return '$ms ms बफ़र';
  }

  @override
  String dropsDetail(String pct) {
    return '$pct% ड्रॉप';
  }

  @override
  String get errMicNeeded => 'माइक बनने के लिए माइक्रोफ़ोन की अनुमति चाहिए।';

  @override
  String get errNearbyCreate =>
      'ऐप नेटवर्क बना सके, इसके लिए \"आसपास के डिवाइस\" की अनुमति दें।';

  @override
  String get errNearbyShare =>
      'ऐप नेटवर्क शेयर कर सके, इसके लिए \"आसपास के डिवाइस\" की अनुमति दें।';

  @override
  String errNetwork(String message) {
    return 'नेटवर्क त्रुटि: $message';
  }

  @override
  String get noticeHotspotOff =>
      'आपका हॉटस्पॉट अभी चालू नहीं है। इसे चालू करें, QR कोड अपने-आप अपडेट हो जाएगा।';

  @override
  String get noticeLostHost =>
      'होस्ट से कनेक्शन टूट गया। दोबारा कोशिश हो रही है, या नीचे से कोई और नेटवर्क चुनें।';

  @override
  String noticeLostParent(String name) {
    return '$name से कनेक्शन टूट गया। दोबारा कोशिश हो रही है, या नीचे से कोई और नेटवर्क चुनें।';
  }

  @override
  String get noticeRejectSyncing =>
      'एक बूस्टर फ़ोन मिला, लेकिन वह अभी सिंक हो रहा है। थोड़ी देर में फिर कोशिश करें।';

  @override
  String get noticeRejectLoop =>
      'वह फ़ोन पहले से आपके ज़रिए जुड़ा है, इसलिए आपका सोर्स नहीं बन सकता।';

  @override
  String noticeRejectOther(String reason) {
    return 'मिले फ़ोन ने कहा: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'इस कोड में Wi-Fi पासवर्ड $length अक्षरों का है, जबकि Wi-Fi पासवर्ड 8-63 अक्षरों के होते हैं। शायद होस्ट से टाइपिंग में गलती हुई: उनसे दोबारा दर्ज करने को कहें, या Wi-Fi सेटिंग्स में \"$ssid\" से जुड़कर \"मैं पहले से उसी Wi-Fi पर हूँ\" पर टैप करें।';
  }

  @override
  String get errHostNotFound =>
      'इस Wi-Fi पर होस्ट नहीं मिला। जाँचें कि होस्ट लाइव है और आप सही नेटवर्क से जुड़े हैं।';

  @override
  String get errRelayNeedsAndroid =>
      'शेयर करने के लिए Wi-Fi Direct वाला Android फ़ोन चाहिए।';

  @override
  String errTooDeep(int depth, int max) {
    return 'यह फ़ोन होस्ट से बहुत दूर है (होस्ट से हॉप: $depth, अधिकतम $max)। शेयर करने के लिए होस्ट के नज़दीकी नेटवर्क से जुड़ें।';
  }

  @override
  String notifHosting(String name) {
    return '\"$name\" होस्ट हो रही है';
  }

  @override
  String notifPlaying(String name) {
    return '\"$name\" बज रही है';
  }
}
