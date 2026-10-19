// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get homeTagline =>
      'Arkadaş grubunuzun telefonlarını dev bir ses sistemine dönüştürün. 🔊 Bir telefon mikrofonu alır, diğer tüm telefonlar (ve bağlı Bluetooth hoparlörler) sesi senkronize çalar.';

  @override
  String get nameLabel => 'Adın veya takma adın';

  @override
  String get nameHelper => 'Grubun ekranında görünecek ad';

  @override
  String get homeVibeTitle => 'Plan ne?';

  @override
  String get hostCardTitle => 'Mikrofonu al 🎤';

  @override
  String get hostCardSubtitle =>
      'Partiyi sen yönet. Söylediğin veya yayınladığın her şey herkesin hoparlöründe gerçek zamanlı çalar.';

  @override
  String get joinCardTitle => 'Sese katıl 🔊';

  @override
  String get joinCardSubtitle =>
      'Ev sahibinin QR kodunu tara. Bu telefonu veya Bluetooth hoparlörünü partinin bir parçası yap.';

  @override
  String get homeTipRelay =>
      'İpucu: Bu telefon menzili artırabilir! Bağlandıktan sonra sesi yakındaki daha fazla arkadaşınla paylaşabilirsin.';

  @override
  String get homeTipIos =>
      'iPhone\'lar hoparlör olarak ev sahipliği yapabilir veya katılabilir. Uzaktaki arkadaşlar için menzili artırmak istersen bir Android telefon kullan.';

  @override
  String get homeTipDefault => 'Partiyi başlatmaya veya sese katılmaya hazır!';

  @override
  String get scanHostQr => 'Ev sahibinin QR kodunu tara';

  @override
  String get scanHostQrSubtitle =>
      'Tek dokunuşla bağlan: Wi-Fi\'ye bağlanır ve sesi otomatik senkronize eder';

  @override
  String get alreadyOnWifi => 'Zaten aynı Wi-Fi\'dayım';

  @override
  String get connectManually => 'Elle bağlan';

  @override
  String get wifiNameLabel => 'Wi-Fi adı';

  @override
  String get wifiPasswordLabel => 'Wi-Fi şifresi';

  @override
  String get hostIpLabel => 'Ev sahibinin IP adresi (isteğe bağlı)';

  @override
  String get hostIpHelper => 'Ev sahibinin QR kodunun altında yazar';

  @override
  String get connectToParty => 'Partiye bağlan';

  @override
  String get enterWifiName => 'Lütfen Wi-Fi adını gir.';

  @override
  String get joinTipIos =>
      'İstendiğinde bağlanmak için \"Katıl\"a dokun. Ses çalmaya devam etsin diye Crowd Speaker\'ı açık tut!';

  @override
  String get joinTipAndroid =>
      'İstendiğinde Wi-Fi bağlantısını kabul etmek için dokun, hemen partiye katılırsın.';

  @override
  String get scannerNotACode =>
      'Bu bir Crowd Speaker kodu değil. Arkadaşının ekranındaki QR\'ı tara!';

  @override
  String get scannerHint =>
      'Kamerayı arkadaşının ekranındaki QR koduna doğrult.';

  @override
  String get hostSetupTitle => 'Partiyi yönet 🎤';

  @override
  String get partyNameLabel => 'Parti adı';

  @override
  String get partyNameHelper => 'Arkadaşların katılırken bunu görecek';

  @override
  String partyNameDefault(String name) {
    return '$name partisi';
  }

  @override
  String get defaultPartyName => 'Parti';

  @override
  String get connectQuestion => 'Arkadaşlar nasıl bağlansın?';

  @override
  String get instantNetworkTitle => 'Anında parti ağı';

  @override
  String get badgeEasiest => 'En kolay';

  @override
  String get instantNetworkSubtitle =>
      'Kurulum gerekmez. Herkesin bağlanabileceği anında bir yerel ağ oluşturur. (İnternet gerekmez.)';

  @override
  String get usePersonalHotspot => 'Kişisel Erişim Noktası kullan';

  @override
  String get useMyHotspot => 'Telefonumun hotspot\'unu kullan';

  @override
  String get hotspotSubtitle =>
      'Telefonunun hotspot\'unu elle aç. Arkadaşların mobil internetini de paylaşabilir.';

  @override
  String get hotspotInfoIos =>
      'Ayarlar\'da Kişisel Erişim Noktası\'nı aç (\"Başkalarının Katılmasına İzin Ver\"), ardından arkadaşların katılabilsin diye iPhone adını ve erişim noktası şifresini aşağıya gir.';

  @override
  String get hotspotInfoAndroid =>
      'Ayarlar\'da hotspot\'unu aç, ardından arkadaşların katılabilsin diye Wi-Fi adını ve şifreni aşağıya gir.';

  @override
  String get openHotspotSettings => 'Hotspot ayarlarını aç';

  @override
  String get hotspotSettingsHint =>
      'Ayarlar → Kişisel Erişim Noktası\'nı aç ve \"Başkalarının Katılmasına İzin Ver\"i etkinleştir.';

  @override
  String get hotspotWifiNameLabel => 'Hotspot Wi-Fi adı';

  @override
  String get hotspotPasswordLabel => 'Hotspot şifresi';

  @override
  String get enterHotspotName =>
      'Arkadaşların katılabilsin diye hotspot adını gir.';

  @override
  String get invalidWifiPassword =>
      'Wi-Fi şifreleri 8–63 karakter olmalı. Hotspot ayarlarını kontrol edip tekrar dene!';

  @override
  String get audioTuning => 'Ses ayarı';

  @override
  String get filterNoiseTitle => 'Arka plan gürültüsünü filtrele';

  @override
  String get filterNoiseSubtitle =>
      'Sesleri net tutar. Yüksek sesle müzik çalıyorsan veya DJ ekipmanı kullanıyorsan kapat.';

  @override
  String get startParty => 'Partiyi başlat 🔥';

  @override
  String get onTheMic => 'Mikrofonda 🎤';

  @override
  String get endParty => 'Partiyi bitir';

  @override
  String get endPartyTitle => 'Parti bitirilsin mi?';

  @override
  String get endPartyMessage =>
      'Bu işlem tüm hoparlörlerin bağlantısını keser ve sesi durdurur.';

  @override
  String get somethingWentWrong => 'Bir şeyler ters gitti.';

  @override
  String get firingUpParty => 'Parti başlıyor…';

  @override
  String get creatingPartyNetwork => 'Parti ağın oluşturuluyor';

  @override
  String get scanToJoinSound => 'Sese katılmak için tara 📲';

  @override
  String get syncBufferTitle => 'Senkronizasyon tamponu';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count telefon bağlı',
      one: '$count telefon bağlı',
    );
    return 'Grubun hoparlörleri · $_temp0';
  }

  @override
  String get micMuted => 'Mikrofon kapalı 🤫';

  @override
  String get liveOnAir => 'Canlı yayında 🎙️';

  @override
  String get tapToUnmute => 'Sesi açıp geri dönmek için mikrofona dokun';

  @override
  String get waitingForSquad => 'Grubun tarayıp katılması bekleniyor…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count telefon hoparlöre',
      one: '$count telefon hoparlöre',
    );
    return '$_temp0 canlı yayın yapılıyor';
  }

  @override
  String get bufferDelayLabel => 'Ses çalmadan önceki tampon gecikmesi';

  @override
  String get syncBufferHelp =>
      'Ses takılıyor veya kesiliyorsa yukarı kaydır. Bluetooth hoparlörler ve sinyal güçlendiriciler tam senkron kalmak için biraz daha tampon süresine ihtiyaç duyar.';

  @override
  String get speakerMode => 'Hoparlör modu 🔊';

  @override
  String get leave => 'Ayrıl';

  @override
  String get leavePartyTitle => 'Partiden ayrılınsın mı?';

  @override
  String get leavePartyBoosterMessage =>
      'Güçlendiricin üzerinden bağlanan arkadaşların bağlantısı da kesilecek.';

  @override
  String get leavePartyMessage => 'Bu telefon ses çalmayı bırakacak.';

  @override
  String get leaveParty => 'Partiden ayrıl';

  @override
  String get audioOutput => 'Ses çıkışı';

  @override
  String get thisSpeaker => 'Bu hoparlör';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route yüksek Bluetooth gecikmesine ($latency ms) sahip; bu, ev sahibinin senkronizasyon tamponundan uzun. Sesin çalabilmesi için ev sahibinden \"Senkronizasyon tamponu\"nu $needed ms veya daha fazlasına çıkarmasını iste!';
  }

  @override
  String get echoFixTitle => 'Yankı düzeltme (ince ayar)';

  @override
  String get boostRangeTitle => 'Arkadaşlar için menzili artır 📡';

  @override
  String get partyWrappedUp => 'Parti sona erdi 🎉';

  @override
  String get hostEndedParty => 'Ev sahibi partiyi bitirdi.';

  @override
  String partyEndedByHost(String name) {
    return '\"$name\" ev sahibi tarafından bitirildi.';
  }

  @override
  String get backToHome => 'Ana sayfaya dön';

  @override
  String get joinAnotherParty => 'Başka bir partiye katıl';

  @override
  String get tuningIn => 'Bağlanılıyor…';

  @override
  String get warmingUpSpeakers => 'Hoparlörler ısınıyor';

  @override
  String connectingToWifi(String ssid) {
    return '$ssid ağına bağlanılıyor…';
  }

  @override
  String get partyWifi => 'parti Wi-Fi\'si';

  @override
  String get tapAllowToConnect =>
      'Bağlanmak için açılan pencerede İzin Ver\'e dokun.';

  @override
  String get findingHost => 'Ev sahibi aranıyor…';

  @override
  String get searchingParty => 'Bu Wi-Fi\'da parti aranıyor.';

  @override
  String get lockingIntoSync => 'Senkronize olunuyor…';

  @override
  String get aligningBeat => 'Ritim zamanlaması hizalanıyor.';

  @override
  String get hostIsMuted => 'Ev sahibinin sesi kapalı 🤫';

  @override
  String get hostMutedSubtitle =>
      'Bağlandı! Mikrofonu açınca ses geri gelecek.';

  @override
  String get bumpingInSync => 'Senkron çalıyor 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return '$name ile doğrudan bağlı';
  }

  @override
  String get hostFallback => 'ev sahibi';

  @override
  String syncedVia(String name, int depth) {
    return '$name üzerinden senkronize (mikrofondan atlama sayısı: $depth)';
  }

  @override
  String get boosterFallback => 'güçlendirici';

  @override
  String get reSyncing => 'Yeniden senkronize ediliyor…';

  @override
  String get reconnectingStream => 'Yayına yeniden bağlanılıyor';

  @override
  String get notConnectedYet => 'Henüz bağlı değil';

  @override
  String get phoneSpeaker => 'Telefon hoparlörü';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'Bluetooth gecikmesi (+$ms ms) otomatik olarak telafi edildi.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'Hoparlör gecikmesi (+$ms ms) otomatik olarak kalibre edildi.';
  }

  @override
  String get syncTiming => 'Senkron zamanlaması';

  @override
  String get audioBuffer => 'Ses tamponu';

  @override
  String get streamDrops => 'Yayın kayıpları';

  @override
  String get autoAdjust => 'Otomatik ayar';

  @override
  String get defaultSyncZero => 'Varsayılan senkron (sıfır kaydırma)';

  @override
  String nudgedEarlier(int ms) {
    return '$ms ms öne alındı';
  }

  @override
  String nudgedLater(int ms) {
    return '$ms ms geri alındı';
  }

  @override
  String get reset => 'Sıfırla';

  @override
  String get echoHelp =>
      'Yankı mı duyuyorsun? Bu hoparlör gruptan geriden geliyorsa sağa kaydır. Önden geliyorsa sola kaydır. (Çoğu hoparlör bu ayar olmadan da mükemmel çalışır!)';

  @override
  String get relayUnsupportedIos =>
      'iPhone\'lar dinlerken Wi-Fi paylaşamaz. Bunun yerine Android\'li bir arkadaşından sinyal güçlendiriciyi açmasını iste!';

  @override
  String get relayUnsupportedAndroid =>
      'Bu telefon Wi-Fi Direct güçlendirici modunu desteklemiyor.';

  @override
  String get boostSignalTitle => 'Arkadaşlar için sinyali güçlendir';

  @override
  String tooFarToBoost(int depth) {
    return 'Menzili daha fazla artırmak için ev sahibine çok uzak (ev sahibinden atlama sayısı: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arkadaş',
      one: '$count arkadaş',
    );
    return '$_temp0 için ses güçlendiriliyor';
  }

  @override
  String get boostSubtitleOff =>
      'Telefonunu Wi-Fi güçlendiriciye çevirir, böylece uzaktaki arkadaşlar bağlanabilir.';

  @override
  String get chargerTip =>
      'Mümkünse şarja tak: menzili artırmak ekstra pil harcar.';

  @override
  String get scanToConnectBooster =>
      'Güçlendirici üzerinden bağlanmak için tara 📲';

  @override
  String get reconnectSameNetwork => 'Aynı ağa yeniden bağlan';

  @override
  String get retry => 'Tekrar dene';

  @override
  String get switchLabel => 'Geç';

  @override
  String hostLabel(String name) {
    return '$name (ev sahibi 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (güçlendirici 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · senkron: $count';
  }

  @override
  String get tryAgain => 'Tekrar dene';

  @override
  String get back => 'Geri';

  @override
  String get cancel => 'İptal';

  @override
  String get copy => 'Kopyala';

  @override
  String get show => 'Göster';

  @override
  String get hide => 'Gizle';

  @override
  String copied(String label) {
    return '$label kopyalandı';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'Şifre';

  @override
  String get labelAddress => 'Adres';

  @override
  String get partyCode => 'Parti kodu';

  @override
  String get cameraQr => 'Kamera QR\'ı';

  @override
  String get settingUpNetwork => 'Parti ağı hazırlanıyor…';

  @override
  String get qrCameraHelp =>
      'Önce Wi-Fi\'ye katılmak için telefonunun Kamera uygulamasıyla tara, ardından Crowd Speaker\'ı açıp \"Zaten aynı Wi-Fi\'dayım\"a dokun.';

  @override
  String get qrAppHelp =>
      'Crowd Speaker ile tara → \"Sese katıl\". Wi-Fi\'ye bağlanır ve sesi tek dokunuşla otomatik senkronize eder!';

  @override
  String get noSpeakersYet =>
      'Henüz hoparlör yok. Katılmaları için gruptan QR kodunu taramalarını iste!';

  @override
  String youLabel(String name) {
    return '$name (sen 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'Güçlendirici 📡 · senkron: $count';
  }

  @override
  String bufferDetail(int ms) {
    return '$ms ms tampon';
  }

  @override
  String dropsDetail(String pct) {
    return '%$pct kayıp';
  }

  @override
  String get errMicNeeded => 'Mikrofon olmak için mikrofon erişimi gerekli.';

  @override
  String get errNearbyCreate =>
      'Uygulamanın ağ oluşturabilmesi için \"Yakındaki cihazlar\"a izin ver.';

  @override
  String get errNearbyShare =>
      'Uygulamanın ağ paylaşabilmesi için \"Yakındaki cihazlar\"a izin ver.';

  @override
  String errNetwork(String message) {
    return 'Ağ hatası: $message';
  }

  @override
  String get noticeHotspotOff =>
      'Hotspot\'un henüz açık değil. Aç, QR kod kendiliğinden güncellenecek.';

  @override
  String get noticeLostHost =>
      'Ev sahibiyle bağlantı koptu. Yeniden deneniyor veya aşağıdan başka bir ağ seç.';

  @override
  String noticeLostParent(String name) {
    return '$name ile bağlantı koptu. Yeniden deneniyor veya aşağıdan başka bir ağ seç.';
  }

  @override
  String get noticeRejectSyncing =>
      'Bir güçlendirici telefon bulundu ama hâlâ senkronize oluyor. Biraz sonra tekrar dene.';

  @override
  String get noticeRejectLoop =>
      'O telefon zaten senin üzerinden bağlı, bu yüzden kaynağın olamaz.';

  @override
  String noticeRejectOther(String reason) {
    return 'Bulunan bir telefon şunu söyledi: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'Bu koddaki Wi-Fi şifresi $length karakter, ancak Wi-Fi şifreleri 8-63 karakter olmalı. Ev sahibi muhtemelen yanlış yazdı: şifreyi yeniden girmesini iste veya Wi-Fi ayarlarından \"$ssid\" ağına katılıp \"Zaten aynı Wi-Fi\'dayım\"a dokun.';
  }

  @override
  String get errHostNotFound =>
      'Bu Wi-Fi\'da ev sahibi bulunamadı. Ev sahibinin canlı olduğunu ve doğru ağa katıldığını kontrol et.';

  @override
  String get errRelayNeedsAndroid =>
      'Paylaşım için Wi-Fi Direct destekli bir Android telefon gerekir.';

  @override
  String errTooDeep(int depth, int max) {
    return 'Bu telefon ev sahibine çok uzak (ev sahibinden atlama sayısı: $depth, en çok $max). Paylaşmak için ev sahibine daha yakın bir ağa katıl.';
  }

  @override
  String notifHosting(String name) {
    return '\"$name\" yönetiliyor';
  }

  @override
  String notifPlaying(String name) {
    return '\"$name\" çalıyor';
  }
}
