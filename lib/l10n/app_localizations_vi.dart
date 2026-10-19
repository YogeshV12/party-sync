// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get homeTagline =>
      'Biến điện thoại của cả hội thành một dàn âm thanh khổng lồ. 🔊 Một máy cầm micro, còn mọi máy khác (cùng loa Bluetooth đã kết nối) phát âm thanh đồng bộ.';

  @override
  String get nameLabel => 'Tên hoặc biệt danh của bạn';

  @override
  String get nameHelper => 'Tên cả hội sẽ thấy trên màn hình';

  @override
  String get homeVibeTitle => 'Hôm nay chơi gì?';

  @override
  String get hostCardTitle => 'Cầm micro 🎤';

  @override
  String get hostCardSubtitle =>
      'Làm chủ tiệc. Mọi thứ bạn nói hoặc phát đều vang lên theo thời gian thực trên loa của mọi người.';

  @override
  String get joinCardTitle => 'Tham gia âm thanh 🔊';

  @override
  String get joinCardSubtitle =>
      'Quét mã QR của chủ tiệc. Biến điện thoại này hoặc loa Bluetooth của bạn thành một phần của bữa tiệc.';

  @override
  String get homeTipRelay =>
      'Mẹo: điện thoại này có thể mở rộng vùng phủ sóng! Sau khi kết nối, bạn có thể chia sẻ âm thanh cho nhiều bạn ở gần hơn nữa.';

  @override
  String get homeTipIos =>
      'iPhone có thể làm chủ tiệc hoặc tham gia làm loa. Để mở rộng phạm vi cho bạn ở xa hơn, hãy dùng điện thoại Android.';

  @override
  String get homeTipDefault => 'Sẵn sàng làm chủ tiệc hoặc tham gia âm thanh!';

  @override
  String get scanHostQr => 'Quét mã QR của chủ tiệc';

  @override
  String get scanHostQrSubtitle =>
      'Kết nối một chạm: tự nối Wi-Fi và đồng bộ âm thanh';

  @override
  String get alreadyOnWifi => 'Tôi đã dùng cùng Wi-Fi';

  @override
  String get connectManually => 'Kết nối thủ công';

  @override
  String get wifiNameLabel => 'Tên Wi-Fi';

  @override
  String get wifiPasswordLabel => 'Mật khẩu Wi-Fi';

  @override
  String get hostIpLabel => 'Địa chỉ IP của chủ tiệc (không bắt buộc)';

  @override
  String get hostIpHelper => 'Nằm bên dưới mã QR của chủ tiệc';

  @override
  String get connectToParty => 'Kết nối vào tiệc';

  @override
  String get enterWifiName => 'Vui lòng nhập tên Wi-Fi.';

  @override
  String get joinTipIos =>
      'Khi được hỏi, hãy chạm \"Tham gia\" để kết nối. Giữ Crowd Speaker luôn mở để âm thanh tiếp tục phát!';

  @override
  String get joinTipAndroid =>
      'Khi được hỏi, hãy chạm để chấp nhận kết nối Wi-Fi và bạn sẽ vào tiệc ngay.';

  @override
  String get scannerNotACode =>
      'Đây không phải mã Crowd Speaker. Hãy quét mã QR trên màn hình của bạn bè!';

  @override
  String get scannerHint => 'Hướng camera vào mã QR trên màn hình của bạn bè.';

  @override
  String get hostSetupTitle => 'Làm chủ tiệc 🎤';

  @override
  String get partyNameLabel => 'Tên bữa tiệc';

  @override
  String get partyNameHelper => 'Tên bạn bè sẽ thấy khi tham gia';

  @override
  String partyNameDefault(String name) {
    return 'Tiệc của $name';
  }

  @override
  String get defaultPartyName => 'Tiệc';

  @override
  String get connectQuestion => 'Bạn bè kết nối bằng cách nào?';

  @override
  String get instantNetworkTitle => 'Mạng tiệc tức thì';

  @override
  String get badgeEasiest => 'Dễ nhất';

  @override
  String get instantNetworkSubtitle =>
      'Không cần cài đặt. Tạo ngay một mạng cục bộ để mọi người cùng vào. (Không cần internet).';

  @override
  String get usePersonalHotspot => 'Dùng Điểm truy cập cá nhân';

  @override
  String get useMyHotspot => 'Dùng điểm phát sóng của điện thoại';

  @override
  String get hotspotSubtitle =>
      'Tự bật điểm phát sóng trên điện thoại. Bạn bè cũng có thể dùng chung internet di động của bạn.';

  @override
  String get hotspotInfoIos =>
      'Bật Điểm truy cập cá nhân trong Cài đặt (\"Cho phép người khác tham gia\"), rồi nhập tên iPhone và mật khẩu điểm truy cập bên dưới để bạn bè tham gia.';

  @override
  String get hotspotInfoAndroid =>
      'Bật điểm phát sóng trong Cài đặt, rồi nhập tên Wi-Fi và mật khẩu bên dưới để bạn bè tham gia.';

  @override
  String get openHotspotSettings => 'Mở cài đặt điểm phát sóng';

  @override
  String get hotspotSettingsHint =>
      'Mở Cài đặt → Điểm truy cập cá nhân và bật \"Cho phép người khác tham gia\".';

  @override
  String get hotspotWifiNameLabel => 'Tên Wi-Fi điểm phát sóng';

  @override
  String get hotspotPasswordLabel => 'Mật khẩu điểm phát sóng';

  @override
  String get enterHotspotName => 'Nhập tên điểm phát sóng để bạn bè tham gia.';

  @override
  String get invalidWifiPassword =>
      'Mật khẩu Wi-Fi phải dài 8–63 ký tự. Hãy kiểm tra cài đặt điểm phát sóng và thử lại!';

  @override
  String get audioTuning => 'Tinh chỉnh âm thanh';

  @override
  String get filterNoiseTitle => 'Lọc tiếng ồn nền';

  @override
  String get filterNoiseSubtitle =>
      'Giữ giọng nói rõ ràng. Hãy tắt nếu bạn mở nhạc lớn hoặc dùng thiết bị DJ.';

  @override
  String get startParty => 'Bắt đầu tiệc 🔥';

  @override
  String get onTheMic => 'Đang cầm micro 🎤';

  @override
  String get endParty => 'Kết thúc tiệc';

  @override
  String get endPartyTitle => 'Kết thúc bữa tiệc?';

  @override
  String get endPartyMessage =>
      'Thao tác này sẽ ngắt kết nối mọi loa và dừng âm thanh.';

  @override
  String get somethingWentWrong => 'Đã xảy ra lỗi.';

  @override
  String get firingUpParty => 'Đang khởi động bữa tiệc…';

  @override
  String get creatingPartyNetwork => 'Đang tạo mạng cho bữa tiệc';

  @override
  String get scanToJoinSound => 'Quét để tham gia âm thanh 📲';

  @override
  String get syncBufferTitle => 'Bộ đệm đồng bộ âm thanh';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count điện thoại đã kết nối',
    );
    return 'Loa của cả hội · $_temp0';
  }

  @override
  String get micMuted => 'Micro đã tắt tiếng 🤫';

  @override
  String get liveOnAir => 'Đang phát trực tiếp 🎙️';

  @override
  String get tapToUnmute => 'Chạm vào micro để bật tiếng và quay lại';

  @override
  String get waitingForSquad => 'Đang chờ cả hội quét mã và tham gia…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count điện thoại làm loa',
    );
    return 'Đang phát trực tiếp tới $_temp0';
  }

  @override
  String get bufferDelayLabel => 'Độ trễ bộ đệm trước khi phát âm thanh';

  @override
  String get syncBufferHelp =>
      'Kéo lên nếu âm thanh bị giật hoặc mất tiếng. Loa Bluetooth và bộ khuếch đại tín hiệu cần thêm chút bộ đệm để giữ đồng bộ hoàn hảo.';

  @override
  String get speakerMode => 'Chế độ loa 🔊';

  @override
  String get leave => 'Rời';

  @override
  String get leavePartyTitle => 'Rời khỏi bữa tiệc?';

  @override
  String get leavePartyBoosterMessage =>
      'Bạn bè kết nối qua bộ khuếch đại của bạn cũng sẽ bị ngắt kết nối.';

  @override
  String get leavePartyMessage => 'Điện thoại này sẽ ngừng phát âm thanh.';

  @override
  String get leaveParty => 'Rời khỏi tiệc';

  @override
  String get audioOutput => 'Đầu ra âm thanh';

  @override
  String get thisSpeaker => 'Loa này';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route có độ trễ Bluetooth cao ($latency ms), lớn hơn bộ đệm đồng bộ của chủ tiệc. Hãy nhờ chủ tiệc tăng \"Bộ đệm đồng bộ âm thanh\" lên $needed ms trở lên để âm thanh của bạn phát được!';
  }

  @override
  String get echoFixTitle => 'Sửa tiếng vọng (tinh chỉnh đồng bộ)';

  @override
  String get boostRangeTitle => 'Mở rộng phạm vi cho bạn bè 📡';

  @override
  String get partyWrappedUp => 'Bữa tiệc đã kết thúc 🎉';

  @override
  String get hostEndedParty => 'Chủ tiệc đã kết thúc bữa tiệc.';

  @override
  String partyEndedByHost(String name) {
    return '\"$name\" đã được chủ tiệc kết thúc.';
  }

  @override
  String get backToHome => 'Về trang chủ';

  @override
  String get joinAnotherParty => 'Tham gia tiệc khác';

  @override
  String get tuningIn => 'Đang dò sóng…';

  @override
  String get warmingUpSpeakers => 'Đang làm nóng loa';

  @override
  String connectingToWifi(String ssid) {
    return 'Đang kết nối tới $ssid…';
  }

  @override
  String get partyWifi => 'Wi-Fi của tiệc';

  @override
  String get tapAllowToConnect =>
      'Chạm Cho phép trên cửa sổ bật lên để kết nối.';

  @override
  String get findingHost => 'Đang tìm chủ tiệc…';

  @override
  String get searchingParty => 'Đang tìm bữa tiệc trên Wi-Fi này.';

  @override
  String get lockingIntoSync => 'Đang khóa đồng bộ…';

  @override
  String get aligningBeat => 'Đang căn chỉnh nhịp.';

  @override
  String get hostIsMuted => 'Chủ tiệc đã tắt tiếng 🤫';

  @override
  String get hostMutedSubtitle =>
      'Đã kết nối! Âm thanh sẽ quay lại khi họ bật tiếng.';

  @override
  String get bumpingInSync => 'Đang bùng nổ đồng bộ 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'Kết nối trực tiếp với $name';
  }

  @override
  String get hostFallback => 'chủ tiệc';

  @override
  String syncedVia(String name, int depth) {
    return 'Đồng bộ qua $name (số bước từ micro: $depth)';
  }

  @override
  String get boosterFallback => 'bộ khuếch đại';

  @override
  String get reSyncing => 'Đang đồng bộ lại…';

  @override
  String get reconnectingStream => 'Đang kết nối lại luồng phát';

  @override
  String get notConnectedYet => 'Chưa kết nối';

  @override
  String get phoneSpeaker => 'Loa điện thoại';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'Độ trễ Bluetooth (+$ms ms) đã tự động được bù.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'Độ trễ loa (+$ms ms) đã tự động được hiệu chỉnh.';
  }

  @override
  String get syncTiming => 'Thời gian đồng bộ';

  @override
  String get audioBuffer => 'Bộ đệm âm thanh';

  @override
  String get streamDrops => 'Mất gói luồng';

  @override
  String get autoAdjust => 'Tự điều chỉnh';

  @override
  String get defaultSyncZero => 'Đồng bộ mặc định (độ lệch bằng 0)';

  @override
  String nudgedEarlier(int ms) {
    return 'Đã chỉnh sớm $ms ms';
  }

  @override
  String nudgedLater(int ms) {
    return 'Đã chỉnh trễ $ms ms';
  }

  @override
  String get reset => 'Đặt lại';

  @override
  String get echoHelp =>
      'Nghe thấy tiếng vọng? Nếu loa này nghe chậm hơn cả hội, hãy kéo sang phải. Nếu nghe sớm hơn, kéo sang trái. (Hầu hết loa đã nghe hoàn hảo mà không cần chỉnh!)';

  @override
  String get relayUnsupportedIos =>
      'iPhone không thể chia sẻ Wi-Fi khi đang nghe. Hãy nhờ bạn dùng Android bật bộ khuếch đại tín hiệu!';

  @override
  String get relayUnsupportedAndroid =>
      'Điện thoại này không hỗ trợ chế độ khuếch đại Wi-Fi Direct.';

  @override
  String get boostSignalTitle => 'Khuếch đại tín hiệu cho bạn bè';

  @override
  String tooFarToBoost(int depth) {
    return 'Quá xa chủ tiệc để mở rộng thêm phạm vi (số bước từ chủ tiệc: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count người bạn',
    );
    return 'Đang khuếch đại âm thanh cho $_temp0';
  }

  @override
  String get boostSubtitleOff =>
      'Biến điện thoại của bạn thành bộ khuếch đại Wi-Fi để bạn bè ở xa hơn có thể kết nối.';

  @override
  String get chargerTip =>
      'Hãy cắm sạc nếu có thể: mở rộng phạm vi tốn thêm pin.';

  @override
  String get scanToConnectBooster => 'Quét để kết nối qua bộ khuếch đại 📲';

  @override
  String get reconnectSameNetwork => 'Kết nối lại cùng mạng';

  @override
  String get retry => 'Thử lại';

  @override
  String get switchLabel => 'Chuyển';

  @override
  String hostLabel(String name) {
    return '$name (chủ tiệc 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (bộ khuếch đại 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · đang đồng bộ: $count';
  }

  @override
  String get tryAgain => 'Thử lại';

  @override
  String get back => 'Quay lại';

  @override
  String get cancel => 'Hủy';

  @override
  String get copy => 'Sao chép';

  @override
  String get show => 'Hiện';

  @override
  String get hide => 'Ẩn';

  @override
  String copied(String label) {
    return 'Đã sao chép $label';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'Mật khẩu';

  @override
  String get labelAddress => 'Địa chỉ';

  @override
  String get partyCode => 'Mã tiệc';

  @override
  String get cameraQr => 'QR camera';

  @override
  String get settingUpNetwork => 'Đang thiết lập mạng cho bữa tiệc…';

  @override
  String get qrCameraHelp =>
      'Quét bằng ứng dụng Camera của điện thoại để vào Wi-Fi trước, rồi mở Crowd Speaker và chạm \"Tôi đã dùng cùng Wi-Fi\".';

  @override
  String get qrAppHelp =>
      'Quét bằng Crowd Speaker → \"Tham gia âm thanh\". Tự nối Wi-Fi và đồng bộ âm thanh chỉ với một chạm!';

  @override
  String get noSpeakersYet =>
      'Chưa có loa nào. Hãy nhờ cả hội quét mã QR của bạn để tham gia!';

  @override
  String youLabel(String name) {
    return '$name (bạn 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'Bộ khuếch đại 📡 · đang đồng bộ: $count';
  }

  @override
  String bufferDetail(int ms) {
    return 'bộ đệm $ms ms';
  }

  @override
  String dropsDetail(String pct) {
    return 'mất $pct%';
  }

  @override
  String get errMicNeeded => 'Cần quyền truy cập micro để làm micro.';

  @override
  String get errNearbyCreate =>
      'Hãy cho phép \"Thiết bị ở gần\" để ứng dụng có thể tạo mạng.';

  @override
  String get errNearbyShare =>
      'Hãy cho phép \"Thiết bị ở gần\" để ứng dụng có thể chia sẻ mạng.';

  @override
  String errNetwork(String message) {
    return 'Lỗi mạng: $message';
  }

  @override
  String get noticeHotspotOff =>
      'Điểm phát sóng của bạn chưa bật. Hãy bật lên và mã QR sẽ tự cập nhật.';

  @override
  String get noticeLostHost =>
      'Mất kết nối với chủ tiệc. Đang thử lại, hoặc chọn mạng khác bên dưới.';

  @override
  String noticeLostParent(String name) {
    return 'Mất kết nối với $name. Đang thử lại, hoặc chọn mạng khác bên dưới.';
  }

  @override
  String get noticeRejectSyncing =>
      'Đã tìm thấy một điện thoại khuếch đại nhưng nó vẫn đang đồng bộ. Hãy thử lại sau giây lát.';

  @override
  String get noticeRejectLoop =>
      'Điện thoại đó đã kết nối qua bạn nên không thể là nguồn của bạn.';

  @override
  String noticeRejectOther(String reason) {
    return 'Một điện thoại tìm thấy đã báo: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'Mật khẩu Wi-Fi trong mã này dài $length ký tự, nhưng mật khẩu Wi-Fi phải dài 8-63. Có lẽ chủ tiệc đã gõ nhầm: hãy nhờ họ nhập lại, hoặc vào \"$ssid\" trong cài đặt Wi-Fi rồi chạm \"Tôi đã dùng cùng Wi-Fi\".';
  }

  @override
  String get errHostNotFound =>
      'Không tìm thấy chủ tiệc trên Wi-Fi này. Hãy kiểm tra chủ tiệc đang phát và bạn đã vào đúng mạng.';

  @override
  String get errRelayNeedsAndroid =>
      'Chia sẻ cần điện thoại Android có Wi-Fi Direct.';

  @override
  String errTooDeep(int depth, int max) {
    return 'Điện thoại này quá xa chủ tiệc (số bước từ chủ tiệc: $depth, tối đa $max). Hãy vào mạng gần chủ tiệc hơn để chia sẻ.';
  }

  @override
  String notifHosting(String name) {
    return 'Đang làm chủ \"$name\"';
  }

  @override
  String notifPlaying(String name) {
    return 'Đang phát \"$name\"';
  }
}
