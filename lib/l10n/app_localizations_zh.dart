// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get homeTagline =>
      '把大家的手机变成一套超大音响系统。🔊 一部手机负责拿麦克风，其他所有手机（以及连接的蓝牙音箱）同步播放声音。';

  @override
  String get nameLabel => '你的名字或昵称';

  @override
  String get nameHelper => '朋友们在屏幕上看到的名称';

  @override
  String get homeVibeTitle => '今天玩什么？';

  @override
  String get hostCardTitle => '拿起麦克风 🎤';

  @override
  String get hostCardSubtitle => '当派对主持人。你说的话或播放的内容会实时通过每个人的音箱播放。';

  @override
  String get joinCardTitle => '加入声音 🔊';

  @override
  String get joinCardSubtitle => '扫描主持人的二维码，把这部手机或你的蓝牙音箱变成派对的一部分。';

  @override
  String get homeTipRelay => '小提示：这部手机可以扩大覆盖范围！连接后，你可以把声音分享给附近更多的朋友。';

  @override
  String get homeTipIos =>
      'iPhone 可以作为主持人或音箱加入。若想扩大覆盖范围、让更远的朋友也能连上，请使用 Android 手机。';

  @override
  String get homeTipDefault => '随时可以主持派对或加入声音！';

  @override
  String get scanHostQr => '扫描主持人二维码';

  @override
  String get scanHostQrSubtitle => '一键连接：自动连接 Wi-Fi 并同步声音';

  @override
  String get alreadyOnWifi => '我已连接同一个 Wi-Fi';

  @override
  String get connectManually => '手动连接';

  @override
  String get wifiNameLabel => 'Wi-Fi 名称';

  @override
  String get wifiPasswordLabel => 'Wi-Fi 密码';

  @override
  String get hostIpLabel => '主持人 IP 地址（可选）';

  @override
  String get hostIpHelper => '位于主持人二维码下方';

  @override
  String get connectToParty => '连接到派对';

  @override
  String get enterWifiName => '请输入 Wi-Fi 名称。';

  @override
  String get joinTipIos => '出现提示时，点按“加入”即可连接。请保持 Crowd Speaker 运行，声音才会持续播放！';

  @override
  String get joinTipAndroid => '出现提示时，点按接受 Wi-Fi 连接，你就能直接加入派对。';

  @override
  String get scannerNotACode => '这不是 Crowd Speaker 的二维码。请扫描朋友屏幕上的二维码！';

  @override
  String get scannerHint => '将相机对准朋友屏幕上的二维码。';

  @override
  String get hostSetupTitle => '主持派对 🎤';

  @override
  String get partyNameLabel => '派对名称';

  @override
  String get partyNameHelper => '朋友加入时会看到的名称';

  @override
  String partyNameDefault(String name) {
    return '$name的派对';
  }

  @override
  String get defaultPartyName => '派对';

  @override
  String get connectQuestion => '朋友们如何连接？';

  @override
  String get instantNetworkTitle => '即时派对网络';

  @override
  String get badgeEasiest => '最简单';

  @override
  String get instantNetworkSubtitle => '无需任何设置。立即创建本地网络，供所有人加入。（无需互联网）';

  @override
  String get usePersonalHotspot => '使用个人热点';

  @override
  String get useMyHotspot => '使用我的手机热点';

  @override
  String get hotspotSubtitle => '手动开启手机热点。朋友们也可以共用你的移动网络。';

  @override
  String get hotspotInfoIos =>
      '在“设置”中开启“个人热点”（“允许其他人加入”），然后在下方输入 iPhone 名称和热点密码，朋友们才能加入。';

  @override
  String get hotspotInfoAndroid => '在“设置”中开启热点，然后在下方输入 Wi-Fi 名称和密码，朋友们才能加入。';

  @override
  String get openHotspotSettings => '打开热点设置';

  @override
  String get hotspotSettingsHint => '打开“设置”→“个人热点”，并开启“允许其他人加入”。';

  @override
  String get hotspotWifiNameLabel => '热点 Wi-Fi 名称';

  @override
  String get hotspotPasswordLabel => '热点密码';

  @override
  String get enterHotspotName => '请输入热点名称，以便朋友加入。';

  @override
  String get invalidWifiPassword => 'Wi-Fi 密码必须为 8–63 个字符。请检查热点设置后重试！';

  @override
  String get audioTuning => '音频调节';

  @override
  String get filterNoiseTitle => '过滤背景噪音';

  @override
  String get filterNoiseSubtitle => '让人声更清晰。如果你在大声播放音乐或使用 DJ 设备，请关闭。';

  @override
  String get startParty => '开始派对 🔥';

  @override
  String get onTheMic => '正在麦克风前 🎤';

  @override
  String get endParty => '结束派对';

  @override
  String get endPartyTitle => '结束派对？';

  @override
  String get endPartyMessage => '这将断开所有音箱的连接并停止声音。';

  @override
  String get somethingWentWrong => '出了点问题。';

  @override
  String get firingUpParty => '正在点燃派对…';

  @override
  String get creatingPartyNetwork => '正在创建你的派对网络';

  @override
  String get scanToJoinSound => '扫码加入声音 📲';

  @override
  String get syncBufferTitle => '声音同步缓冲';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已连接 $count 部手机',
    );
    return '伙伴音箱 · $_temp0';
  }

  @override
  String get micMuted => '麦克风已静音 🤫';

  @override
  String get liveOnAir => '直播中 🎙️';

  @override
  String get tapToUnmute => '点按麦克风取消静音并回到现场';

  @override
  String get waitingForSquad => '正在等待大家扫码加入…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 部手机音箱',
    );
    return '正在向 $_temp0 实时播放';
  }

  @override
  String get bufferDelayLabel => '播放前的缓冲延迟';

  @override
  String get syncBufferHelp => '如果声音卡顿或中断，请向上调。蓝牙音箱和信号增强设备需要稍多的缓冲时间才能保持完美同步。';

  @override
  String get speakerMode => '音箱模式 🔊';

  @override
  String get leave => '离开';

  @override
  String get leavePartyTitle => '离开派对？';

  @override
  String get leavePartyBoosterMessage => '通过你的信号增强连接的朋友也会断开。';

  @override
  String get leavePartyMessage => '这部手机将停止播放声音。';

  @override
  String get leaveParty => '离开派对';

  @override
  String get audioOutput => '音频输出';

  @override
  String get thisSpeaker => '此音箱';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route 的蓝牙延迟较高（$latency 毫秒），超过了主持人的同步缓冲。请让主持人将“声音同步缓冲”调高到 $needed 毫秒或更高，这样你的声音才能播放！';
  }

  @override
  String get echoFixTitle => '回声修正（微调同步）';

  @override
  String get boostRangeTitle => '为朋友扩大覆盖范围 📡';

  @override
  String get partyWrappedUp => '派对结束了 🎉';

  @override
  String get hostEndedParty => '主持人结束了派对。';

  @override
  String partyEndedByHost(String name) {
    return '“$name”已被主持人结束。';
  }

  @override
  String get backToHome => '返回首页';

  @override
  String get joinAnotherParty => '加入其他派对';

  @override
  String get tuningIn => '正在接入…';

  @override
  String get warmingUpSpeakers => '音箱预热中';

  @override
  String connectingToWifi(String ssid) {
    return '正在连接 $ssid…';
  }

  @override
  String get partyWifi => '派对 Wi-Fi';

  @override
  String get tapAllowToConnect => '请在弹窗中点按“允许”以连接。';

  @override
  String get findingHost => '正在寻找主持人…';

  @override
  String get searchingParty => '正在此 Wi-Fi 中搜索派对。';

  @override
  String get lockingIntoSync => '正在锁定同步…';

  @override
  String get aligningBeat => '正在对齐节拍。';

  @override
  String get hostIsMuted => '主持人已静音 🤫';

  @override
  String get hostMutedSubtitle => '已连接！主持人取消静音后声音会回来。';

  @override
  String get bumpingInSync => '同步嗨起来 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return '已直接连接到$name';
  }

  @override
  String get hostFallback => '主持人';

  @override
  String syncedVia(String name, int depth) {
    return '通过$name同步（距麦克风跳数：$depth）';
  }

  @override
  String get boosterFallback => '信号增强设备';

  @override
  String get reSyncing => '正在重新同步…';

  @override
  String get reconnectingStream => '正在重新连接音频流';

  @override
  String get notConnectedYet => '尚未连接';

  @override
  String get phoneSpeaker => '手机扬声器';

  @override
  String bluetoothDelayZeroed(int ms) {
    return '蓝牙延迟（+$ms 毫秒）已自动补偿。';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return '扬声器延迟（+$ms 毫秒）已自动校准。';
  }

  @override
  String get syncTiming => '同步时间';

  @override
  String get audioBuffer => '音频缓冲';

  @override
  String get streamDrops => '音频流丢包';

  @override
  String get autoAdjust => '自动调整';

  @override
  String get defaultSyncZero => '默认同步（零偏移）';

  @override
  String nudgedEarlier(int ms) {
    return '已提前 $ms 毫秒';
  }

  @override
  String nudgedLater(int ms) {
    return '已延后 $ms 毫秒';
  }

  @override
  String get reset => '重置';

  @override
  String get echoHelp =>
      '听到回声了吗？如果这个音箱比大家慢，请向右滑动；如果比大家快，请向左滑动。（大多数音箱无需调整就很完美！）';

  @override
  String get relayUnsupportedIos =>
      'iPhone 在收听时无法共享 Wi-Fi。请让使用 Android 的朋友开启信号增强！';

  @override
  String get relayUnsupportedAndroid => '这部手机不支持 Wi-Fi Direct 信号增强模式。';

  @override
  String get boostSignalTitle => '为朋友增强信号';

  @override
  String tooFarToBoost(int depth) {
    return '距离主持人太远，无法继续扩大覆盖范围（距主持人跳数：$depth）。';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位朋友',
    );
    return '正在为 $_temp0 增强声音';
  }

  @override
  String get boostSubtitleOff => '把你的手机变成 Wi-Fi 信号增强器，让更远的朋友也能连接。';

  @override
  String get chargerTip => '建议接上充电器：扩大覆盖范围会额外耗电。';

  @override
  String get scanToConnectBooster => '扫码通过信号增强连接 📲';

  @override
  String get reconnectSameNetwork => '重新连接同一网络';

  @override
  String get retry => '重试';

  @override
  String get switchLabel => '切换';

  @override
  String hostLabel(String name) {
    return '$name（主持人 🎤）';
  }

  @override
  String boosterLabel(String name) {
    return '$name（信号增强 📡）';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · 已同步：$count';
  }

  @override
  String get tryAgain => '重试';

  @override
  String get back => '返回';

  @override
  String get cancel => '取消';

  @override
  String get copy => '复制';

  @override
  String get show => '显示';

  @override
  String get hide => '隐藏';

  @override
  String copied(String label) {
    return '已复制$label';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => '密码';

  @override
  String get labelAddress => '地址';

  @override
  String get partyCode => '派对码';

  @override
  String get cameraQr => '相机二维码';

  @override
  String get settingUpNetwork => '正在设置派对网络…';

  @override
  String get qrCameraHelp =>
      '请先用手机相机应用扫描以加入 Wi-Fi，然后打开 Crowd Speaker 并点按“我已连接同一个 Wi-Fi”。';

  @override
  String get qrAppHelp => '用 Crowd Speaker 扫描 → “加入声音”。一键连接 Wi-Fi 并自动同步声音！';

  @override
  String get noSpeakersYet => '还没有音箱。让大家扫描你的二维码加入吧！';

  @override
  String youLabel(String name) {
    return '$name（你 🎤）';
  }

  @override
  String boosterDetail(int count) {
    return '信号增强 📡 · 已同步：$count';
  }

  @override
  String bufferDetail(int ms) {
    return '缓冲 $ms 毫秒';
  }

  @override
  String dropsDetail(String pct) {
    return '丢包 $pct%';
  }

  @override
  String get errMicNeeded => '需要麦克风权限才能担任麦克风。';

  @override
  String get errNearbyCreate => '请允许“附近设备”权限，以便应用创建网络。';

  @override
  String get errNearbyShare => '请允许“附近设备”权限，以便应用共享网络。';

  @override
  String errNetwork(String message) {
    return '网络错误：$message';
  }

  @override
  String get noticeHotspotOff => '你的热点尚未开启。开启后二维码会自动更新。';

  @override
  String get noticeLostHost => '与主持人失去连接。正在重试，或在下方选择其他网络。';

  @override
  String noticeLostParent(String name) {
    return '与$name失去连接。正在重试，或在下方选择其他网络。';
  }

  @override
  String get noticeRejectSyncing => '发现了一部信号增强手机，但它仍在同步。请稍后再试。';

  @override
  String get noticeRejectLoop => '那部手机已通过你连接，因此不能作为你的信号源。';

  @override
  String noticeRejectOther(String reason) {
    return '发现的手机回复：$reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return '此二维码中的 Wi-Fi 密码有 $length 个字符，但 Wi-Fi 密码应为 8-63 个字符。可能是主持人输错了：请让对方重新输入，或在 Wi-Fi 设置中加入“$ssid”，然后点按“我已连接同一个 Wi-Fi”。';
  }

  @override
  String get errHostNotFound => '在此 Wi-Fi 中找不到主持人。请确认主持人正在直播，并且你加入了正确的网络。';

  @override
  String get errRelayNeedsAndroid => '共享需要支持 Wi-Fi Direct 的 Android 手机。';

  @override
  String errTooDeep(int depth, int max) {
    return '这部手机距离主持人太远（距主持人跳数：$depth，最多 $max）。请加入离主持人更近的网络再共享。';
  }

  @override
  String notifHosting(String name) {
    return '正在主持“$name”';
  }

  @override
  String notifPlaying(String name) {
    return '正在播放“$name”';
  }
}
