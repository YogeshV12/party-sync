// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get homeTagline =>
      'Ubah ponsel teman-temanmu menjadi satu sistem suara raksasa. 🔊 Satu ponsel memegang mikrofon, dan semua ponsel lain (plus speaker Bluetooth yang terhubung) memutar suara secara sinkron.';

  @override
  String get nameLabel => 'Nama atau nama panggilanmu';

  @override
  String get nameHelper => 'Yang dilihat teman-teman di layar mereka';

  @override
  String get homeVibeTitle => 'Mau ngapain?';

  @override
  String get hostCardTitle => 'Pegang Mikrofon 🎤';

  @override
  String get hostCardSubtitle =>
      'Jadi tuan rumah pesta. Apa pun yang kamu ucapkan atau streaming diputar langsung lewat speaker semua orang.';

  @override
  String get joinCardTitle => 'Gabung ke Suara 🔊';

  @override
  String get joinCardSubtitle =>
      'Pindai kode QR tuan rumah. Jadikan ponsel ini atau speaker Bluetooth-mu bagian dari pesta.';

  @override
  String get homeTipRelay =>
      'Tips: ponsel ini bisa memperluas jangkauan! Setelah terhubung, kamu bisa membagikan suara ke lebih banyak teman di dekatmu.';

  @override
  String get homeTipIos =>
      'iPhone bisa menjadi tuan rumah atau bergabung sebagai speaker. Untuk memperluas jangkauan ke teman yang lebih jauh, gunakan ponsel Android.';

  @override
  String get homeTipDefault =>
      'Siap jadi tuan rumah pesta atau gabung ke suara!';

  @override
  String get scanHostQr => 'Pindai QR Tuan Rumah';

  @override
  String get scanHostQrSubtitle =>
      'Sekali ketuk: terhubung ke Wi-Fi dan menyinkronkan suara secara otomatis';

  @override
  String get alreadyOnWifi => 'Saya sudah di Wi-Fi yang sama';

  @override
  String get connectManually => 'Hubungkan manual';

  @override
  String get wifiNameLabel => 'Nama Wi-Fi';

  @override
  String get wifiPasswordLabel => 'Kata sandi Wi-Fi';

  @override
  String get hostIpLabel => 'Alamat IP tuan rumah (opsional)';

  @override
  String get hostIpHelper => 'Ada di bawah kode QR tuan rumah';

  @override
  String get connectToParty => 'Hubungkan ke Pesta';

  @override
  String get enterWifiName => 'Masukkan nama Wi-Fi.';

  @override
  String get joinTipIos =>
      'Saat diminta, ketuk \"Gabung\" untuk terhubung. Biarkan Crowd Speaker tetap terbuka agar suara terus diputar!';

  @override
  String get joinTipAndroid =>
      'Saat diminta, ketuk untuk menerima koneksi Wi-Fi dan kamu langsung masuk ke pesta.';

  @override
  String get scannerNotACode =>
      'Bukan kode Crowd Speaker. Pindai QR di layar temanmu!';

  @override
  String get scannerHint => 'Arahkan kamera ke kode QR di layar temanmu.';

  @override
  String get hostSetupTitle => 'Jadi Tuan Rumah Pesta 🎤';

  @override
  String get partyNameLabel => 'Nama pesta';

  @override
  String get partyNameHelper => 'Yang dilihat teman saat bergabung';

  @override
  String partyNameDefault(String name) {
    return 'Pesta $name';
  }

  @override
  String get defaultPartyName => 'Pesta';

  @override
  String get connectQuestion => 'Bagaimana teman-teman terhubung?';

  @override
  String get instantNetworkTitle => 'Jaringan Pesta Instan';

  @override
  String get badgeEasiest => 'Termudah';

  @override
  String get instantNetworkSubtitle =>
      'Tanpa pengaturan. Langsung membuat jaringan lokal agar semua orang bisa masuk. (Tidak perlu internet).';

  @override
  String get usePersonalHotspot => 'Gunakan Hotspot Pribadi';

  @override
  String get useMyHotspot => 'Gunakan hotspot ponselku';

  @override
  String get hotspotSubtitle =>
      'Aktifkan hotspot ponselmu secara manual. Teman juga bisa memakai internet selulermu.';

  @override
  String get hotspotInfoIos =>
      'Aktifkan Hotspot Pribadi di Pengaturan (\"Izinkan Orang Lain Bergabung\"), lalu masukkan nama iPhone dan kata sandi hotspot di bawah agar teman bisa bergabung.';

  @override
  String get hotspotInfoAndroid =>
      'Aktifkan hotspot di Pengaturan, lalu masukkan nama dan kata sandi Wi-Fi di bawah agar teman bisa bergabung.';

  @override
  String get openHotspotSettings => 'Buka pengaturan hotspot';

  @override
  String get hotspotSettingsHint =>
      'Buka Pengaturan → Hotspot Pribadi dan aktifkan \"Izinkan Orang Lain Bergabung\".';

  @override
  String get hotspotWifiNameLabel => 'Nama Wi-Fi hotspot';

  @override
  String get hotspotPasswordLabel => 'Kata sandi hotspot';

  @override
  String get enterHotspotName =>
      'Masukkan nama hotspot agar teman bisa bergabung.';

  @override
  String get invalidWifiPassword =>
      'Kata sandi Wi-Fi harus 8–63 karakter. Periksa pengaturan hotspot dan coba lagi!';

  @override
  String get audioTuning => 'Penyetelan Audio';

  @override
  String get filterNoiseTitle => 'Saring bising latar';

  @override
  String get filterNoiseSubtitle =>
      'Menjaga suara tetap jernih. Matikan jika kamu memutar musik keras atau memakai perangkat DJ.';

  @override
  String get startParty => 'Mulai Pesta 🔥';

  @override
  String get onTheMic => 'Di Mikrofon 🎤';

  @override
  String get endParty => 'Akhiri Pesta';

  @override
  String get endPartyTitle => 'Akhiri pesta?';

  @override
  String get endPartyMessage =>
      'Ini akan memutus semua speaker dan menghentikan suara.';

  @override
  String get somethingWentWrong => 'Terjadi kesalahan.';

  @override
  String get firingUpParty => 'Menyalakan pesta…';

  @override
  String get creatingPartyNetwork => 'Membuat jaringan pestamu';

  @override
  String get scanToJoinSound => 'Pindai untuk gabung ke suara 📲';

  @override
  String get syncBufferTitle => 'Buffer sinkronisasi suara';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ponsel terhubung',
    );
    return 'Speaker teman-teman · $_temp0';
  }

  @override
  String get micMuted => 'Mikrofon Dibisukan 🤫';

  @override
  String get liveOnAir => 'Siaran Langsung 🎙️';

  @override
  String get tapToUnmute => 'Ketuk mikrofon untuk membunyikan kembali';

  @override
  String get waitingForSquad => 'Menunggu teman-teman memindai dan bergabung…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ponsel speaker',
    );
    return 'Streaming langsung ke $_temp0';
  }

  @override
  String get bufferDelayLabel => 'Jeda buffer sebelum suara diputar';

  @override
  String get syncBufferHelp =>
      'Geser ke atas jika audio tersendat atau putus. Speaker Bluetooth dan penguat sinyal butuh buffer sedikit lebih lama agar tetap sinkron sempurna.';

  @override
  String get speakerMode => 'Mode Speaker 🔊';

  @override
  String get leave => 'Keluar';

  @override
  String get leavePartyTitle => 'Keluar dari pesta?';

  @override
  String get leavePartyBoosterMessage =>
      'Teman yang terhubung lewat penguatmu juga akan terputus.';

  @override
  String get leavePartyMessage => 'Ponsel ini akan berhenti memutar suara.';

  @override
  String get leaveParty => 'Keluar dari Pesta';

  @override
  String get audioOutput => 'Keluaran audio';

  @override
  String get thisSpeaker => 'Speaker ini';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route memiliki jeda Bluetooth tinggi ($latency ms), lebih lama dari buffer sinkronisasi tuan rumah. Minta tuan rumah menaikkan \"Buffer sinkronisasi suara\" menjadi $needed ms atau lebih agar suaramu bisa diputar!';
  }

  @override
  String get echoFixTitle => 'Perbaikan gema (setel halus sinkron)';

  @override
  String get boostRangeTitle => 'Perluas jangkauan untuk teman 📡';

  @override
  String get partyWrappedUp => 'Pesta telah selesai 🎉';

  @override
  String get hostEndedParty => 'Tuan rumah mengakhiri pesta.';

  @override
  String partyEndedByHost(String name) {
    return '\"$name\" diakhiri oleh tuan rumah.';
  }

  @override
  String get backToHome => 'Kembali ke Beranda';

  @override
  String get joinAnotherParty => 'Gabung ke pesta lain';

  @override
  String get tuningIn => 'Menyetel…';

  @override
  String get warmingUpSpeakers => 'Memanaskan speaker';

  @override
  String connectingToWifi(String ssid) {
    return 'Menghubungkan ke $ssid…';
  }

  @override
  String get partyWifi => 'Wi-Fi pesta';

  @override
  String get tapAllowToConnect => 'Ketuk Izinkan pada pop-up untuk terhubung.';

  @override
  String get findingHost => 'Mencari tuan rumah…';

  @override
  String get searchingParty => 'Mencari pesta di Wi-Fi ini.';

  @override
  String get lockingIntoSync => 'Mengunci sinkronisasi…';

  @override
  String get aligningBeat => 'Menyelaraskan ketukan.';

  @override
  String get hostIsMuted => 'Tuan rumah dibisukan 🤫';

  @override
  String get hostMutedSubtitle =>
      'Terhubung! Suara akan kembali saat mikrofon dibunyikan.';

  @override
  String get bumpingInSync => 'Dentum Sinkron 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'Terhubung langsung ke $name';
  }

  @override
  String get hostFallback => 'tuan rumah';

  @override
  String syncedVia(String name, int depth) {
    return 'Tersinkron lewat $name (lompatan dari mikrofon: $depth)';
  }

  @override
  String get boosterFallback => 'penguat';

  @override
  String get reSyncing => 'Menyinkronkan ulang…';

  @override
  String get reconnectingStream => 'Menghubungkan ulang ke streaming';

  @override
  String get notConnectedYet => 'Belum terhubung';

  @override
  String get phoneSpeaker => 'Speaker ponsel';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'Jeda Bluetooth (+$ms ms) dinolkan otomatis.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'Jeda speaker (+$ms ms) dikalibrasi otomatis.';
  }

  @override
  String get syncTiming => 'Waktu sinkron';

  @override
  String get audioBuffer => 'Buffer audio';

  @override
  String get streamDrops => 'Putus streaming';

  @override
  String get autoAdjust => 'Penyesuaian otomatis';

  @override
  String get defaultSyncZero => 'Sinkron bawaan (offset nol)';

  @override
  String nudgedEarlier(int ms) {
    return 'Dimajukan $ms ms';
  }

  @override
  String nudgedLater(int ms) {
    return 'Dimundurkan $ms ms';
  }

  @override
  String get reset => 'Atur ulang';

  @override
  String get echoHelp =>
      'Mendengar gema? Jika speaker ini terdengar tertinggal dari yang lain, geser ke kanan. Jika terdengar lebih dulu, geser ke kiri. (Kebanyakan speaker sudah terdengar sempurna tanpa ini!)';

  @override
  String get relayUnsupportedIos =>
      'iPhone tidak bisa berbagi Wi-Fi saat mendengarkan. Minta teman berponsel Android mengaktifkan penguat sinyal!';

  @override
  String get relayUnsupportedAndroid =>
      'Ponsel ini tidak mendukung mode penguat Wi-Fi Direct.';

  @override
  String get boostSignalTitle => 'Perkuat sinyal untuk teman';

  @override
  String tooFarToBoost(int depth) {
    return 'Terlalu jauh dari tuan rumah untuk memperluas jangkauan lagi (lompatan dari tuan rumah: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count teman',
    );
    return 'Memperkuat suara untuk $_temp0';
  }

  @override
  String get boostSubtitleOff =>
      'Mengubah ponselmu menjadi penguat Wi-Fi agar teman yang lebih jauh bisa terhubung.';

  @override
  String get chargerTip =>
      'Colokkan ke pengisi daya jika bisa: memperluas jangkauan memakai baterai ekstra.';

  @override
  String get scanToConnectBooster => 'Pindai untuk terhubung lewat penguat 📲';

  @override
  String get reconnectSameNetwork => 'Hubungkan ulang ke jaringan yang sama';

  @override
  String get retry => 'Coba lagi';

  @override
  String get switchLabel => 'Pindah';

  @override
  String hostLabel(String name) {
    return '$name (tuan rumah 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (penguat 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · tersinkron: $count';
  }

  @override
  String get tryAgain => 'Coba lagi';

  @override
  String get back => 'Kembali';

  @override
  String get cancel => 'Batal';

  @override
  String get copy => 'Salin';

  @override
  String get show => 'Tampilkan';

  @override
  String get hide => 'Sembunyikan';

  @override
  String copied(String label) {
    return '$label disalin';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'Kata sandi';

  @override
  String get labelAddress => 'Alamat';

  @override
  String get partyCode => 'Kode pesta';

  @override
  String get cameraQr => 'QR kamera';

  @override
  String get settingUpNetwork => 'Menyiapkan jaringan pesta…';

  @override
  String get qrCameraHelp =>
      'Pindai dengan aplikasi Kamera di ponselmu untuk bergabung ke Wi-Fi lebih dulu, lalu buka Crowd Speaker dan ketuk \"Saya sudah di Wi-Fi yang sama\".';

  @override
  String get qrAppHelp =>
      'Pindai dengan Crowd Speaker → \"Gabung ke Suara\". Terhubung ke Wi-Fi dan menyinkronkan suara otomatis hanya dengan satu ketukan!';

  @override
  String get noSpeakersYet =>
      'Belum ada speaker. Minta teman-teman memindai kode QR-mu untuk ikut!';

  @override
  String youLabel(String name) {
    return '$name (kamu 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'Penguat 📡 · tersinkron: $count';
  }

  @override
  String bufferDetail(int ms) {
    return 'buffer $ms ms';
  }

  @override
  String dropsDetail(String pct) {
    return '$pct% putus';
  }

  @override
  String get errMicNeeded =>
      'Akses mikrofon diperlukan untuk menjadi mikrofon.';

  @override
  String get errNearbyCreate =>
      'Izinkan \"Perangkat di sekitar\" agar aplikasi dapat membuat jaringan.';

  @override
  String get errNearbyShare =>
      'Izinkan \"Perangkat di sekitar\" agar aplikasi dapat berbagi jaringan.';

  @override
  String errNetwork(String message) {
    return 'Kesalahan jaringan: $message';
  }

  @override
  String get noticeHotspotOff =>
      'Hotspot-mu belum aktif. Aktifkan, dan kode QR akan diperbarui sendiri.';

  @override
  String get noticeLostHost =>
      'Koneksi ke tuan rumah terputus. Mencoba lagi, atau pilih jaringan lain di bawah.';

  @override
  String noticeLostParent(String name) {
    return 'Koneksi ke $name terputus. Mencoba lagi, atau pilih jaringan lain di bawah.';
  }

  @override
  String get noticeRejectSyncing =>
      'Ditemukan ponsel penguat, tetapi masih menyinkronkan. Coba lagi sebentar lagi.';

  @override
  String get noticeRejectLoop =>
      'Ponsel itu sudah terhubung melalui kamu, jadi tidak bisa menjadi sumbermu.';

  @override
  String noticeRejectOther(String reason) {
    return 'Ponsel yang ditemukan berkata: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'Kata sandi Wi-Fi pada kode ini panjangnya $length karakter, padahal kata sandi Wi-Fi 8-63 karakter. Tuan rumah mungkin salah ketik: minta mereka memasukkan ulang, atau gabung ke \"$ssid\" di pengaturan Wi-Fi dan ketuk \"Saya sudah di Wi-Fi yang sama\".';
  }

  @override
  String get errHostNotFound =>
      'Tuan rumah tidak ditemukan di Wi-Fi ini. Pastikan tuan rumah sedang live dan kamu bergabung ke jaringan yang benar.';

  @override
  String get errRelayNeedsAndroid =>
      'Berbagi memerlukan ponsel Android dengan Wi-Fi Direct.';

  @override
  String errTooDeep(int depth, int max) {
    return 'Ponsel ini terlalu jauh dari tuan rumah (lompatan dari tuan rumah: $depth, maks $max). Gabung ke jaringan yang lebih dekat dengan tuan rumah untuk berbagi.';
  }

  @override
  String notifHosting(String name) {
    return 'Menjadi tuan rumah \"$name\"';
  }

  @override
  String notifPlaying(String name) {
    return 'Memutar \"$name\"';
  }
}
