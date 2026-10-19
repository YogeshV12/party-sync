// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get homeTagline =>
      '친구들의 폰을 하나의 거대한 사운드 시스템으로 만드세요. 🔊 한 대가 마이크를 잡으면, 모든 폰(그리고 연결된 블루투스 스피커)이 소리를 동기화해 재생합니다.';

  @override
  String get nameLabel => '내 이름 또는 닉네임';

  @override
  String get nameHelper => '친구들 화면에 표시되는 이름';

  @override
  String get homeVibeTitle => '오늘은 어떻게 할까요?';

  @override
  String get hostCardTitle => '마이크 잡기 🎤';

  @override
  String get hostCardSubtitle =>
      '파티를 열어 보세요. 말하거나 스트리밍하는 모든 소리가 모두의 스피커로 실시간 재생됩니다.';

  @override
  String get joinCardTitle => '사운드에 참여 🔊';

  @override
  String get joinCardSubtitle =>
      '호스트의 QR 코드를 스캔하세요. 이 폰이나 블루투스 스피커를 파티의 일부로 만들어 보세요.';

  @override
  String get homeTipRelay =>
      '팁: 이 폰은 범위를 넓힐 수 있어요! 연결한 뒤에는 근처의 더 많은 친구와 사운드를 나눌 수 있습니다.';

  @override
  String get homeTipIos =>
      'iPhone은 호스트가 되거나 스피커로 참여할 수 있어요. 더 멀리 있는 친구까지 신호 범위를 넓히려면 Android 폰을 사용하세요.';

  @override
  String get homeTipDefault => '파티를 열거나 사운드에 참여할 준비 완료!';

  @override
  String get scanHostQr => '호스트 QR 코드 스캔';

  @override
  String get scanHostQrSubtitle => '한 번에 연결: Wi-Fi에 연결하고 소리를 자동으로 동기화합니다';

  @override
  String get alreadyOnWifi => '이미 같은 Wi-Fi에 연결되어 있어요';

  @override
  String get connectManually => '수동으로 연결';

  @override
  String get wifiNameLabel => 'Wi-Fi 이름';

  @override
  String get wifiPasswordLabel => 'Wi-Fi 비밀번호';

  @override
  String get hostIpLabel => '호스트 IP 주소(선택)';

  @override
  String get hostIpHelper => '호스트의 QR 코드 아래에 표시됩니다';

  @override
  String get connectToParty => '파티에 연결';

  @override
  String get enterWifiName => 'Wi-Fi 이름을 입력해 주세요.';

  @override
  String get joinTipIos =>
      '안내가 나오면 \"참여\"를 탭해 연결하세요. 소리가 계속 나오도록 Crowd Speaker를 실행해 두세요!';

  @override
  String get joinTipAndroid => '안내가 나오면 탭해서 Wi-Fi 연결을 허용하면 바로 파티에 참여합니다.';

  @override
  String get scannerNotACode => 'Crowd Speaker 코드가 아니에요. 친구 화면의 QR 코드를 스캔하세요!';

  @override
  String get scannerHint => '친구 화면의 QR 코드에 카메라를 향하세요.';

  @override
  String get hostSetupTitle => '파티 열기 🎤';

  @override
  String get partyNameLabel => '파티 이름';

  @override
  String get partyNameHelper => '친구들이 참여할 때 보게 되는 이름';

  @override
  String partyNameDefault(String name) {
    return '$name의 파티';
  }

  @override
  String get defaultPartyName => '파티';

  @override
  String get connectQuestion => '친구들은 어떻게 연결할까요?';

  @override
  String get instantNetworkTitle => '즉석 파티 네트워크';

  @override
  String get badgeEasiest => '가장 쉬움';

  @override
  String get instantNetworkSubtitle =>
      '설정이 필요 없어요. 모두가 접속할 수 있는 로컬 네트워크를 즉시 만듭니다. (인터넷 불필요)';

  @override
  String get usePersonalHotspot => '개인용 핫스팟 사용';

  @override
  String get useMyHotspot => '내 폰 핫스팟 사용';

  @override
  String get hotspotSubtitle => '폰의 핫스팟을 직접 켜세요. 친구들이 내 모바일 데이터를 함께 쓸 수도 있어요.';

  @override
  String get hotspotInfoIos =>
      '설정에서 개인용 핫스팟을 켜고(\"다른 사람의 연결 허용\"), 친구들이 참여할 수 있도록 아래에 iPhone 이름과 핫스팟 비밀번호를 입력하세요.';

  @override
  String get hotspotInfoAndroid =>
      '설정에서 핫스팟을 켜고, 친구들이 참여할 수 있도록 아래에 Wi-Fi 이름과 비밀번호를 입력하세요.';

  @override
  String get openHotspotSettings => '핫스팟 설정 열기';

  @override
  String get hotspotSettingsHint => '설정 → 개인용 핫스팟을 열고 \"다른 사람의 연결 허용\"을 켜세요.';

  @override
  String get hotspotWifiNameLabel => '핫스팟 Wi-Fi 이름';

  @override
  String get hotspotPasswordLabel => '핫스팟 비밀번호';

  @override
  String get enterHotspotName => '친구들이 참여할 수 있도록 핫스팟 이름을 입력하세요.';

  @override
  String get invalidWifiPassword =>
      'Wi-Fi 비밀번호는 8~63자여야 해요. 핫스팟 설정을 확인하고 다시 시도하세요!';

  @override
  String get audioTuning => '오디오 조정';

  @override
  String get filterNoiseTitle => '배경 소음 제거';

  @override
  String get filterNoiseSubtitle =>
      '목소리를 선명하게 유지합니다. 음악을 크게 틀거나 DJ 장비를 쓸 때는 끄세요.';

  @override
  String get startParty => '파티 시작 🔥';

  @override
  String get onTheMic => '마이크 사용 중 🎤';

  @override
  String get endParty => '파티 종료';

  @override
  String get endPartyTitle => '파티를 종료할까요?';

  @override
  String get endPartyMessage => '모든 스피커의 연결이 끊기고 소리가 멈춥니다.';

  @override
  String get somethingWentWrong => '문제가 발생했습니다.';

  @override
  String get firingUpParty => '파티를 준비하는 중…';

  @override
  String get creatingPartyNetwork => '파티 네트워크를 만드는 중';

  @override
  String get scanToJoinSound => '스캔해서 사운드에 참여 📲';

  @override
  String get syncBufferTitle => '사운드 동기화 버퍼';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count대 연결됨',
    );
    return '친구들의 스피커 · $_temp0';
  }

  @override
  String get micMuted => '마이크 음소거 🤫';

  @override
  String get liveOnAir => '라이브 방송 중 🎙️';

  @override
  String get tapToUnmute => '마이크를 탭해 음소거를 해제하세요';

  @override
  String get waitingForSquad => '친구들이 스캔해서 참여하기를 기다리는 중…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '폰 스피커 $count대',
    );
    return '$_temp0로 실시간 스트리밍 중';
  }

  @override
  String get bufferDelayLabel => '재생 전 버퍼 지연';

  @override
  String get syncBufferHelp =>
      '소리가 끊기거나 튀면 올려 주세요. 블루투스 스피커와 신호 증폭기는 완벽한 동기화를 위해 버퍼가 조금 더 필요합니다.';

  @override
  String get speakerMode => '스피커 모드 🔊';

  @override
  String get leave => '나가기';

  @override
  String get leavePartyTitle => '파티에서 나갈까요?';

  @override
  String get leavePartyBoosterMessage => '내 증폭기를 통해 연결된 친구들도 연결이 끊깁니다.';

  @override
  String get leavePartyMessage => '이 폰은 더 이상 소리를 재생하지 않습니다.';

  @override
  String get leaveParty => '파티 나가기';

  @override
  String get audioOutput => '오디오 출력';

  @override
  String get thisSpeaker => '이 스피커';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route의 블루투스 지연이 큽니다(${latency}ms). 호스트의 동기화 버퍼보다 깁니다. 소리가 재생되도록 호스트에게 \"사운드 동기화 버퍼\"를 ${needed}ms 이상으로 올려 달라고 요청하세요!';
  }

  @override
  String get echoFixTitle => '에코 보정(동기화 미세 조정)';

  @override
  String get boostRangeTitle => '친구들을 위해 범위 넓히기 📡';

  @override
  String get partyWrappedUp => '파티가 끝났어요 🎉';

  @override
  String get hostEndedParty => '호스트가 파티를 종료했습니다.';

  @override
  String partyEndedByHost(String name) {
    return '\"$name\" 파티가 호스트에 의해 종료되었습니다.';
  }

  @override
  String get backToHome => '홈으로 돌아가기';

  @override
  String get joinAnotherParty => '다른 파티에 참여';

  @override
  String get tuningIn => '연결하는 중…';

  @override
  String get warmingUpSpeakers => '스피커를 예열하는 중';

  @override
  String connectingToWifi(String ssid) {
    return '$ssid에 연결하는 중…';
  }

  @override
  String get partyWifi => '파티 Wi-Fi';

  @override
  String get tapAllowToConnect => '팝업에서 허용을 탭해 연결하세요.';

  @override
  String get findingHost => '호스트를 찾는 중…';

  @override
  String get searchingParty => '이 Wi-Fi에서 파티를 찾는 중입니다.';

  @override
  String get lockingIntoSync => '동기화하는 중…';

  @override
  String get aligningBeat => '비트 타이밍을 맞추는 중입니다.';

  @override
  String get hostIsMuted => '호스트가 음소거 중 🤫';

  @override
  String get hostMutedSubtitle => '연결됨! 호스트가 음소거를 해제하면 소리가 다시 나옵니다.';

  @override
  String get bumpingInSync => '동기화 완료, 신나게 즐기는 중 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return '$name에 직접 연결됨';
  }

  @override
  String get hostFallback => '호스트';

  @override
  String syncedVia(String name, int depth) {
    return '$name을(를) 통해 동기화됨(마이크로부터 홉 수: $depth)';
  }

  @override
  String get boosterFallback => '증폭기';

  @override
  String get reSyncing => '다시 동기화하는 중…';

  @override
  String get reconnectingStream => '스트림에 다시 연결하는 중';

  @override
  String get notConnectedYet => '아직 연결되지 않음';

  @override
  String get phoneSpeaker => '폰 스피커';

  @override
  String bluetoothDelayZeroed(int ms) {
    return '블루투스 지연(+${ms}ms)이 자동으로 보정되었습니다.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return '스피커 지연(+${ms}ms)이 자동으로 보정되었습니다.';
  }

  @override
  String get syncTiming => '동기화 타이밍';

  @override
  String get audioBuffer => '오디오 버퍼';

  @override
  String get streamDrops => '스트림 끊김';

  @override
  String get autoAdjust => '자동 조정';

  @override
  String get defaultSyncZero => '기본 동기화(오프셋 0)';

  @override
  String nudgedEarlier(int ms) {
    return '${ms}ms 앞당김';
  }

  @override
  String nudgedLater(int ms) {
    return '${ms}ms 늦춤';
  }

  @override
  String get reset => '초기화';

  @override
  String get echoHelp =>
      '에코가 들리나요? 이 스피커가 다른 기기보다 늦게 들리면 오른쪽으로, 빠르게 들리면 왼쪽으로 슬라이드하세요. (대부분의 스피커는 조정하지 않아도 완벽합니다!)';

  @override
  String get relayUnsupportedIos =>
      'iPhone은 듣는 동안 Wi-Fi를 공유할 수 없어요. 대신 Android를 쓰는 친구에게 신호 증폭기를 켜 달라고 하세요!';

  @override
  String get relayUnsupportedAndroid => '이 폰은 Wi-Fi Direct 증폭기 모드를 지원하지 않습니다.';

  @override
  String get boostSignalTitle => '친구들을 위해 신호 증폭';

  @override
  String tooFarToBoost(int depth) {
    return '호스트에서 너무 멀어 범위를 더 넓힐 수 없습니다(호스트로부터 홉 수: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '친구 $count명',
    );
    return '$_temp0에게 소리를 증폭하는 중';
  }

  @override
  String get boostSubtitleOff =>
      '내 폰을 Wi-Fi 증폭기로 만들어 더 멀리 있는 친구도 연결할 수 있게 합니다.';

  @override
  String get chargerTip => '가능하면 충전기를 연결하세요. 범위를 넓히면 배터리를 더 많이 사용합니다.';

  @override
  String get scanToConnectBooster => '스캔해서 증폭기로 연결 📲';

  @override
  String get reconnectSameNetwork => '같은 네트워크에 다시 연결';

  @override
  String get retry => '재시도';

  @override
  String get switchLabel => '전환';

  @override
  String hostLabel(String name) {
    return '$name(호스트 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name(증폭기 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · 동기화됨: $count';
  }

  @override
  String get tryAgain => '다시 시도';

  @override
  String get back => '뒤로';

  @override
  String get cancel => '취소';

  @override
  String get copy => '복사';

  @override
  String get show => '표시';

  @override
  String get hide => '숨기기';

  @override
  String copied(String label) {
    return '$label을(를) 복사했습니다';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => '비밀번호';

  @override
  String get labelAddress => '주소';

  @override
  String get partyCode => '파티 코드';

  @override
  String get cameraQr => '카메라용 QR';

  @override
  String get settingUpNetwork => '파티 네트워크를 설정하는 중…';

  @override
  String get qrCameraHelp =>
      '폰의 카메라 앱으로 스캔해 먼저 Wi-Fi에 연결한 다음, Crowd Speaker를 열고 \"이미 같은 Wi-Fi에 연결되어 있어요\"를 탭하세요.';

  @override
  String get qrAppHelp =>
      'Crowd Speaker로 스캔 → \"사운드에 참여\". 한 번의 탭으로 Wi-Fi에 연결하고 소리를 자동으로 동기화합니다!';

  @override
  String get noSpeakersYet => '아직 스피커가 없어요. 친구들이 QR 코드를 스캔해 참여하게 해 보세요!';

  @override
  String youLabel(String name) {
    return '$name(나 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return '증폭기 📡 · 동기화됨: $count';
  }

  @override
  String bufferDetail(int ms) {
    return '버퍼 ${ms}ms';
  }

  @override
  String dropsDetail(String pct) {
    return '끊김 $pct%';
  }

  @override
  String get errMicNeeded => '마이크 역할을 하려면 마이크 접근 권한이 필요합니다.';

  @override
  String get errNearbyCreate => '앱이 네트워크를 만들 수 있도록 \"주변 기기\"를 허용해 주세요.';

  @override
  String get errNearbyShare => '앱이 네트워크를 공유할 수 있도록 \"주변 기기\"를 허용해 주세요.';

  @override
  String errNetwork(String message) {
    return '네트워크 오류: $message';
  }

  @override
  String get noticeHotspotOff => '핫스팟이 아직 켜져 있지 않아요. 켜면 QR 코드가 자동으로 업데이트됩니다.';

  @override
  String get noticeLostHost =>
      '호스트와의 연결이 끊어졌습니다. 다시 시도하는 중이며, 아래에서 다른 네트워크를 선택할 수도 있습니다.';

  @override
  String noticeLostParent(String name) {
    return '$name과(와)의 연결이 끊어졌습니다. 다시 시도하는 중이며, 아래에서 다른 네트워크를 선택할 수도 있습니다.';
  }

  @override
  String get noticeRejectSyncing => '증폭기 폰을 찾았지만 아직 동기화 중입니다. 잠시 후 다시 시도하세요.';

  @override
  String get noticeRejectLoop => '그 폰은 이미 내 기기를 통해 연결되어 있어서 내 소스가 될 수 없습니다.';

  @override
  String noticeRejectOther(String reason) {
    return '찾은 폰의 응답: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return '이 코드의 Wi-Fi 비밀번호는 $length자이지만 Wi-Fi 비밀번호는 8~63자여야 합니다. 호스트가 잘못 입력했을 수 있어요. 다시 입력해 달라고 요청하거나, Wi-Fi 설정에서 \"$ssid\"에 연결한 뒤 \"이미 같은 Wi-Fi에 연결되어 있어요\"를 탭하세요.';
  }

  @override
  String get errHostNotFound =>
      '이 Wi-Fi에서 호스트를 찾을 수 없습니다. 호스트가 라이브 중인지, 올바른 네트워크에 연결했는지 확인하세요.';

  @override
  String get errRelayNeedsAndroid =>
      '공유하려면 Wi-Fi Direct를 지원하는 Android 폰이 필요합니다.';

  @override
  String errTooDeep(int depth, int max) {
    return '이 폰은 호스트에서 너무 멉니다(호스트로부터 홉 수: $depth, 최대 $max). 공유하려면 호스트에 더 가까운 네트워크에 연결하세요.';
  }

  @override
  String notifHosting(String name) {
    return '\"$name\" 호스팅 중';
  }

  @override
  String notifPlaying(String name) {
    return '\"$name\" 재생 중';
  }
}
