// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get homeTagline =>
      'เปลี่ยนมือถือของเพื่อนทั้งกลุ่มให้เป็นระบบเสียงขนาดใหญ่ 🔊 เครื่องหนึ่งถือไมค์ แล้วทุกเครื่อง (รวมถึงลำโพงบลูทูธที่เชื่อมต่อ) จะเล่นเสียงพร้อมกัน';

  @override
  String get nameLabel => 'ชื่อหรือชื่อเล่นของคุณ';

  @override
  String get nameHelper => 'ชื่อที่เพื่อนๆ จะเห็นบนหน้าจอ';

  @override
  String get homeVibeTitle => 'วันนี้เอาแบบไหน?';

  @override
  String get hostCardTitle => 'จับไมค์ 🎤';

  @override
  String get hostCardSubtitle =>
      'เป็นเจ้าภาพปาร์ตี้ ทุกอย่างที่คุณพูดหรือสตรีมจะเล่นแบบเรียลไทม์ผ่านลำโพงของทุกคน';

  @override
  String get joinCardTitle => 'เข้าร่วมเสียง 🔊';

  @override
  String get joinCardSubtitle =>
      'สแกน QR code ของเจ้าภาพ แล้วทำให้มือถือเครื่องนี้หรือลำโพงบลูทูธของคุณเป็นส่วนหนึ่งของปาร์ตี้';

  @override
  String get homeTipRelay =>
      'เคล็ดลับ: มือถือเครื่องนี้ช่วยขยายระยะสัญญาณได้! เมื่อเชื่อมต่อแล้ว คุณแชร์เสียงให้เพื่อนที่อยู่ใกล้ๆ ได้มากขึ้น';

  @override
  String get homeTipIos =>
      'iPhone เป็นเจ้าภาพหรือเข้าร่วมเป็นลำโพงได้ หากต้องการขยายระยะสัญญาณไปถึงเพื่อนที่อยู่ไกลออกไป ให้ใช้มือถือ Android';

  @override
  String get homeTipDefault => 'พร้อมเป็นเจ้าภาพปาร์ตี้หรือเข้าร่วมเสียงแล้ว!';

  @override
  String get scanHostQr => 'สแกน QR code ของเจ้าภาพ';

  @override
  String get scanHostQrSubtitle =>
      'เชื่อมต่อด้วยการแตะเดียว: เชื่อมต่อ Wi-Fi และซิงก์เสียงให้อัตโนมัติ';

  @override
  String get alreadyOnWifi => 'ฉันอยู่ใน Wi-Fi เดียวกันแล้ว';

  @override
  String get connectManually => 'เชื่อมต่อด้วยตนเอง';

  @override
  String get wifiNameLabel => 'ชื่อ Wi-Fi';

  @override
  String get wifiPasswordLabel => 'รหัสผ่าน Wi-Fi';

  @override
  String get hostIpLabel => 'ที่อยู่ IP ของเจ้าภาพ (ไม่บังคับ)';

  @override
  String get hostIpHelper => 'ดูได้ใต้ QR code ของเจ้าภาพ';

  @override
  String get connectToParty => 'เชื่อมต่อปาร์ตี้';

  @override
  String get enterWifiName => 'โปรดกรอกชื่อ Wi-Fi';

  @override
  String get joinTipIos =>
      'เมื่อมีข้อความถาม ให้แตะ \"เข้าร่วม\" เพื่อเชื่อมต่อ เปิด Crowd Speaker ทิ้งไว้เพื่อให้เสียงเล่นต่อเนื่อง!';

  @override
  String get joinTipAndroid =>
      'เมื่อมีข้อความถาม ให้แตะเพื่อยอมรับการเชื่อมต่อ Wi-Fi แล้วคุณจะเข้าร่วมปาร์ตี้ทันที';

  @override
  String get scannerNotACode =>
      'นี่ไม่ใช่รหัส Crowd Speaker สแกน QR บนหน้าจอของเพื่อนคุณ!';

  @override
  String get scannerHint => 'เล็งกล้องไปที่ QR code บนหน้าจอของเพื่อนคุณ';

  @override
  String get hostSetupTitle => 'เป็นเจ้าภาพปาร์ตี้ 🎤';

  @override
  String get partyNameLabel => 'ชื่อปาร์ตี้';

  @override
  String get partyNameHelper => 'ชื่อที่เพื่อนๆ จะเห็นตอนเข้าร่วม';

  @override
  String partyNameDefault(String name) {
    return 'ปาร์ตี้ของ$name';
  }

  @override
  String get defaultPartyName => 'ปาร์ตี้';

  @override
  String get connectQuestion => 'ให้เพื่อนๆ เชื่อมต่อด้วยวิธีไหน?';

  @override
  String get instantNetworkTitle => 'เครือข่ายปาร์ตี้ทันที';

  @override
  String get badgeEasiest => 'ง่ายที่สุด';

  @override
  String get instantNetworkSubtitle =>
      'ไม่ต้องตั้งค่า สร้างเครือข่ายภายในทันทีให้ทุกคนเข้าร่วมได้ (ไม่ต้องใช้อินเทอร์เน็ต)';

  @override
  String get usePersonalHotspot => 'ใช้ฮอตสปอตส่วนบุคคล';

  @override
  String get useMyHotspot => 'ใช้ฮอตสปอตของมือถือฉัน';

  @override
  String get hotspotSubtitle =>
      'เปิดฮอตสปอตของมือถือเอง เพื่อนๆ ยังใช้อินเทอร์เน็ตมือถือของคุณร่วมกันได้ด้วย';

  @override
  String get hotspotInfoIos =>
      'เปิดฮอตสปอตส่วนบุคคลในการตั้งค่า (\"อนุญาตให้ผู้อื่นเข้าร่วม\") จากนั้นกรอกชื่อ iPhone และรหัสผ่านฮอตสปอตด้านล่างเพื่อให้เพื่อนๆ เข้าร่วมได้';

  @override
  String get hotspotInfoAndroid =>
      'เปิดฮอตสปอตในการตั้งค่า จากนั้นกรอกชื่อและรหัสผ่าน Wi-Fi ด้านล่างเพื่อให้เพื่อนๆ เข้าร่วมได้';

  @override
  String get openHotspotSettings => 'เปิดการตั้งค่าฮอตสปอต';

  @override
  String get hotspotSettingsHint =>
      'เปิดการตั้งค่า → ฮอตสปอตส่วนบุคคล แล้วเปิด \"อนุญาตให้ผู้อื่นเข้าร่วม\"';

  @override
  String get hotspotWifiNameLabel => 'ชื่อ Wi-Fi ของฮอตสปอต';

  @override
  String get hotspotPasswordLabel => 'รหัสผ่านฮอตสปอต';

  @override
  String get enterHotspotName => 'กรอกชื่อฮอตสปอตเพื่อให้เพื่อนๆ เข้าร่วมได้';

  @override
  String get invalidWifiPassword =>
      'รหัสผ่าน Wi-Fi ต้องยาว 8–63 ตัวอักษร ตรวจสอบการตั้งค่าฮอตสปอตแล้วลองอีกครั้ง!';

  @override
  String get audioTuning => 'ปรับแต่งเสียง';

  @override
  String get filterNoiseTitle => 'กรองเสียงรบกวนรอบข้าง';

  @override
  String get filterNoiseSubtitle =>
      'ทำให้เสียงพูดคมชัด ปิดเมื่อเปิดเพลงเสียงดังหรือใช้อุปกรณ์ดีเจ';

  @override
  String get startParty => 'เริ่มปาร์ตี้ 🔥';

  @override
  String get onTheMic => 'กำลังถือไมค์ 🎤';

  @override
  String get endParty => 'จบปาร์ตี้';

  @override
  String get endPartyTitle => 'จบปาร์ตี้หรือไม่?';

  @override
  String get endPartyMessage =>
      'การดำเนินการนี้จะตัดการเชื่อมต่อลำโพงทั้งหมดและหยุดเสียง';

  @override
  String get somethingWentWrong => 'เกิดข้อผิดพลาดบางอย่าง';

  @override
  String get firingUpParty => 'กำลังเริ่มปาร์ตี้…';

  @override
  String get creatingPartyNetwork => 'กำลังสร้างเครือข่ายปาร์ตี้ของคุณ';

  @override
  String get scanToJoinSound => 'สแกนเพื่อเข้าร่วมเสียง 📲';

  @override
  String get syncBufferTitle => 'บัฟเฟอร์ซิงก์เสียง';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'เชื่อมต่อแล้ว $count เครื่อง',
    );
    return 'ลำโพงของกลุ่ม · $_temp0';
  }

  @override
  String get micMuted => 'ปิดเสียงไมค์ 🤫';

  @override
  String get liveOnAir => 'กำลังออกอากาศสด 🎙️';

  @override
  String get tapToUnmute => 'แตะไมค์เพื่อเปิดเสียงและกลับเข้าร่วม';

  @override
  String get waitingForSquad => 'กำลังรอให้เพื่อนๆ สแกนและเข้าร่วม…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'มือถือลำโพง $count เครื่อง',
    );
    return 'กำลังสตรีมสดไปยัง $_temp0';
  }

  @override
  String get bufferDelayLabel => 'ดีเลย์บัฟเฟอร์ก่อนเล่นเสียง';

  @override
  String get syncBufferHelp =>
      'เลื่อนขึ้นหากเสียงสะดุดหรือขาดหาย ลำโพงบลูทูธและตัวขยายสัญญาณต้องใช้บัฟเฟอร์มากขึ้นเล็กน้อยเพื่อให้ซิงก์ได้สมบูรณ์';

  @override
  String get speakerMode => 'โหมดลำโพง 🔊';

  @override
  String get leave => 'ออก';

  @override
  String get leavePartyTitle => 'ออกจากปาร์ตี้หรือไม่?';

  @override
  String get leavePartyBoosterMessage =>
      'เพื่อนที่เชื่อมต่อผ่านตัวขยายสัญญาณของคุณจะถูกตัดการเชื่อมต่อด้วย';

  @override
  String get leavePartyMessage => 'มือถือเครื่องนี้จะหยุดเล่นเสียง';

  @override
  String get leaveParty => 'ออกจากปาร์ตี้';

  @override
  String get audioOutput => 'เอาต์พุตเสียง';

  @override
  String get thisSpeaker => 'ลำโพงนี้';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route มีดีเลย์บลูทูธสูง ($latency มิลลิวินาที) มากกว่าบัฟเฟอร์ซิงก์ของเจ้าภาพ ขอให้เจ้าภาพเพิ่ม \"บัฟเฟอร์ซิงก์เสียง\" เป็น $needed มิลลิวินาทีขึ้นไป เพื่อให้เสียงของคุณเล่นได้!';
  }

  @override
  String get echoFixTitle => 'แก้เสียงสะท้อน (ปรับการซิงก์ละเอียด)';

  @override
  String get boostRangeTitle => 'ขยายระยะสัญญาณให้เพื่อน 📡';

  @override
  String get partyWrappedUp => 'ปาร์ตี้จบแล้ว 🎉';

  @override
  String get hostEndedParty => 'เจ้าภาพจบปาร์ตี้แล้ว';

  @override
  String partyEndedByHost(String name) {
    return '\"$name\" ถูกจบโดยเจ้าภาพ';
  }

  @override
  String get backToHome => 'กลับหน้าแรก';

  @override
  String get joinAnotherParty => 'เข้าร่วมปาร์ตี้อื่น';

  @override
  String get tuningIn => 'กำลังจูนเข้า…';

  @override
  String get warmingUpSpeakers => 'กำลังวอร์มลำโพง';

  @override
  String connectingToWifi(String ssid) {
    return 'กำลังเชื่อมต่อกับ $ssid…';
  }

  @override
  String get partyWifi => 'Wi-Fi ของปาร์ตี้';

  @override
  String get tapAllowToConnect => 'แตะอนุญาตบนป๊อปอัปเพื่อเชื่อมต่อ';

  @override
  String get findingHost => 'กำลังค้นหาเจ้าภาพ…';

  @override
  String get searchingParty => 'กำลังค้นหาปาร์ตี้ใน Wi-Fi นี้';

  @override
  String get lockingIntoSync => 'กำลังล็อกการซิงก์…';

  @override
  String get aligningBeat => 'กำลังปรับจังหวะให้ตรงกัน';

  @override
  String get hostIsMuted => 'เจ้าภาพปิดเสียงอยู่ 🤫';

  @override
  String get hostMutedSubtitle =>
      'เชื่อมต่อแล้ว! เสียงจะกลับมาเมื่อเจ้าภาพเปิดไมค์';

  @override
  String get bumpingInSync => 'ซิงก์สนั่น 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'เชื่อมต่อโดยตรงกับ$name';
  }

  @override
  String get hostFallback => 'เจ้าภาพ';

  @override
  String syncedVia(String name, int depth) {
    return 'ซิงก์ผ่าน$name (จำนวนต่อจากไมค์: $depth)';
  }

  @override
  String get boosterFallback => 'ตัวขยายสัญญาณ';

  @override
  String get reSyncing => 'กำลังซิงก์ใหม่…';

  @override
  String get reconnectingStream => 'กำลังเชื่อมต่อสตรีมอีกครั้ง';

  @override
  String get notConnectedYet => 'ยังไม่ได้เชื่อมต่อ';

  @override
  String get phoneSpeaker => 'ลำโพงมือถือ';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'ดีเลย์บลูทูธ (+$ms มิลลิวินาที) ถูกชดเชยให้อัตโนมัติ';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'ดีเลย์ลำโพง (+$ms มิลลิวินาที) ถูกปรับเทียบอัตโนมัติ';
  }

  @override
  String get syncTiming => 'จังหวะการซิงก์';

  @override
  String get audioBuffer => 'บัฟเฟอร์เสียง';

  @override
  String get streamDrops => 'สตรีมหลุด';

  @override
  String get autoAdjust => 'ปรับอัตโนมัติ';

  @override
  String get defaultSyncZero => 'ซิงก์เริ่มต้น (ออฟเซ็ตเป็นศูนย์)';

  @override
  String nudgedEarlier(int ms) {
    return 'เลื่อนให้เร็วขึ้น $ms มิลลิวินาที';
  }

  @override
  String nudgedLater(int ms) {
    return 'เลื่อนให้ช้าลง $ms มิลลิวินาที';
  }

  @override
  String get reset => 'รีเซ็ต';

  @override
  String get echoHelp =>
      'ได้ยินเสียงสะท้อนไหม? ถ้าลำโพงนี้ดังช้ากว่ากลุ่ม ให้เลื่อนไปทางขวา ถ้าดังเร็วกว่า ให้เลื่อนไปทางซ้าย (ลำโพงส่วนใหญ่เสียงดีอยู่แล้วโดยไม่ต้องปรับ!)';

  @override
  String get relayUnsupportedIos =>
      'iPhone แชร์ Wi-Fi ไม่ได้ขณะฟังเสียง ให้เพื่อนที่ใช้ Android เปิดตัวขยายสัญญาณแทน!';

  @override
  String get relayUnsupportedAndroid =>
      'มือถือเครื่องนี้ไม่รองรับโหมดตัวขยายสัญญาณ Wi-Fi Direct';

  @override
  String get boostSignalTitle => 'ขยายสัญญาณให้เพื่อน';

  @override
  String tooFarToBoost(int depth) {
    return 'ไกลจากเจ้าภาพเกินกว่าจะขยายระยะเพิ่มได้ (จำนวนต่อจากเจ้าภาพ: $depth)';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count คน',
    );
    return 'กำลังขยายเสียงให้เพื่อน $_temp0';
  }

  @override
  String get boostSubtitleOff =>
      'เปลี่ยนมือถือของคุณเป็นตัวขยาย Wi-Fi เพื่อให้เพื่อนที่อยู่ไกลออกไปเชื่อมต่อได้';

  @override
  String get chargerTip =>
      'เสียบสายชาร์จถ้าทำได้ เพราะการขยายระยะใช้แบตเตอรี่เพิ่ม';

  @override
  String get scanToConnectBooster => 'สแกนเพื่อเชื่อมต่อผ่านตัวขยายสัญญาณ 📲';

  @override
  String get reconnectSameNetwork => 'เชื่อมต่อเครือข่ายเดิมอีกครั้ง';

  @override
  String get retry => 'ลองอีกครั้ง';

  @override
  String get switchLabel => 'สลับ';

  @override
  String hostLabel(String name) {
    return '$name (เจ้าภาพ 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (ตัวขยายสัญญาณ 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · ซิงก์แล้ว: $count';
  }

  @override
  String get tryAgain => 'ลองอีกครั้ง';

  @override
  String get back => 'กลับ';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get copy => 'คัดลอก';

  @override
  String get show => 'แสดง';

  @override
  String get hide => 'ซ่อน';

  @override
  String copied(String label) {
    return 'คัดลอก$labelแล้ว';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'รหัสผ่าน';

  @override
  String get labelAddress => 'ที่อยู่';

  @override
  String get partyCode => 'รหัสปาร์ตี้';

  @override
  String get cameraQr => 'QR สำหรับกล้อง';

  @override
  String get settingUpNetwork => 'กำลังตั้งค่าเครือข่ายปาร์ตี้…';

  @override
  String get qrCameraHelp =>
      'สแกนด้วยแอปกล้องของมือถือเพื่อเข้า Wi-Fi ก่อน แล้วเปิด Crowd Speaker และแตะ \"ฉันอยู่ใน Wi-Fi เดียวกันแล้ว\"';

  @override
  String get qrAppHelp =>
      'สแกนด้วย Crowd Speaker → \"เข้าร่วมเสียง\" เชื่อมต่อ Wi-Fi และซิงก์เสียงอัตโนมัติด้วยการแตะเพียงครั้งเดียว!';

  @override
  String get noSpeakersYet =>
      'ยังไม่มีลำโพง ให้เพื่อนๆ สแกน QR code ของคุณเพื่อเข้าร่วม!';

  @override
  String youLabel(String name) {
    return '$name (คุณ 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'ตัวขยายสัญญาณ 📡 · ซิงก์แล้ว: $count';
  }

  @override
  String bufferDetail(int ms) {
    return 'บัฟเฟอร์ $ms มิลลิวินาที';
  }

  @override
  String dropsDetail(String pct) {
    return 'หลุด $pct%';
  }

  @override
  String get errMicNeeded => 'ต้องเข้าถึงไมโครโฟนเพื่อเป็นไมค์';

  @override
  String get errNearbyCreate =>
      'อนุญาต \"อุปกรณ์ใกล้เคียง\" เพื่อให้แอปสร้างเครือข่ายได้';

  @override
  String get errNearbyShare =>
      'อนุญาต \"อุปกรณ์ใกล้เคียง\" เพื่อให้แอปแชร์เครือข่ายได้';

  @override
  String errNetwork(String message) {
    return 'เครือข่ายขัดข้อง: $message';
  }

  @override
  String get noticeHotspotOff =>
      'ฮอตสปอตของคุณยังไม่เปิด เปิดแล้ว QR code จะอัปเดตเอง';

  @override
  String get noticeLostHost =>
      'ขาดการเชื่อมต่อกับเจ้าภาพ กำลังลองใหม่ หรือเลือกเครือข่ายอื่นด้านล่าง';

  @override
  String noticeLostParent(String name) {
    return 'ขาดการเชื่อมต่อกับ$name กำลังลองใหม่ หรือเลือกเครือข่ายอื่นด้านล่าง';
  }

  @override
  String get noticeRejectSyncing =>
      'พบมือถือตัวขยายสัญญาณ แต่ยังซิงก์อยู่ ลองอีกครั้งในอีกสักครู่';

  @override
  String get noticeRejectLoop =>
      'มือถือเครื่องนั้นเชื่อมต่อผ่านคุณอยู่แล้ว จึงเป็นแหล่งสัญญาณของคุณไม่ได้';

  @override
  String noticeRejectOther(String reason) {
    return 'มือถือที่พบแจ้งว่า: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'รหัสผ่าน Wi-Fi ในรหัสนี้ยาว $length ตัวอักษร แต่รหัสผ่าน Wi-Fi ต้องยาว 8-63 เจ้าภาพอาจพิมพ์ผิด ให้ขอให้กรอกใหม่ หรือเข้า \"$ssid\" ในการตั้งค่า Wi-Fi แล้วแตะ \"ฉันอยู่ใน Wi-Fi เดียวกันแล้ว\"';
  }

  @override
  String get errHostNotFound =>
      'ไม่พบเจ้าภาพใน Wi-Fi นี้ ตรวจสอบว่าเจ้าภาพกำลังออนไลน์ และคุณเข้าเครือข่ายถูกต้อง';

  @override
  String get errRelayNeedsAndroid =>
      'การแชร์ต้องใช้มือถือ Android ที่รองรับ Wi-Fi Direct';

  @override
  String errTooDeep(int depth, int max) {
    return 'มือถือเครื่องนี้ไกลจากเจ้าภาพเกินไป (จำนวนต่อจากเจ้าภาพ: $depth สูงสุด $max) เข้าเครือข่ายที่ใกล้เจ้าภาพกว่านี้เพื่อแชร์';
  }

  @override
  String notifHosting(String name) {
    return 'กำลังเป็นเจ้าภาพ \"$name\"';
  }

  @override
  String notifPlaying(String name) {
    return 'กำลังเล่น \"$name\"';
  }
}
