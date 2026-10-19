// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get homeTagline =>
      'Mach aus den Handys deiner Clique eine riesige Soundanlage. 🔊 Ein Handy übernimmt das Mikro, und alle anderen (plus angeschlossene Bluetooth-Lautsprecher) spielen den Sound synchron ab.';

  @override
  String get nameLabel => 'Dein Name oder Spitzname';

  @override
  String get nameHelper => 'Das sieht die Clique auf ihrem Bildschirm';

  @override
  String get homeVibeTitle => 'Was steht an?';

  @override
  String get hostCardTitle => 'Mikro schnappen 🎤';

  @override
  String get hostCardSubtitle =>
      'Gastgeber sein. Alles, was du sagst oder streamst, läuft in Echtzeit über die Lautsprecher aller.';

  @override
  String get joinCardTitle => 'Dem Sound beitreten 🔊';

  @override
  String get joinCardSubtitle =>
      'Scanne den QR-Code des Gastgebers. Mach dieses Handy oder deinen Bluetooth-Lautsprecher zum Teil der Party.';

  @override
  String get homeTipRelay =>
      'Profi-Tipp: Dieses Handy kann die Reichweite erhöhen! Sobald du verbunden bist, kannst du den Sound mit noch mehr Freunden in der Nähe teilen.';

  @override
  String get homeTipIos =>
      'iPhones können als Lautsprecher hosten oder beitreten. Für mehr Reichweite zu weiter entfernten Freunden nimm ein Android-Handy.';

  @override
  String get homeTipDefault =>
      'Bereit, die Party zu starten oder dem Sound beizutreten!';

  @override
  String get scanHostQr => 'QR-Code des Gastgebers scannen';

  @override
  String get scanHostQrSubtitle =>
      'Verbinden mit einem Tipp: verbindet mit dem WLAN und synchronisiert den Sound automatisch';

  @override
  String get alreadyOnWifi => 'Ich bin schon im selben WLAN';

  @override
  String get connectManually => 'Manuell verbinden';

  @override
  String get wifiNameLabel => 'WLAN-Name';

  @override
  String get wifiPasswordLabel => 'WLAN-Passwort';

  @override
  String get hostIpLabel => 'IP-Adresse des Gastgebers (optional)';

  @override
  String get hostIpHelper => 'Steht unter dem QR-Code des Gastgebers';

  @override
  String get connectToParty => 'Mit Party verbinden';

  @override
  String get enterWifiName => 'Bitte gib den WLAN-Namen ein.';

  @override
  String get joinTipIos =>
      'Tippe bei der Aufforderung auf „Beitreten“, um dich zu verbinden. Lass Crowd Speaker geöffnet, damit der Sound weiterläuft!';

  @override
  String get joinTipAndroid =>
      'Tippe bei der Aufforderung, um die WLAN-Verbindung zu akzeptieren, und du bist direkt auf der Party.';

  @override
  String get scannerNotACode =>
      'Das ist kein Crowd-Speaker-Code. Scanne den QR-Code auf dem Bildschirm deines Freundes!';

  @override
  String get scannerHint =>
      'Richte die Kamera auf den QR-Code auf dem Bildschirm deines Freundes.';

  @override
  String get hostSetupTitle => 'Party hosten 🎤';

  @override
  String get partyNameLabel => 'Name der Party';

  @override
  String get partyNameHelper => 'Das sehen Freunde beim Beitreten';

  @override
  String partyNameDefault(String name) {
    return '${name}s Party';
  }

  @override
  String get defaultPartyName => 'Party';

  @override
  String get connectQuestion => 'Wie sollen sich Freunde verbinden?';

  @override
  String get instantNetworkTitle => 'Sofort-Partynetzwerk';

  @override
  String get badgeEasiest => 'Am einfachsten';

  @override
  String get instantNetworkSubtitle =>
      'Keine Einrichtung nötig. Erstellt sofort ein lokales Netzwerk, in das sich alle einklinken können. (Kein Internet nötig.)';

  @override
  String get usePersonalHotspot => 'Persönlichen Hotspot nutzen';

  @override
  String get useMyHotspot => 'Hotspot meines Handys nutzen';

  @override
  String get hotspotSubtitle =>
      'Schalte den Hotspot deines Handys manuell ein. Freunde können so auch dein mobiles Internet nutzen.';

  @override
  String get hotspotInfoIos =>
      'Schalte den Persönlichen Hotspot in den Einstellungen ein („Anderen das Beitreten erlauben“) und gib unten den Namen deines iPhones und das Hotspot-Passwort ein, damit Freunde beitreten können.';

  @override
  String get hotspotInfoAndroid =>
      'Schalte deinen Hotspot in den Einstellungen ein und gib unten WLAN-Name und Passwort ein, damit Freunde beitreten können.';

  @override
  String get openHotspotSettings => 'Hotspot-Einstellungen öffnen';

  @override
  String get hotspotSettingsHint =>
      'Öffne Einstellungen → Persönlicher Hotspot und aktiviere „Anderen das Beitreten erlauben“.';

  @override
  String get hotspotWifiNameLabel => 'WLAN-Name des Hotspots';

  @override
  String get hotspotPasswordLabel => 'Hotspot-Passwort';

  @override
  String get enterHotspotName =>
      'Gib den Namen deines Hotspots ein, damit Freunde beitreten können.';

  @override
  String get invalidWifiPassword =>
      'WLAN-Passwörter müssen 8–63 Zeichen lang sein. Prüfe deine Hotspot-Einstellungen und versuche es erneut!';

  @override
  String get audioTuning => 'Audio-Feintuning';

  @override
  String get filterNoiseTitle => 'Hintergrundgeräusche filtern';

  @override
  String get filterNoiseSubtitle =>
      'Hält Stimmen klar. Schalte es aus, wenn du Musik laut aufdrehst oder DJ-Equipment nutzt.';

  @override
  String get startParty => 'Party starten 🔥';

  @override
  String get onTheMic => 'Am Mikro 🎤';

  @override
  String get endParty => 'Party beenden';

  @override
  String get endPartyTitle => 'Party beenden?';

  @override
  String get endPartyMessage =>
      'Dadurch werden alle Lautsprecher getrennt und der Sound gestoppt.';

  @override
  String get somethingWentWrong => 'Etwas ist schiefgelaufen.';

  @override
  String get firingUpParty => 'Party wird gestartet…';

  @override
  String get creatingPartyNetwork => 'Dein Partynetzwerk wird erstellt';

  @override
  String get scanToJoinSound => 'Scannen, um dem Sound beizutreten 📲';

  @override
  String get syncBufferTitle => 'Sync-Puffer';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Handys verbunden',
      one: '$count Handy verbunden',
    );
    return 'Lautsprecher der Clique · $_temp0';
  }

  @override
  String get micMuted => 'Mikro stumm 🤫';

  @override
  String get liveOnAir => 'Live auf Sendung 🎙️';

  @override
  String get tapToUnmute =>
      'Tippe aufs Mikro, um die Stummschaltung aufzuheben';

  @override
  String get waitingForSquad =>
      'Warte darauf, dass die Clique scannt und beitritt…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Handy-Lautsprecher',
      one: '$count Handy-Lautsprecher',
    );
    return 'Live-Übertragung an $_temp0';
  }

  @override
  String get bufferDelayLabel => 'Pufferverzögerung vor der Wiedergabe';

  @override
  String get syncBufferHelp =>
      'Erhöhe den Wert, wenn der Ton ruckelt oder aussetzt. Bluetooth-Lautsprecher und Signalverstärker brauchen etwas mehr Puffer, um perfekt synchron zu bleiben.';

  @override
  String get speakerMode => 'Lautsprechermodus 🔊';

  @override
  String get leave => 'Verlassen';

  @override
  String get leavePartyTitle => 'Party verlassen?';

  @override
  String get leavePartyBoosterMessage =>
      'Freunde, die über deinen Verstärker verbunden sind, werden ebenfalls getrennt.';

  @override
  String get leavePartyMessage => 'Dieses Handy spielt keinen Sound mehr ab.';

  @override
  String get leaveParty => 'Party verlassen';

  @override
  String get audioOutput => 'Audioausgabe';

  @override
  String get thisSpeaker => 'Dieser Lautsprecher';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route hat eine hohe Bluetooth-Verzögerung ($latency ms), länger als der Sync-Puffer des Gastgebers. Bitte den Gastgeber, den „Sync-Puffer“ auf $needed ms oder mehr zu erhöhen, damit dein Sound abgespielt werden kann!';
  }

  @override
  String get echoFixTitle => 'Echo-Korrektur (Feinabstimmung)';

  @override
  String get boostRangeTitle => 'Reichweite für Freunde erhöhen 📡';

  @override
  String get partyWrappedUp => 'Die Party ist vorbei 🎉';

  @override
  String get hostEndedParty => 'Der Gastgeber hat die Party beendet.';

  @override
  String partyEndedByHost(String name) {
    return '„$name“ wurde vom Gastgeber beendet.';
  }

  @override
  String get backToHome => 'Zurück zum Start';

  @override
  String get joinAnotherParty => 'Anderer Party beitreten';

  @override
  String get tuningIn => 'Verbinde…';

  @override
  String get warmingUpSpeakers => 'Lautsprecher werden aufgewärmt';

  @override
  String connectingToWifi(String ssid) {
    return 'Verbinde mit $ssid…';
  }

  @override
  String get partyWifi => 'Party-WLAN';

  @override
  String get tapAllowToConnect =>
      'Tippe im Pop-up auf „Erlauben“, um dich zu verbinden.';

  @override
  String get findingHost => 'Gastgeber wird gesucht…';

  @override
  String get searchingParty => 'Suche die Party in diesem WLAN.';

  @override
  String get lockingIntoSync => 'Synchronisiere…';

  @override
  String get aligningBeat => 'Beat-Timing wird abgeglichen.';

  @override
  String get hostIsMuted => 'Gastgeber ist stummgeschaltet 🤫';

  @override
  String get hostMutedSubtitle =>
      'Verbunden! Der Sound kommt zurück, sobald das Mikro wieder aktiv ist.';

  @override
  String get bumpingInSync => 'Synchron am Pumpen 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'Direkt mit $name verbunden';
  }

  @override
  String get hostFallback => 'dem Gastgeber';

  @override
  String syncedVia(String name, int depth) {
    return 'Synchronisiert über $name (Sprünge vom Mikro: $depth)';
  }

  @override
  String get boosterFallback => 'dem Verstärker';

  @override
  String get reSyncing => 'Synchronisiere neu…';

  @override
  String get reconnectingStream => 'Verbinde erneut mit dem Stream';

  @override
  String get notConnectedYet => 'Noch nicht verbunden';

  @override
  String get phoneSpeaker => 'Handy-Lautsprecher';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'Bluetooth-Verzögerung (+$ms ms) automatisch ausgeglichen.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'Lautsprecher-Verzögerung (+$ms ms) automatisch kalibriert.';
  }

  @override
  String get syncTiming => 'Sync-Timing';

  @override
  String get audioBuffer => 'Audiopuffer';

  @override
  String get streamDrops => 'Stream-Aussetzer';

  @override
  String get autoAdjust => 'Automatische Korrektur';

  @override
  String get defaultSyncZero => 'Standard-Sync (kein Versatz)';

  @override
  String nudgedEarlier(int ms) {
    return '$ms ms früher';
  }

  @override
  String nudgedLater(int ms) {
    return '$ms ms später';
  }

  @override
  String get reset => 'Zurücksetzen';

  @override
  String get echoHelp =>
      'Hörst du ein Echo? Klingt dieser Lautsprecher hinter der Clique her, schiebe nach rechts. Klingt er voraus, schiebe nach links. (Die meisten Lautsprecher klingen auch ohne perfekt!)';

  @override
  String get relayUnsupportedIos =>
      'iPhones können beim Zuhören kein WLAN teilen. Bitte einen Freund mit Android, den Signalverstärker einzuschalten!';

  @override
  String get relayUnsupportedAndroid =>
      'Dieses Handy unterstützt den Wi-Fi-Direct-Verstärkermodus nicht.';

  @override
  String get boostSignalTitle => 'Signal für Freunde verstärken';

  @override
  String tooFarToBoost(int depth) {
    return 'Zu weit vom Gastgeber entfernt, um die Reichweite weiter zu erhöhen (Sprünge vom Gastgeber: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Freunde',
      one: '$count Freund',
    );
    return 'Verstärkt den Sound für $_temp0';
  }

  @override
  String get boostSubtitleOff =>
      'Macht dein Handy zum WLAN-Verstärker, damit sich weiter entfernte Freunde verbinden können.';

  @override
  String get chargerTip =>
      'Schließe nach Möglichkeit ein Ladegerät an: Reichweitenverstärkung verbraucht mehr Akku.';

  @override
  String get scanToConnectBooster =>
      'Scannen, um über den Verstärker zu verbinden 📲';

  @override
  String get reconnectSameNetwork => 'Mit demselben Netzwerk neu verbinden';

  @override
  String get retry => 'Wiederholen';

  @override
  String get switchLabel => 'Wechseln';

  @override
  String hostLabel(String name) {
    return '$name (Gastgeber 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (Verstärker 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · synchron: $count';
  }

  @override
  String get tryAgain => 'Erneut versuchen';

  @override
  String get back => 'Zurück';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get copy => 'Kopieren';

  @override
  String get show => 'Anzeigen';

  @override
  String get hide => 'Ausblenden';

  @override
  String copied(String label) {
    return '$label kopiert';
  }

  @override
  String get labelWifi => 'WLAN';

  @override
  String get labelPassword => 'Passwort';

  @override
  String get labelAddress => 'Adresse';

  @override
  String get partyCode => 'Party-Code';

  @override
  String get cameraQr => 'Kamera-QR';

  @override
  String get settingUpNetwork => 'Partynetzwerk wird eingerichtet…';

  @override
  String get qrCameraHelp =>
      'Scanne mit der Kamera-App deines Handys, um zuerst dem WLAN beizutreten. Öffne dann Crowd Speaker und tippe auf „Ich bin schon im selben WLAN“.';

  @override
  String get qrAppHelp =>
      'Scanne mit Crowd Speaker → „Dem Sound beitreten“. Verbindet mit dem WLAN und synchronisiert den Sound automatisch mit einem Tipp!';

  @override
  String get noSpeakersYet =>
      'Noch keine Lautsprecher. Lass die Clique deinen QR-Code scannen, um loszulegen!';

  @override
  String youLabel(String name) {
    return '$name (du 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'Verstärker 📡 · synchron: $count';
  }

  @override
  String bufferDetail(int ms) {
    return '$ms ms Puffer';
  }

  @override
  String dropsDetail(String pct) {
    return '$pct % Aussetzer';
  }

  @override
  String get errMicNeeded =>
      'Für die Mikro-Rolle wird Zugriff auf das Mikrofon benötigt.';

  @override
  String get errNearbyCreate =>
      'Erlaube „Geräte in der Nähe“, damit die App ein Netzwerk erstellen kann.';

  @override
  String get errNearbyShare =>
      'Erlaube „Geräte in der Nähe“, damit die App ein Netzwerk teilen kann.';

  @override
  String errNetwork(String message) {
    return 'Netzwerkfehler: $message';
  }

  @override
  String get noticeHotspotOff =>
      'Dein Hotspot ist noch nicht an. Schalte ihn ein, und der QR-Code aktualisiert sich von selbst.';

  @override
  String get noticeLostHost =>
      'Verbindung zum Gastgeber verloren. Neuer Versuch läuft, oder wähle unten ein anderes Netzwerk.';

  @override
  String noticeLostParent(String name) {
    return 'Verbindung zu $name verloren. Neuer Versuch läuft, oder wähle unten ein anderes Netzwerk.';
  }

  @override
  String get noticeRejectSyncing =>
      'Ein Verstärker-Handy wurde gefunden, synchronisiert aber noch. Versuche es gleich noch einmal.';

  @override
  String get noticeRejectLoop =>
      'Dieses Handy ist bereits über dich verbunden und kann daher nicht deine Quelle sein.';

  @override
  String noticeRejectOther(String reason) {
    return 'Ein gefundenes Handy meldete: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'Das WLAN-Passwort in diesem Code hat $length Zeichen, WLAN-Passwörter haben aber 8–63. Der Gastgeber hat sich wohl vertippt: Bitte ihn, es neu einzugeben, oder tritt „$ssid“ in deinen WLAN-Einstellungen bei und tippe auf „Ich bin schon im selben WLAN“.';
  }

  @override
  String get errHostNotFound =>
      'Der Gastgeber wurde in diesem WLAN nicht gefunden. Prüfe, ob der Gastgeber live ist und du das richtige Netzwerk gewählt hast.';

  @override
  String get errRelayNeedsAndroid =>
      'Zum Teilen wird ein Android-Handy mit Wi-Fi Direct benötigt.';

  @override
  String errTooDeep(int depth, int max) {
    return 'Dieses Handy ist zu weit vom Gastgeber entfernt (Sprünge vom Gastgeber: $depth, max. $max). Tritt einem Netzwerk näher am Gastgeber bei, um zu teilen.';
  }

  @override
  String notifHosting(String name) {
    return 'Hostet „$name“';
  }

  @override
  String notifPlaying(String name) {
    return 'Spielt „$name“';
  }
}
