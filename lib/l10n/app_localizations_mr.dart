// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get homeTagline =>
      'तुमच्या मित्रांचे फोन एका प्रचंड साउंड सिस्टममध्ये बदला. 🔊 एक फोन माइक सांभाळतो, आणि बाकीचे सर्व फोन (जोडलेले ब्लूटूथ स्पीकरही) आवाज सिंकमध्ये वाजवतात.';

  @override
  String get nameLabel => 'तुमचे नाव किंवा टोपणनाव';

  @override
  String get nameHelper => 'मित्रांना त्यांच्या स्क्रीनवर हेच दिसेल';

  @override
  String get homeVibeTitle => 'आज मूड काय आहे?';

  @override
  String get hostCardTitle => 'माइक हातात घ्या 🎤';

  @override
  String get hostCardSubtitle =>
      'पार्टी होस्ट करा. तुम्ही जे बोलाल किंवा स्ट्रीम कराल ते सर्वांच्या स्पीकरवर रिअल-टाइममध्ये वाजेल.';

  @override
  String get joinCardTitle => 'आवाजात सामील व्हा 🔊';

  @override
  String get joinCardSubtitle =>
      'होस्टचा QR कोड स्कॅन करा. हा फोन किंवा तुमचा ब्लूटूथ स्पीकर पार्टीचा भाग बनवा.';

  @override
  String get homeTipRelay =>
      'टीप: हा फोन रेंज वाढवू शकतो! कनेक्ट झाल्यावर तुम्ही जवळच्या आणखी मित्रांसोबत आवाज शेअर करू शकता.';

  @override
  String get homeTipIos =>
      'iPhone होस्ट करू शकतात किंवा स्पीकर म्हणून सामील होऊ शकतात. दूरच्या मित्रांसाठी सिग्नल रेंज वाढवण्यासाठी Android फोन वापरा.';

  @override
  String get homeTipDefault =>
      'पार्टी होस्ट करण्यासाठी किंवा आवाजात सामील होण्यासाठी तयार!';

  @override
  String get scanHostQr => 'होस्टचा QR कोड स्कॅन करा';

  @override
  String get scanHostQrSubtitle =>
      'एका टॅपमध्ये कनेक्ट: Wi-Fi शी जोडते आणि आवाज आपोआप सिंक करते';

  @override
  String get alreadyOnWifi => 'मी आधीच त्याच Wi-Fi वर आहे';

  @override
  String get connectManually => 'मॅन्युअली कनेक्ट करा';

  @override
  String get wifiNameLabel => 'Wi-Fi चे नाव';

  @override
  String get wifiPasswordLabel => 'Wi-Fi पासवर्ड';

  @override
  String get hostIpLabel => 'होस्टचा IP पत्ता (ऐच्छिक)';

  @override
  String get hostIpHelper => 'होस्टच्या QR कोडखाली सापडेल';

  @override
  String get connectToParty => 'पार्टीशी कनेक्ट करा';

  @override
  String get enterWifiName => 'कृपया Wi-Fi चे नाव टाका.';

  @override
  String get joinTipIos =>
      'विचारल्यावर कनेक्ट होण्यासाठी \"सामील व्हा\" वर टॅप करा. आवाज चालू राहावा म्हणून Crowd Speaker उघडा ठेवा!';

  @override
  String get joinTipAndroid =>
      'विचारल्यावर Wi-Fi कनेक्शन स्वीकारण्यासाठी टॅप करा आणि तुम्ही थेट पार्टीत पोहोचाल.';

  @override
  String get scannerNotACode =>
      'हा Crowd Speaker चा कोड नाही. मित्राच्या स्क्रीनवरील QR स्कॅन करा!';

  @override
  String get scannerHint => 'मित्राच्या स्क्रीनवरील QR कोडकडे कॅमेरा न्या.';

  @override
  String get hostSetupTitle => 'पार्टी होस्ट करा 🎤';

  @override
  String get partyNameLabel => 'पार्टीचे नाव';

  @override
  String get partyNameHelper => 'सामील होताना मित्रांना हेच दिसेल';

  @override
  String partyNameDefault(String name) {
    return '$name यांची पार्टी';
  }

  @override
  String get defaultPartyName => 'पार्टी';

  @override
  String get connectQuestion => 'मित्रांनी कसे कनेक्ट व्हावे?';

  @override
  String get instantNetworkTitle => 'इन्स्टंट पार्टी नेटवर्क';

  @override
  String get badgeEasiest => 'सर्वात सोपे';

  @override
  String get instantNetworkSubtitle =>
      'कोणत्याही सेटअपची गरज नाही. सर्वांना सामील होण्यासाठी त्वरित एक लोकल नेटवर्क तयार करते. (इंटरनेटची गरज नाही).';

  @override
  String get usePersonalHotspot => 'पर्सनल हॉटस्पॉट वापरा';

  @override
  String get useMyHotspot => 'माझ्या फोनचा हॉटस्पॉट वापरा';

  @override
  String get hotspotSubtitle =>
      'तुमच्या फोनचा हॉटस्पॉट स्वतः चालू करा. यामुळे मित्र तुमचे मोबाइल इंटरनेटही वापरू शकतात.';

  @override
  String get hotspotInfoIos =>
      'सेटिंग्जमध्ये पर्सनल हॉटस्पॉट चालू करा (\"इतरांना सामील होऊ द्या\"), मग मित्रांना सामील होता यावे म्हणून खाली तुमच्या iPhone चे नाव आणि हॉटस्पॉट पासवर्ड टाका.';

  @override
  String get hotspotInfoAndroid =>
      'सेटिंग्जमध्ये हॉटस्पॉट चालू करा, मग मित्रांना सामील होता यावे म्हणून खाली तुमचे Wi-Fi नाव आणि पासवर्ड टाका.';

  @override
  String get openHotspotSettings => 'हॉटस्पॉट सेटिंग्ज उघडा';

  @override
  String get hotspotSettingsHint =>
      'सेटिंग्ज → पर्सनल हॉटस्पॉट उघडा आणि \"इतरांना सामील होऊ द्या\" चालू करा.';

  @override
  String get hotspotWifiNameLabel => 'हॉटस्पॉट Wi-Fi चे नाव';

  @override
  String get hotspotPasswordLabel => 'हॉटस्पॉट पासवर्ड';

  @override
  String get enterHotspotName =>
      'मित्रांना सामील होता यावे म्हणून तुमच्या हॉटस्पॉटचे नाव टाका.';

  @override
  String get invalidWifiPassword =>
      'Wi-Fi पासवर्ड 8–63 अक्षरांचा असावा. तुमच्या हॉटस्पॉट सेटिंग्ज तपासा आणि पुन्हा प्रयत्न करा!';

  @override
  String get audioTuning => 'ऑडिओ ट्यूनिंग';

  @override
  String get filterNoiseTitle => 'पार्श्वभूमीचा आवाज फिल्टर करा';

  @override
  String get filterNoiseSubtitle =>
      'आवाज स्पष्ट ठेवते. मोठ्या आवाजात संगीत लावत असाल किंवा DJ उपकरणे वापरत असाल तर बंद करा.';

  @override
  String get startParty => 'पार्टी सुरू करा 🔥';

  @override
  String get onTheMic => 'माइकवर 🎤';

  @override
  String get endParty => 'पार्टी संपवा';

  @override
  String get endPartyTitle => 'पार्टी संपवायची?';

  @override
  String get endPartyMessage =>
      'यामुळे सर्व स्पीकर डिस्कनेक्ट होतील आणि आवाज थांबेल.';

  @override
  String get somethingWentWrong => 'काहीतरी चुकले.';

  @override
  String get firingUpParty => 'पार्टी सुरू होत आहे…';

  @override
  String get creatingPartyNetwork => 'तुमचे पार्टी नेटवर्क तयार होत आहे';

  @override
  String get scanToJoinSound => 'आवाजात सामील होण्यासाठी स्कॅन करा 📲';

  @override
  String get syncBufferTitle => 'साउंड सिंक बफर';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फोन कनेक्ट आहेत',
      one: '$count फोन कनेक्ट आहे',
    );
    return 'मित्रांचे स्पीकर · $_temp0';
  }

  @override
  String get micMuted => 'माइक म्यूट आहे 🤫';

  @override
  String get liveOnAir => 'लाइव्ह ऑन एअर 🎙️';

  @override
  String get tapToUnmute => 'अनम्यूट करून परत येण्यासाठी माइकवर टॅप करा';

  @override
  String get waitingForSquad => 'मित्र स्कॅन करून सामील होण्याची वाट पाहत आहे…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फोन स्पीकरवर',
      one: '$count फोन स्पीकरवर',
    );
    return '$_temp0 लाइव्ह स्ट्रीमिंग सुरू आहे';
  }

  @override
  String get bufferDelayLabel => 'आवाज वाजण्यापूर्वीचा बफर विलंब';

  @override
  String get syncBufferHelp =>
      'आवाज अडखळला किंवा तुटला तर हे वर सरकवा. ब्लूटूथ स्पीकर आणि सिग्नल बूस्टरना पूर्णपणे सिंकमध्ये राहण्यासाठी थोडा जास्त बफर लागतो.';

  @override
  String get speakerMode => 'स्पीकर मोड 🔊';

  @override
  String get leave => 'बाहेर पडा';

  @override
  String get leavePartyTitle => 'पार्टी सोडायची?';

  @override
  String get leavePartyBoosterMessage =>
      'तुमच्या बूस्टरमार्फत कनेक्ट झालेले मित्रही डिस्कनेक्ट होतील.';

  @override
  String get leavePartyMessage => 'हा फोन आवाज वाजवणे थांबवेल.';

  @override
  String get leaveParty => 'पार्टी सोडा';

  @override
  String get audioOutput => 'ऑडिओ आउटपुट';

  @override
  String get thisSpeaker => 'हा स्पीकर';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route मध्ये ब्लूटूथ लॅग जास्त आहे ($latency ms), जो होस्टच्या सिंक बफरपेक्षा जास्त आहे. तुमचा आवाज वाजावा म्हणून होस्टला \"साउंड सिंक बफर\" $needed ms किंवा त्याहून जास्त करायला सांगा!';
  }

  @override
  String get echoFixTitle => 'इको दुरुस्ती (सिंक फाइन-ट्यून)';

  @override
  String get boostRangeTitle => 'मित्रांसाठी रेंज वाढवा 📡';

  @override
  String get partyWrappedUp => 'पार्टी संपली 🎉';

  @override
  String get hostEndedParty => 'होस्टने पार्टी संपवली.';

  @override
  String partyEndedByHost(String name) {
    return '\"$name\" होस्टने संपवली.';
  }

  @override
  String get backToHome => 'होमवर परत जा';

  @override
  String get joinAnotherParty => 'दुसऱ्या पार्टीत सामील व्हा';

  @override
  String get tuningIn => 'ट्यून होत आहे…';

  @override
  String get warmingUpSpeakers => 'स्पीकर वॉर्म-अप होत आहेत';

  @override
  String connectingToWifi(String ssid) {
    return '$ssid शी कनेक्ट होत आहे…';
  }

  @override
  String get partyWifi => 'पार्टी Wi-Fi';

  @override
  String get tapAllowToConnect =>
      'कनेक्ट होण्यासाठी पॉप-अपमध्ये परवानगी द्या वर टॅप करा.';

  @override
  String get findingHost => 'होस्ट शोधत आहे…';

  @override
  String get searchingParty => 'या Wi-Fi वर पार्टी शोधत आहे.';

  @override
  String get lockingIntoSync => 'सिंक होत आहे…';

  @override
  String get aligningBeat => 'बीटची वेळ जुळवत आहे.';

  @override
  String get hostIsMuted => 'होस्ट म्यूट आहे 🤫';

  @override
  String get hostMutedSubtitle =>
      'कनेक्ट झाले! ते अनम्यूट करताच आवाज परत येईल.';

  @override
  String get bumpingInSync => 'सिंकमध्ये धमाल 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'थेट $name शी जोडलेले';
  }

  @override
  String get hostFallback => 'होस्ट';

  @override
  String syncedVia(String name, int depth) {
    return '$name मार्फत सिंक (माइकपासून हॉप: $depth)';
  }

  @override
  String get boosterFallback => 'बूस्टर';

  @override
  String get reSyncing => 'पुन्हा सिंक होत आहे…';

  @override
  String get reconnectingStream => 'स्ट्रीमशी पुन्हा कनेक्ट होत आहे';

  @override
  String get notConnectedYet => 'अजून कनेक्ट झालेले नाही';

  @override
  String get phoneSpeaker => 'फोन स्पीकर';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'ब्लूटूथ विलंब (+$ms ms) आपोआप शून्य केला.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'स्पीकर विलंब (+$ms ms) आपोआप कॅलिब्रेट केला.';
  }

  @override
  String get syncTiming => 'सिंक टायमिंग';

  @override
  String get audioBuffer => 'ऑडिओ बफर';

  @override
  String get streamDrops => 'स्ट्रीम ड्रॉप';

  @override
  String get autoAdjust => 'ऑटो-अॅडजस्ट';

  @override
  String get defaultSyncZero => 'डिफॉल्ट सिंक (शून्य ऑफसेट)';

  @override
  String nudgedEarlier(int ms) {
    return '$ms ms आधी केले';
  }

  @override
  String nudgedLater(int ms) {
    return '$ms ms नंतर केले';
  }

  @override
  String get reset => 'रीसेट';

  @override
  String get echoHelp =>
      'इको ऐकू येतोय का? हा स्पीकर बाकीच्यांपेक्षा मागे वाजत असेल तर उजवीकडे सरकवा. पुढे वाजत असेल तर डावीकडे. (बहुतेक स्पीकर याशिवायही अगदी बरोबर वाजतात!)';

  @override
  String get relayUnsupportedIos =>
      'iPhone ऐकताना Wi-Fi शेअर करू शकत नाही. त्याऐवजी Android वापरणाऱ्या मित्राला सिग्नल बूस्टर चालू करायला सांगा!';

  @override
  String get relayUnsupportedAndroid =>
      'हा फोन Wi-Fi Direct बूस्टर मोडला सपोर्ट करत नाही.';

  @override
  String get boostSignalTitle => 'मित्रांसाठी सिग्नल वाढवा';

  @override
  String tooFarToBoost(int depth) {
    return 'रेंज आणखी वाढवण्यासाठी होस्टपासून खूप दूर आहे (होस्टपासून हॉप: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count मित्रांसाठी',
      one: '$count मित्रासाठी',
    );
    return '$_temp0 आवाज वाढवत आहे';
  }

  @override
  String get boostSubtitleOff =>
      'तुमचा फोन Wi-Fi बूस्टर बनवते, म्हणजे दूरचे मित्र कनेक्ट होऊ शकतात.';

  @override
  String get chargerTip =>
      'शक्य असल्यास चार्जर लावा: रेंज वाढवण्यासाठी जास्त बॅटरी लागते.';

  @override
  String get scanToConnectBooster =>
      'बूस्टरमार्फत कनेक्ट होण्यासाठी स्कॅन करा 📲';

  @override
  String get reconnectSameNetwork => 'त्याच नेटवर्कशी पुन्हा कनेक्ट करा';

  @override
  String get retry => 'पुन्हा प्रयत्न करा';

  @override
  String get switchLabel => 'बदला';

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
    return '$ssid · सिंकमध्ये: $count';
  }

  @override
  String get tryAgain => 'पुन्हा प्रयत्न करा';

  @override
  String get back => 'मागे';

  @override
  String get cancel => 'रद्द करा';

  @override
  String get copy => 'कॉपी करा';

  @override
  String get show => 'दाखवा';

  @override
  String get hide => 'लपवा';

  @override
  String copied(String label) {
    return '$label कॉपी केले';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'पासवर्ड';

  @override
  String get labelAddress => 'पत्ता';

  @override
  String get partyCode => 'पार्टी कोड';

  @override
  String get cameraQr => 'कॅमेरा QR';

  @override
  String get settingUpNetwork => 'पार्टी नेटवर्क सेट होत आहे…';

  @override
  String get qrCameraHelp =>
      'आधी Wi-Fi शी जोडण्यासाठी फोनच्या कॅमेरा अॅपने स्कॅन करा, मग Crowd Speaker उघडा आणि \"मी आधीच त्याच Wi-Fi वर आहे\" वर टॅप करा.';

  @override
  String get qrAppHelp =>
      'Crowd Speaker ने स्कॅन करा → \"आवाजात सामील व्हा\". एका टॅपमध्ये Wi-Fi शी जोडते आणि आवाज आपोआप सिंक करते!';

  @override
  String get noSpeakersYet =>
      'अजून स्पीकर नाहीत. मित्रांना तुमचा QR कोड स्कॅन करून सामील व्हायला सांगा!';

  @override
  String youLabel(String name) {
    return '$name (तुम्ही 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'बूस्टर 📡 · सिंकमध्ये: $count';
  }

  @override
  String bufferDetail(int ms) {
    return '$ms ms बफर';
  }

  @override
  String dropsDetail(String pct) {
    return '$pct% ड्रॉप';
  }

  @override
  String get errMicNeeded => 'माइक होण्यासाठी मायक्रोफोनचा अॅक्सेस आवश्यक आहे.';

  @override
  String get errNearbyCreate =>
      'अॅपला नेटवर्क तयार करता यावे म्हणून \"जवळपासची उपकरणे\" ला परवानगी द्या.';

  @override
  String get errNearbyShare =>
      'अॅपला नेटवर्क शेअर करता यावे म्हणून \"जवळपासची उपकरणे\" ला परवानगी द्या.';

  @override
  String errNetwork(String message) {
    return 'नेटवर्क त्रुटी: $message';
  }

  @override
  String get noticeHotspotOff =>
      'तुमचा हॉटस्पॉट अजून चालू नाही. तो चालू करा, QR कोड आपोआप अपडेट होईल.';

  @override
  String get noticeLostHost =>
      'होस्टशी कनेक्शन तुटले. पुन्हा प्रयत्न सुरू आहे, किंवा खालून दुसरे नेटवर्क निवडा.';

  @override
  String noticeLostParent(String name) {
    return '$name शी कनेक्शन तुटले. पुन्हा प्रयत्न सुरू आहे, किंवा खालून दुसरे नेटवर्क निवडा.';
  }

  @override
  String get noticeRejectSyncing =>
      'एक बूस्टर फोन सापडला, पण तो अजून सिंक होत आहे. थोड्या वेळाने पुन्हा प्रयत्न करा.';

  @override
  String get noticeRejectLoop =>
      'तो फोन आधीच तुमच्यामार्फत कनेक्ट आहे, त्यामुळे तो तुमचा स्रोत होऊ शकत नाही.';

  @override
  String noticeRejectOther(String reason) {
    return 'सापडलेल्या फोनने सांगितले: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'या कोडमधील Wi-Fi पासवर्ड $length अक्षरांचा आहे, पण Wi-Fi पासवर्ड 8-63 अक्षरांचे असतात. होस्टने कदाचित चुकीचा टाइप केला असेल: त्यांना पुन्हा टाकायला सांगा, किंवा Wi-Fi सेटिंग्जमध्ये \"$ssid\" शी जोडून \"मी आधीच त्याच Wi-Fi वर आहे\" वर टॅप करा.';
  }

  @override
  String get errHostNotFound =>
      'या Wi-Fi वर होस्ट सापडला नाही. होस्ट लाइव्ह आहे आणि तुम्ही योग्य नेटवर्कशी जोडले आहात का ते तपासा.';

  @override
  String get errRelayNeedsAndroid =>
      'शेअर करण्यासाठी Wi-Fi Direct असलेला Android फोन हवा.';

  @override
  String errTooDeep(int depth, int max) {
    return 'हा फोन होस्टपासून खूप दूर आहे (होस्टपासून हॉप: $depth, कमाल $max). शेअर करण्यासाठी होस्टच्या जवळच्या नेटवर्कशी जोडा.';
  }

  @override
  String notifHosting(String name) {
    return '\"$name\" होस्ट करत आहे';
  }

  @override
  String notifPlaying(String name) {
    return '\"$name\" वाजत आहे';
  }
}
