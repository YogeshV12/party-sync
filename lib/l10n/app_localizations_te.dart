// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get homeTagline =>
      'మీ స్నేహితుల ఫోన్లను ఒక భారీ సౌండ్ సిస్టమ్‌గా మార్చండి. 🔊 ఒక ఫోన్ మైక్ పట్టుకుంటుంది, మిగతా అన్ని ఫోన్లు (కనెక్ట్ చేసిన బ్లూటూత్ స్పీకర్లు కూడా) శబ్దాన్ని సింక్‌లో ప్లే చేస్తాయి.';

  @override
  String get nameLabel => 'మీ పేరు లేదా ముద్దుపేరు';

  @override
  String get nameHelper => 'స్నేహితులు తమ స్క్రీన్‌పై చూసేది';

  @override
  String get homeVibeTitle => 'ఈరోజు మూడ్ ఏంటి?';

  @override
  String get hostCardTitle => 'మైక్ పట్టుకోండి 🎤';

  @override
  String get hostCardSubtitle =>
      'పార్టీని హోస్ట్ చేయండి. మీరు మాట్లాడేది లేదా స్ట్రీమ్ చేసేది అందరి స్పీకర్లలో రియల్ టైమ్‌లో ప్లే అవుతుంది.';

  @override
  String get joinCardTitle => 'సౌండ్‌లో చేరండి 🔊';

  @override
  String get joinCardSubtitle =>
      'హోస్ట్ QR కోడ్‌ను స్కాన్ చేయండి. ఈ ఫోన్‌ను లేదా మీ బ్లూటూత్ స్పీకర్‌ను పార్టీలో భాగం చేయండి.';

  @override
  String get homeTipRelay =>
      'చిట్కా: ఈ ఫోన్ పరిధిని పెంచగలదు! కనెక్ట్ అయిన తర్వాత మీరు సమీపంలోని మరింత మంది స్నేహితులతో శబ్దాన్ని పంచుకోవచ్చు.';

  @override
  String get homeTipIos =>
      'iPhone హోస్ట్ చేయవచ్చు లేదా స్పీకర్లుగా చేరవచ్చు. దూరంగా ఉన్న స్నేహితులకు సిగ్నల్ పరిధి పెంచడానికి Android ఫోన్ ఉపయోగించండి.';

  @override
  String get homeTipDefault =>
      'పార్టీని హోస్ట్ చేయడానికి లేదా సౌండ్‌లో చేరడానికి సిద్ధం!';

  @override
  String get scanHostQr => 'హోస్ట్ QR కోడ్‌ను స్కాన్ చేయండి';

  @override
  String get scanHostQrSubtitle =>
      'ఒక్క ట్యాప్‌తో కనెక్ట్: Wi-Fiకి కనెక్ట్ అయి శబ్దాన్ని ఆటోమేటిక్‌గా సింక్ చేస్తుంది';

  @override
  String get alreadyOnWifi => 'నేను ఇప్పటికే అదే Wi-Fiలో ఉన్నాను';

  @override
  String get connectManually => 'మాన్యువల్‌గా కనెక్ట్ చేయండి';

  @override
  String get wifiNameLabel => 'Wi-Fi పేరు';

  @override
  String get wifiPasswordLabel => 'Wi-Fi పాస్‌వర్డ్';

  @override
  String get hostIpLabel => 'హోస్ట్ IP చిరునామా (ఐచ్ఛికం)';

  @override
  String get hostIpHelper => 'హోస్ట్ QR కోడ్ కింద ఉంటుంది';

  @override
  String get connectToParty => 'పార్టీకి కనెక్ట్ అవ్వండి';

  @override
  String get enterWifiName => 'దయచేసి Wi-Fi పేరు నమోదు చేయండి.';

  @override
  String get joinTipIos =>
      'అడిగినప్పుడు కనెక్ట్ కావడానికి \"చేరండి\" నొక్కండి. శబ్దం ప్లే అవుతూ ఉండేందుకు Crowd Speakerను తెరిచి ఉంచండి!';

  @override
  String get joinTipAndroid =>
      'అడిగినప్పుడు Wi-Fi కనెక్షన్‌ను అంగీకరించడానికి నొక్కండి, మీరు నేరుగా పార్టీలోకి వెళ్తారు.';

  @override
  String get scannerNotACode =>
      'ఇది Crowd Speaker కోడ్ కాదు. మీ స్నేహితుడి స్క్రీన్‌పై ఉన్న QRను స్కాన్ చేయండి!';

  @override
  String get scannerHint =>
      'మీ స్నేహితుడి స్క్రీన్‌పై ఉన్న QR కోడ్ వైపు కెమెరా పెట్టండి.';

  @override
  String get hostSetupTitle => 'పార్టీని హోస్ట్ చేయండి 🎤';

  @override
  String get partyNameLabel => 'పార్టీ పేరు';

  @override
  String get partyNameHelper => 'చేరినప్పుడు స్నేహితులు చూసేది';

  @override
  String partyNameDefault(String name) {
    return '$name పార్టీ';
  }

  @override
  String get defaultPartyName => 'పార్టీ';

  @override
  String get connectQuestion => 'స్నేహితులు ఎలా కనెక్ట్ అవ్వాలి?';

  @override
  String get instantNetworkTitle => 'ఇన్‌స్టంట్ పార్టీ నెట్‌వర్క్';

  @override
  String get badgeEasiest => 'అత్యంత సులభం';

  @override
  String get instantNetworkSubtitle =>
      'ఎలాంటి సెటప్ అవసరం లేదు. అందరూ చేరడానికి తక్షణమే ఒక లోకల్ నెట్‌వర్క్‌ను సృష్టిస్తుంది. (ఇంటర్నెట్ అవసరం లేదు).';

  @override
  String get usePersonalHotspot => 'పర్సనల్ హాట్‌స్పాట్ ఉపయోగించండి';

  @override
  String get useMyHotspot => 'నా ఫోన్ హాట్‌స్పాట్ ఉపయోగించండి';

  @override
  String get hotspotSubtitle =>
      'మీ ఫోన్ హాట్‌స్పాట్‌ను మాన్యువల్‌గా ఆన్ చేయండి. స్నేహితులు మీ మొబైల్ ఇంటర్నెట్‌ను కూడా పంచుకోవచ్చు.';

  @override
  String get hotspotInfoIos =>
      'సెట్టింగ్స్‌లో పర్సనల్ హాట్‌స్పాట్ ఆన్ చేయండి (\"ఇతరులను చేరడానికి అనుమతించు\"), ఆపై స్నేహితులు చేరడానికి కింద మీ iPhone పేరు మరియు హాట్‌స్పాట్ పాస్‌వర్డ్ నమోదు చేయండి.';

  @override
  String get hotspotInfoAndroid =>
      'సెట్టింగ్స్‌లో హాట్‌స్పాట్ ఆన్ చేయండి, ఆపై స్నేహితులు చేరడానికి కింద మీ Wi-Fi పేరు మరియు పాస్‌వర్డ్ నమోదు చేయండి.';

  @override
  String get openHotspotSettings => 'హాట్‌స్పాట్ సెట్టింగ్స్ తెరవండి';

  @override
  String get hotspotSettingsHint =>
      'సెట్టింగ్స్ → పర్సనల్ హాట్‌స్పాట్ తెరిచి \"ఇతరులను చేరడానికి అనుమతించు\" ఆన్ చేయండి.';

  @override
  String get hotspotWifiNameLabel => 'హాట్‌స్పాట్ Wi-Fi పేరు';

  @override
  String get hotspotPasswordLabel => 'హాట్‌స్పాట్ పాస్‌వర్డ్';

  @override
  String get enterHotspotName =>
      'స్నేహితులు చేరడానికి మీ హాట్‌స్పాట్ పేరు నమోదు చేయండి.';

  @override
  String get invalidWifiPassword =>
      'Wi-Fi పాస్‌వర్డ్‌లు 8–63 అక్షరాలు ఉండాలి. మీ హాట్‌స్పాట్ సెట్టింగ్స్ తనిఖీ చేసి మళ్లీ ప్రయత్నించండి!';

  @override
  String get audioTuning => 'ఆడియో ట్యూనింగ్';

  @override
  String get filterNoiseTitle => 'బ్యాక్‌గ్రౌండ్ శబ్దాన్ని ఫిల్టర్ చేయండి';

  @override
  String get filterNoiseSubtitle =>
      'స్వరాలను స్పష్టంగా ఉంచుతుంది. పెద్ద శబ్దంతో సంగీతం ప్లే చేస్తున్నా లేదా DJ పరికరాలు వాడుతున్నా ఆఫ్ చేయండి.';

  @override
  String get startParty => 'పార్టీ ప్రారంభించండి 🔥';

  @override
  String get onTheMic => 'మైక్‌పై ఉన్నారు 🎤';

  @override
  String get endParty => 'పార్టీ ముగించండి';

  @override
  String get endPartyTitle => 'పార్టీ ముగించాలా?';

  @override
  String get endPartyMessage =>
      'ఇది అన్ని స్పీకర్లను డిస్‌కనెక్ట్ చేసి శబ్దాన్ని ఆపేస్తుంది.';

  @override
  String get somethingWentWrong => 'ఏదో తప్పు జరిగింది.';

  @override
  String get firingUpParty => 'పార్టీ మొదలవుతోంది…';

  @override
  String get creatingPartyNetwork => 'మీ పార్టీ నెట్‌వర్క్ సృష్టించబడుతోంది';

  @override
  String get scanToJoinSound => 'సౌండ్‌లో చేరడానికి స్కాన్ చేయండి 📲';

  @override
  String get syncBufferTitle => 'సౌండ్ సింక్ బఫర్';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ఫోన్లు కనెక్ట్ అయ్యాయి',
      one: '$count ఫోన్ కనెక్ట్ అయింది',
    );
    return 'స్నేహితుల స్పీకర్లు · $_temp0';
  }

  @override
  String get micMuted => 'మైక్ మ్యూట్ అయింది 🤫';

  @override
  String get liveOnAir => 'లైవ్ ఆన్ ఎయిర్ 🎙️';

  @override
  String get tapToUnmute => 'అన్‌మ్యూట్ చేసి తిరిగి రావడానికి మైక్‌ను నొక్కండి';

  @override
  String get waitingForSquad =>
      'స్నేహితులు స్కాన్ చేసి చేరడం కోసం ఎదురుచూస్తోంది…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ఫోన్ స్పీకర్లకు',
      one: '$count ఫోన్ స్పీకర్‌కు',
    );
    return '$_temp0 లైవ్ స్ట్రీమింగ్ అవుతోంది';
  }

  @override
  String get bufferDelayLabel => 'శబ్దం ప్లే అయ్యే ముందు బఫర్ ఆలస్యం';

  @override
  String get syncBufferHelp =>
      'ఆడియో తడబడినా లేదా తెగిపోయినా దీన్ని పైకి జరపండి. బ్లూటూత్ స్పీకర్లు మరియు సిగ్నల్ బూస్టర్లు సంపూర్ణ సింక్‌లో ఉండడానికి కొంచెం ఎక్కువ బఫర్ అవసరం.';

  @override
  String get speakerMode => 'స్పీకర్ మోడ్ 🔊';

  @override
  String get leave => 'వెళ్ళిపోండి';

  @override
  String get leavePartyTitle => 'పార్టీ నుండి వెళ్ళిపోవాలా?';

  @override
  String get leavePartyBoosterMessage =>
      'మీ బూస్టర్ ద్వారా కనెక్ట్ అయిన స్నేహితులు కూడా డిస్‌కనెక్ట్ అవుతారు.';

  @override
  String get leavePartyMessage => 'ఈ ఫోన్ శబ్దం ప్లే చేయడం ఆపేస్తుంది.';

  @override
  String get leaveParty => 'పార్టీ నుండి వెళ్ళిపోండి';

  @override
  String get audioOutput => 'ఆడియో అవుట్‌పుట్';

  @override
  String get thisSpeaker => 'ఈ స్పీకర్';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$routeకు బ్లూటూత్ లాగ్ ఎక్కువగా ఉంది ($latency ms), ఇది హోస్ట్ సింక్ బఫర్ కంటే ఎక్కువ. మీ శబ్దం ప్లే అవ్వడానికి \"సౌండ్ సింక్ బఫర్\"ను $needed ms లేదా అంతకంటే ఎక్కువకు పెంచమని హోస్ట్‌ను అడగండి!';
  }

  @override
  String get echoFixTitle => 'ఎకో సవరణ (సింక్ ఫైన్-ట్యూన్)';

  @override
  String get boostRangeTitle => 'స్నేహితుల కోసం పరిధి పెంచండి 📡';

  @override
  String get partyWrappedUp => 'పార్టీ ముగిసింది 🎉';

  @override
  String get hostEndedParty => 'హోస్ట్ పార్టీని ముగించారు.';

  @override
  String partyEndedByHost(String name) {
    return '\"$name\"ను హోస్ట్ ముగించారు.';
  }

  @override
  String get backToHome => 'హోమ్‌కి తిరిగి వెళ్ళండి';

  @override
  String get joinAnotherParty => 'మరో పార్టీలో చేరండి';

  @override
  String get tuningIn => 'ట్యూన్ అవుతోంది…';

  @override
  String get warmingUpSpeakers => 'స్పీకర్లు వార్మ్ అప్ అవుతున్నాయి';

  @override
  String connectingToWifi(String ssid) {
    return '$ssidకు కనెక్ట్ అవుతోంది…';
  }

  @override
  String get partyWifi => 'పార్టీ Wi-Fi';

  @override
  String get tapAllowToConnect =>
      'కనెక్ట్ కావడానికి పాప్-అప్‌లో అనుమతించు నొక్కండి.';

  @override
  String get findingHost => 'హోస్ట్‌ను వెతుకుతోంది…';

  @override
  String get searchingParty => 'ఈ Wi-Fiలో పార్టీ కోసం వెతుకుతోంది.';

  @override
  String get lockingIntoSync => 'సింక్ అవుతోంది…';

  @override
  String get aligningBeat => 'బీట్ టైమింగ్ సర్దుబాటు అవుతోంది.';

  @override
  String get hostIsMuted => 'హోస్ట్ మ్యూట్‌లో ఉన్నారు 🤫';

  @override
  String get hostMutedSubtitle =>
      'కనెక్ట్ అయింది! వారు అన్‌మ్యూట్ చేయగానే శబ్దం తిరిగి వస్తుంది.';

  @override
  String get bumpingInSync => 'సింక్‌లో అదరగొడుతోంది 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return '$nameకు నేరుగా లింక్ అయింది';
  }

  @override
  String get hostFallback => 'హోస్ట్';

  @override
  String syncedVia(String name, int depth) {
    return '$name ద్వారా సింక్ (మైక్ నుండి హాప్‌లు: $depth)';
  }

  @override
  String get boosterFallback => 'బూస్టర్';

  @override
  String get reSyncing => 'మళ్లీ సింక్ అవుతోంది…';

  @override
  String get reconnectingStream => 'స్ట్రీమ్‌కు మళ్లీ కనెక్ట్ అవుతోంది';

  @override
  String get notConnectedYet => 'ఇంకా కనెక్ట్ కాలేదు';

  @override
  String get phoneSpeaker => 'ఫోన్ స్పీకర్';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'బ్లూటూత్ ఆలస్యం (+$ms ms) ఆటోమేటిక్‌గా సరిచేయబడింది.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'స్పీకర్ ఆలస్యం (+$ms ms) ఆటోమేటిక్‌గా క్యాలిబ్రేట్ చేయబడింది.';
  }

  @override
  String get syncTiming => 'సింక్ టైమింగ్';

  @override
  String get audioBuffer => 'ఆడియో బఫర్';

  @override
  String get streamDrops => 'స్ట్రీమ్ డ్రాప్‌లు';

  @override
  String get autoAdjust => 'ఆటో-అడ్జస్ట్';

  @override
  String get defaultSyncZero => 'డిఫాల్ట్ సింక్ (జీరో ఆఫ్‌సెట్)';

  @override
  String nudgedEarlier(int ms) {
    return '$ms ms ముందుకు జరిపారు';
  }

  @override
  String nudgedLater(int ms) {
    return '$ms ms వెనక్కి జరిపారు';
  }

  @override
  String get reset => 'రీసెట్';

  @override
  String get echoHelp =>
      'ఎకో వినిపిస్తోందా? ఈ స్పీకర్ మిగతావారి కంటే వెనకబడి వినిపిస్తే కుడివైపు జరపండి. ముందుగా వినిపిస్తే ఎడమవైపు. (చాలా స్పీకర్లు ఇది లేకుండానే సరిగ్గా వినిపిస్తాయి!)';

  @override
  String get relayUnsupportedIos =>
      'iPhone వింటున్నప్పుడు Wi-Fiని పంచుకోలేదు. బదులుగా Android ఉన్న స్నేహితుడిని సిగ్నల్ బూస్టర్ ఆన్ చేయమని అడగండి!';

  @override
  String get relayUnsupportedAndroid =>
      'ఈ ఫోన్ Wi-Fi Direct బూస్టర్ మోడ్‌ను సపోర్ట్ చేయదు.';

  @override
  String get boostSignalTitle => 'స్నేహితుల కోసం సిగ్నల్ పెంచండి';

  @override
  String tooFarToBoost(int depth) {
    return 'పరిధిని మరింత పెంచడానికి హోస్ట్‌కు చాలా దూరంగా ఉంది (హోస్ట్ నుండి హాప్‌లు: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count స్నేహితుల',
      one: '$count స్నేహితుడి',
    );
    return '$_temp0 కోసం శబ్దం పెంచబడుతోంది';
  }

  @override
  String get boostSubtitleOff =>
      'దూరంగా ఉన్న స్నేహితులు కనెక్ట్ అవ్వడానికి మీ ఫోన్‌ను Wi-Fi బూస్టర్‌గా మారుస్తుంది.';

  @override
  String get chargerTip =>
      'వీలైతే ఛార్జర్‌కు కనెక్ట్ చేయండి: పరిధి పెంచడానికి అదనపు బ్యాటరీ ఖర్చవుతుంది.';

  @override
  String get scanToConnectBooster =>
      'బూస్టర్ ద్వారా కనెక్ట్ అవ్వడానికి స్కాన్ చేయండి 📲';

  @override
  String get reconnectSameNetwork => 'అదే నెట్‌వర్క్‌కు మళ్లీ కనెక్ట్ అవ్వండి';

  @override
  String get retry => 'మళ్లీ ప్రయత్నించు';

  @override
  String get switchLabel => 'మారండి';

  @override
  String hostLabel(String name) {
    return '$name (హోస్ట్ 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (బూస్టర్ 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · సింక్‌లో: $count';
  }

  @override
  String get tryAgain => 'మళ్లీ ప్రయత్నించండి';

  @override
  String get back => 'వెనుకకు';

  @override
  String get cancel => 'రద్దు చేయి';

  @override
  String get copy => 'కాపీ చేయి';

  @override
  String get show => 'చూపించు';

  @override
  String get hide => 'దాచు';

  @override
  String copied(String label) {
    return '$label కాపీ చేయబడింది';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'పాస్‌వర్డ్';

  @override
  String get labelAddress => 'చిరునామా';

  @override
  String get partyCode => 'పార్టీ కోడ్';

  @override
  String get cameraQr => 'కెమెరా QR';

  @override
  String get settingUpNetwork => 'పార్టీ నెట్‌వర్క్ సెటప్ అవుతోంది…';

  @override
  String get qrCameraHelp =>
      'ముందుగా Wi-Fiలో చేరడానికి మీ ఫోన్ కెమెరా యాప్‌తో స్కాన్ చేయండి, ఆపై Crowd Speaker తెరిచి \"నేను ఇప్పటికే అదే Wi-Fiలో ఉన్నాను\" నొక్కండి.';

  @override
  String get qrAppHelp =>
      'Crowd Speakerతో స్కాన్ చేయండి → \"సౌండ్‌లో చేరండి\". ఒక్క ట్యాప్‌తో Wi-Fiకి కనెక్ట్ అయి శబ్దాన్ని ఆటోమేటిక్‌గా సింక్ చేస్తుంది!';

  @override
  String get noSpeakersYet =>
      'ఇంకా స్పీకర్లు లేవు. స్నేహితులను మీ QR కోడ్ స్కాన్ చేసి చేరమని చెప్పండి!';

  @override
  String youLabel(String name) {
    return '$name (మీరు 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'బూస్టర్ 📡 · సింక్‌లో: $count';
  }

  @override
  String bufferDetail(int ms) {
    return '$ms ms బఫర్';
  }

  @override
  String dropsDetail(String pct) {
    return '$pct% డ్రాప్‌లు';
  }

  @override
  String get errMicNeeded => 'మైక్‌గా ఉండటానికి మైక్రోఫోన్ యాక్సెస్ అవసరం.';

  @override
  String get errNearbyCreate =>
      'యాప్ నెట్‌వర్క్‌ను సృష్టించడానికి \"సమీప పరికరాలు\" అనుమతించండి.';

  @override
  String get errNearbyShare =>
      'యాప్ నెట్‌వర్క్‌ను పంచుకోవడానికి \"సమీప పరికరాలు\" అనుమతించండి.';

  @override
  String errNetwork(String message) {
    return 'నెట్‌వర్క్ లోపం: $message';
  }

  @override
  String get noticeHotspotOff =>
      'మీ హాట్‌స్పాట్ ఇంకా ఆన్ కాలేదు. ఆన్ చేస్తే QR కోడ్ దానంతట అదే అప్‌డేట్ అవుతుంది.';

  @override
  String get noticeLostHost =>
      'హోస్ట్‌తో కనెక్షన్ పోయింది. మళ్లీ ప్రయత్నిస్తోంది, లేదా కింద మరో నెట్‌వర్క్‌ను ఎంచుకోండి.';

  @override
  String noticeLostParent(String name) {
    return '$nameతో కనెక్షన్ పోయింది. మళ్లీ ప్రయత్నిస్తోంది, లేదా కింద మరో నెట్‌వర్క్‌ను ఎంచుకోండి.';
  }

  @override
  String get noticeRejectSyncing =>
      'ఒక బూస్టర్ ఫోన్ దొరికింది, కానీ అది ఇంకా సింక్ అవుతోంది. కాసేపటి తర్వాత మళ్లీ ప్రయత్నించండి.';

  @override
  String get noticeRejectLoop =>
      'ఆ ఫోన్ ఇప్పటికే మీ ద్వారా కనెక్ట్ అయి ఉంది, కాబట్టి అది మీ మూలం కాలేదు.';

  @override
  String noticeRejectOther(String reason) {
    return 'దొరికిన ఫోన్ ఇలా చెప్పింది: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'ఈ కోడ్‌లోని Wi-Fi పాస్‌వర్డ్ $length అక్షరాలు, కానీ Wi-Fi పాస్‌వర్డ్‌లు 8-63 అక్షరాలు ఉండాలి. హోస్ట్ తప్పుగా టైప్ చేసి ఉండవచ్చు: మళ్లీ నమోదు చేయమని అడగండి, లేదా Wi-Fi సెట్టింగ్స్‌లో \"$ssid\"లో చేరి \"నేను ఇప్పటికే అదే Wi-Fiలో ఉన్నాను\" నొక్కండి.';
  }

  @override
  String get errHostNotFound =>
      'ఈ Wi-Fiలో హోస్ట్ దొరకలేదు. హోస్ట్ లైవ్‌లో ఉన్నారా, మీరు సరైన నెట్‌వర్క్‌లో చేరారా అని తనిఖీ చేయండి.';

  @override
  String get errRelayNeedsAndroid =>
      'పంచుకోవడానికి Wi-Fi Direct ఉన్న Android ఫోన్ అవసరం.';

  @override
  String errTooDeep(int depth, int max) {
    return 'ఈ ఫోన్ హోస్ట్‌కు చాలా దూరంగా ఉంది (హోస్ట్ నుండి హాప్‌లు: $depth, గరిష్టం $max). పంచుకోవడానికి హోస్ట్‌కు దగ్గరగా ఉన్న నెట్‌వర్క్‌లో చేరండి.';
  }

  @override
  String notifHosting(String name) {
    return '\"$name\" హోస్ట్ చేస్తున్నారు';
  }

  @override
  String notifPlaying(String name) {
    return '\"$name\" ప్లే అవుతోంది';
  }
}
