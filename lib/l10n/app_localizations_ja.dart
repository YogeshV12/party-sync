// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get homeTagline =>
      'みんなのスマホを巨大なサウンドシステムに。🔊 1台がマイクを握り、他のすべてのスマホ（接続したBluetoothスピーカーも）が同期して音を鳴らします。';

  @override
  String get nameLabel => 'あなたの名前またはニックネーム';

  @override
  String get nameHelper => 'みんなの画面に表示される名前';

  @override
  String get homeVibeTitle => 'どうする？';

  @override
  String get hostCardTitle => 'マイクを握る 🎤';

  @override
  String get hostCardSubtitle =>
      'パーティーのホストになりましょう。話した声や配信した音が、みんなのスピーカーからリアルタイムで流れます。';

  @override
  String get joinCardTitle => 'サウンドに参加 🔊';

  @override
  String get joinCardSubtitle =>
      'ホストのQRコードをスキャン。このスマホやBluetoothスピーカーをパーティーの一部にしましょう。';

  @override
  String get homeTipRelay =>
      'ヒント：このスマホは電波の範囲を広げられます！接続後、近くのさらに多くの友達と音をシェアできます。';

  @override
  String get homeTipIos =>
      'iPhoneはホストとして、またはスピーカーとして参加できます。離れた友達まで電波を届けたいときはAndroidスマホを使いましょう。';

  @override
  String get homeTipDefault => 'パーティーのホストやサウンドへの参加、いつでもどうぞ！';

  @override
  String get scanHostQr => 'ホストのQRコードをスキャン';

  @override
  String get scanHostQrSubtitle => 'ワンタップで接続：Wi-Fiに接続して自動で音を同期します';

  @override
  String get alreadyOnWifi => 'すでに同じWi-Fiに接続しています';

  @override
  String get connectManually => '手動で接続';

  @override
  String get wifiNameLabel => 'Wi-Fi名';

  @override
  String get wifiPasswordLabel => 'Wi-Fiパスワード';

  @override
  String get hostIpLabel => 'ホストのIPアドレス（任意）';

  @override
  String get hostIpHelper => 'ホストのQRコードの下に表示されます';

  @override
  String get connectToParty => 'パーティーに接続';

  @override
  String get enterWifiName => 'Wi-Fi名を入力してください。';

  @override
  String get joinTipIos =>
      '確認が表示されたら「参加」をタップして接続します。音が鳴り続けるよう、Crowd Speakerを開いたままにしてください！';

  @override
  String get joinTipAndroid => '確認が表示されたらタップしてWi-Fi接続を許可すると、すぐにパーティーに参加できます。';

  @override
  String get scannerNotACode =>
      'Crowd Speakerのコードではありません。友達の画面のQRコードをスキャンしてください！';

  @override
  String get scannerHint => '友達の画面のQRコードにカメラを向けてください。';

  @override
  String get hostSetupTitle => 'パーティーを開く 🎤';

  @override
  String get partyNameLabel => 'パーティー名';

  @override
  String get partyNameHelper => '参加するときに友達に表示される名前';

  @override
  String partyNameDefault(String name) {
    return '$nameのパーティー';
  }

  @override
  String get defaultPartyName => 'パーティー';

  @override
  String get connectQuestion => '友達はどうやって接続しますか？';

  @override
  String get instantNetworkTitle => 'インスタントパーティーネットワーク';

  @override
  String get badgeEasiest => 'いちばん簡単';

  @override
  String get instantNetworkSubtitle =>
      '設定は不要。みんながつながれるローカルネットワークをすぐに作ります。（インターネット不要）';

  @override
  String get usePersonalHotspot => 'インターネット共有を使う';

  @override
  String get useMyHotspot => '自分のスマホのテザリングを使う';

  @override
  String get hotspotSubtitle =>
      'スマホのテザリングを手動でオンにします。友達があなたのモバイル通信を共有することもできます。';

  @override
  String get hotspotInfoIos =>
      '設定で「インターネット共有」をオンにし（「ほかの人の接続を許可」）、友達が参加できるように、下にiPhoneの名前とパスワードを入力してください。';

  @override
  String get hotspotInfoAndroid =>
      '設定でテザリングをオンにし、友達が参加できるように、下にWi-Fi名とパスワードを入力してください。';

  @override
  String get openHotspotSettings => 'テザリング設定を開く';

  @override
  String get hotspotSettingsHint =>
      '設定 → インターネット共有 を開き、「ほかの人の接続を許可」をオンにしてください。';

  @override
  String get hotspotWifiNameLabel => 'テザリングのWi-Fi名';

  @override
  String get hotspotPasswordLabel => 'テザリングのパスワード';

  @override
  String get enterHotspotName => '友達が参加できるように、テザリング名を入力してください。';

  @override
  String get invalidWifiPassword =>
      'Wi-Fiパスワードは8〜63文字にしてください。テザリングの設定を確認して、もう一度お試しください！';

  @override
  String get audioTuning => 'オーディオ調整';

  @override
  String get filterNoiseTitle => '背景ノイズを除去';

  @override
  String get filterNoiseSubtitle =>
      '声をクリアに保ちます。音楽を大音量で流すときやDJ機材を使うときはオフにしてください。';

  @override
  String get startParty => 'パーティーを始める 🔥';

  @override
  String get onTheMic => 'マイク中 🎤';

  @override
  String get endParty => 'パーティーを終了';

  @override
  String get endPartyTitle => 'パーティーを終了しますか？';

  @override
  String get endPartyMessage => 'すべてのスピーカーが切断され、音が止まります。';

  @override
  String get somethingWentWrong => '問題が発生しました。';

  @override
  String get firingUpParty => 'パーティーを準備中…';

  @override
  String get creatingPartyNetwork => 'パーティーネットワークを作成中';

  @override
  String get scanToJoinSound => 'スキャンしてサウンドに参加 📲';

  @override
  String get syncBufferTitle => 'サウンド同期バッファ';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count台接続中',
    );
    return 'みんなのスピーカー · $_temp0';
  }

  @override
  String get micMuted => 'マイクはミュート中 🤫';

  @override
  String get liveOnAir => 'ライブ配信中 🎙️';

  @override
  String get tapToUnmute => 'マイクをタップしてミュートを解除';

  @override
  String get waitingForSquad => 'みんながスキャンして参加するのを待っています…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'スマホスピーカー$count台',
    );
    return '$_temp0にライブ配信中';
  }

  @override
  String get bufferDelayLabel => '再生前のバッファ遅延';

  @override
  String get syncBufferHelp =>
      '音が途切れたり欠けたりする場合は上げてください。Bluetoothスピーカーや電波ブースターは、完全に同期するために少し多めのバッファが必要です。';

  @override
  String get speakerMode => 'スピーカーモード 🔊';

  @override
  String get leave => '退出';

  @override
  String get leavePartyTitle => 'パーティーから退出しますか？';

  @override
  String get leavePartyBoosterMessage => 'あなたのブースター経由で接続している友達も切断されます。';

  @override
  String get leavePartyMessage => 'このスマホは音を鳴らさなくなります。';

  @override
  String get leaveParty => 'パーティーを退出';

  @override
  String get audioOutput => 'オーディオ出力';

  @override
  String get thisSpeaker => 'このスピーカー';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$routeはBluetoothの遅延が大きく（$latencyミリ秒）、ホストの同期バッファを超えています。音を再生できるよう、ホストに「サウンド同期バッファ」を$neededミリ秒以上に上げてもらってください！';
  }

  @override
  String get echoFixTitle => 'エコー補正（同期の微調整）';

  @override
  String get boostRangeTitle => '友達のために範囲を広げる 📡';

  @override
  String get partyWrappedUp => 'パーティーは終了しました 🎉';

  @override
  String get hostEndedParty => 'ホストがパーティーを終了しました。';

  @override
  String partyEndedByHost(String name) {
    return '「$name」はホストによって終了されました。';
  }

  @override
  String get backToHome => 'ホームに戻る';

  @override
  String get joinAnotherParty => '別のパーティーに参加';

  @override
  String get tuningIn => 'チューニング中…';

  @override
  String get warmingUpSpeakers => 'スピーカーをウォームアップ中';

  @override
  String connectingToWifi(String ssid) {
    return '$ssidに接続中…';
  }

  @override
  String get partyWifi => 'パーティーのWi-Fi';

  @override
  String get tapAllowToConnect => 'ポップアップで「許可」をタップして接続してください。';

  @override
  String get findingHost => 'ホストを探しています…';

  @override
  String get searchingParty => 'このWi-Fi上でパーティーを検索中。';

  @override
  String get lockingIntoSync => '同期中…';

  @override
  String get aligningBeat => 'ビートのタイミングを調整中。';

  @override
  String get hostIsMuted => 'ホストはミュート中 🤫';

  @override
  String get hostMutedSubtitle => '接続しました！ホストがミュートを解除すると音が戻ります。';

  @override
  String get bumpingInSync => '同期してノリノリ 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return '$nameに直接接続';
  }

  @override
  String get hostFallback => 'ホスト';

  @override
  String syncedVia(String name, int depth) {
    return '$name経由で同期（マイクからのホップ数：$depth）';
  }

  @override
  String get boosterFallback => 'ブースター';

  @override
  String get reSyncing => '再同期中…';

  @override
  String get reconnectingStream => 'ストリームに再接続中';

  @override
  String get notConnectedYet => '未接続';

  @override
  String get phoneSpeaker => 'スマホのスピーカー';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'Bluetoothの遅延（+$msミリ秒）を自動で補正しました。';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'スピーカーの遅延（+$msミリ秒）を自動で調整しました。';
  }

  @override
  String get syncTiming => '同期タイミング';

  @override
  String get audioBuffer => 'オーディオバッファ';

  @override
  String get streamDrops => 'ストリーム欠損';

  @override
  String get autoAdjust => '自動調整';

  @override
  String get defaultSyncZero => '標準の同期（オフセットなし）';

  @override
  String nudgedEarlier(int ms) {
    return '$msミリ秒早めました';
  }

  @override
  String nudgedLater(int ms) {
    return '$msミリ秒遅らせました';
  }

  @override
  String get reset => 'リセット';

  @override
  String get echoHelp =>
      'エコーが聞こえますか？このスピーカーがみんなより遅れて聞こえるなら右へ、先に聞こえるなら左へスライドしてください。（ほとんどのスピーカーは調整しなくても完璧です！）';

  @override
  String get relayUnsupportedIos =>
      'iPhoneは再生中にWi-Fiを共有できません。代わりにAndroidの友達に電波ブースターをオンにしてもらいましょう！';

  @override
  String get relayUnsupportedAndroid => 'このスマホはWi-Fi Directブースターモードに対応していません。';

  @override
  String get boostSignalTitle => '友達のために電波を強化';

  @override
  String tooFarToBoost(int depth) {
    return 'ホストから遠すぎて、これ以上範囲を広げられません（ホストからのホップ数：$depth）。';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '友達$count人',
    );
    return '$_temp0のために音を中継中';
  }

  @override
  String get boostSubtitleOff => 'スマホをWi-Fiブースターにして、離れた友達も接続できるようにします。';

  @override
  String get chargerTip => 'できれば充電器につないでください。範囲拡大は電池を多く消費します。';

  @override
  String get scanToConnectBooster => 'スキャンしてブースター経由で接続 📲';

  @override
  String get reconnectSameNetwork => '同じネットワークに再接続';

  @override
  String get retry => '再試行';

  @override
  String get switchLabel => '切り替え';

  @override
  String hostLabel(String name) {
    return '$name（ホスト 🎤）';
  }

  @override
  String boosterLabel(String name) {
    return '$name（ブースター 📡）';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · 同期中：$count';
  }

  @override
  String get tryAgain => 'もう一度試す';

  @override
  String get back => '戻る';

  @override
  String get cancel => 'キャンセル';

  @override
  String get copy => 'コピー';

  @override
  String get show => '表示';

  @override
  String get hide => '非表示';

  @override
  String copied(String label) {
    return '$labelをコピーしました';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'パスワード';

  @override
  String get labelAddress => 'アドレス';

  @override
  String get partyCode => 'パーティーコード';

  @override
  String get cameraQr => 'カメラ用QR';

  @override
  String get settingUpNetwork => 'パーティーネットワークを設定中…';

  @override
  String get qrCameraHelp =>
      'スマホのカメラアプリでスキャンして先にWi-Fiに参加し、そのあとCrowd Speakerを開いて「すでに同じWi-Fiに接続しています」をタップしてください。';

  @override
  String get qrAppHelp =>
      'Crowd Speakerでスキャン → 「サウンドに参加」。ワンタップでWi-Fiに接続し、自動で音を同期します！';

  @override
  String get noSpeakersYet => 'まだスピーカーがありません。みんなにQRコードをスキャンして参加してもらいましょう！';

  @override
  String youLabel(String name) {
    return '$name（あなた 🎤）';
  }

  @override
  String boosterDetail(int count) {
    return 'ブースター 📡 · 同期中：$count';
  }

  @override
  String bufferDetail(int ms) {
    return 'バッファ$msミリ秒';
  }

  @override
  String dropsDetail(String pct) {
    return '欠損$pct%';
  }

  @override
  String get errMicNeeded => 'マイク役になるにはマイクへのアクセスが必要です。';

  @override
  String get errNearbyCreate => 'アプリがネットワークを作成できるよう「付近のデバイス」を許可してください。';

  @override
  String get errNearbyShare => 'アプリがネットワークを共有できるよう「付近のデバイス」を許可してください。';

  @override
  String errNetwork(String message) {
    return 'ネットワークエラー：$message';
  }

  @override
  String get noticeHotspotOff => 'テザリングがまだオンになっていません。オンにするとQRコードが自動で更新されます。';

  @override
  String get noticeLostHost => 'ホストとの接続が切れました。再試行中です。下から別のネットワークを選ぶこともできます。';

  @override
  String noticeLostParent(String name) {
    return '$nameとの接続が切れました。再試行中です。下から別のネットワークを選ぶこともできます。';
  }

  @override
  String get noticeRejectSyncing =>
      'ブースターのスマホが見つかりましたが、まだ同期中です。少し待ってからもう一度お試しください。';

  @override
  String get noticeRejectLoop => 'そのスマホはすでにあなた経由で接続されているため、接続元にはできません。';

  @override
  String noticeRejectOther(String reason) {
    return '見つかったスマホからの応答：$reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'このコードのWi-Fiパスワードは$length文字ですが、Wi-Fiパスワードは8〜63文字です。ホストが入力を間違えた可能性があります。再入力してもらうか、Wi-Fi設定で「$ssid」に接続して「すでに同じWi-Fiに接続しています」をタップしてください。';
  }

  @override
  String get errHostNotFound =>
      'このWi-Fiでホストが見つかりませんでした。ホストがライブ中か、正しいネットワークに接続しているか確認してください。';

  @override
  String get errRelayNeedsAndroid => '共有にはWi-Fi Direct対応のAndroidスマホが必要です。';

  @override
  String errTooDeep(int depth, int max) {
    return 'このスマホはホストから遠すぎます（ホストからのホップ数：$depth、最大$max）。共有するにはホストに近いネットワークに参加してください。';
  }

  @override
  String notifHosting(String name) {
    return '「$name」をホスト中';
  }

  @override
  String notifPlaying(String name) {
    return '「$name」を再生中';
  }
}
