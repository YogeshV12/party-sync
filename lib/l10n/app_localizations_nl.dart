// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get homeTagline =>
      'Maak van de telefoons van je vriendengroep één enorme geluidsinstallatie. 🔊 Eén telefoon pakt de microfoon en alle andere (plus aangesloten Bluetooth-speakers) spelen het geluid synchroon af.';

  @override
  String get nameLabel => 'Je naam of bijnaam';

  @override
  String get nameHelper => 'Wat de groep op het scherm ziet';

  @override
  String get homeVibeTitle => 'Wat is de vibe?';

  @override
  String get hostCardTitle => 'Pak de microfoon 🎤';

  @override
  String get hostCardSubtitle =>
      'Host het feest. Alles wat je zegt of streamt, speelt realtime af via ieders speakers.';

  @override
  String get joinCardTitle => 'Doe mee met het geluid 🔊';

  @override
  String get joinCardSubtitle =>
      'Scan de QR-code van de host. Maak van deze telefoon of je Bluetooth-speaker een deel van het feest.';

  @override
  String get homeTipRelay =>
      'Tip: deze telefoon kan het bereik vergroten! Zodra je verbonden bent, kun je het geluid delen met nog meer vrienden in de buurt.';

  @override
  String get homeTipIos =>
      'iPhones kunnen hosten of meedoen als speaker. Gebruik een Android-telefoon om het bereik naar vrienden verder weg te vergroten.';

  @override
  String get homeTipDefault =>
      'Klaar om het feest te hosten of mee te doen met het geluid!';

  @override
  String get scanHostQr => 'Scan QR-code van host';

  @override
  String get scanHostQrSubtitle =>
      'Verbinden met één tik: maakt verbinding met wifi en synchroniseert het geluid automatisch';

  @override
  String get alreadyOnWifi => 'Ik zit al op hetzelfde wifi-netwerk';

  @override
  String get connectManually => 'Handmatig verbinden';

  @override
  String get wifiNameLabel => 'Wifi-naam';

  @override
  String get wifiPasswordLabel => 'Wifi-wachtwoord';

  @override
  String get hostIpLabel => 'IP-adres van host (optioneel)';

  @override
  String get hostIpHelper => 'Te vinden onder de QR-code van de host';

  @override
  String get connectToParty => 'Verbinden met feest';

  @override
  String get enterWifiName => 'Voer de wifi-naam in.';

  @override
  String get joinTipIos =>
      'Tik op \"Deelnemen\" wanneer erom gevraagd wordt. Laat Crowd Speaker geopend, zodat het geluid blijft spelen!';

  @override
  String get joinTipAndroid =>
      'Tik wanneer erom gevraagd wordt om de wifi-verbinding te accepteren en je zit meteen in het feest.';

  @override
  String get scannerNotACode =>
      'Dit is geen Crowd Speaker-code. Scan de QR-code op het scherm van je vriend!';

  @override
  String get scannerHint =>
      'Richt je camera op de QR-code op het scherm van je vriend.';

  @override
  String get hostSetupTitle => 'Host het feest 🎤';

  @override
  String get partyNameLabel => 'Naam van het feest';

  @override
  String get partyNameHelper => 'Wat vrienden zien als ze meedoen';

  @override
  String partyNameDefault(String name) {
    return 'Het feest van $name';
  }

  @override
  String get defaultPartyName => 'Feest';

  @override
  String get connectQuestion => 'Hoe moeten vrienden verbinden?';

  @override
  String get instantNetworkTitle => 'Direct feestnetwerk';

  @override
  String get badgeEasiest => 'Makkelijkst';

  @override
  String get instantNetworkSubtitle =>
      'Geen setup nodig. Maakt meteen een lokaal netwerk waar iedereen op kan aansluiten. (Geen internet nodig.)';

  @override
  String get usePersonalHotspot => 'Persoonlijke hotspot gebruiken';

  @override
  String get useMyHotspot => 'Hotspot van mijn telefoon gebruiken';

  @override
  String get hotspotSubtitle =>
      'Zet de hotspot van je telefoon handmatig aan. Vrienden kunnen dan ook je mobiele internet gebruiken.';

  @override
  String get hotspotInfoIos =>
      'Zet Persoonlijke hotspot aan in Instellingen (\"Anderen toestaan lid te worden\") en voer hieronder de naam van je iPhone en het hotspot-wachtwoord in, zodat vrienden kunnen meedoen.';

  @override
  String get hotspotInfoAndroid =>
      'Zet je hotspot aan in Instellingen en voer hieronder je wifi-naam en wachtwoord in, zodat vrienden kunnen meedoen.';

  @override
  String get openHotspotSettings => 'Hotspot-instellingen openen';

  @override
  String get hotspotSettingsHint =>
      'Open Instellingen → Persoonlijke hotspot en zet \"Anderen toestaan lid te worden\" aan.';

  @override
  String get hotspotWifiNameLabel => 'Wifi-naam van hotspot';

  @override
  String get hotspotPasswordLabel => 'Hotspot-wachtwoord';

  @override
  String get enterHotspotName =>
      'Voer de naam van je hotspot in, zodat vrienden kunnen meedoen.';

  @override
  String get invalidWifiPassword =>
      'Wifi-wachtwoorden moeten 8–63 tekens lang zijn. Controleer je hotspot-instellingen en probeer het opnieuw!';

  @override
  String get audioTuning => 'Audio-afstelling';

  @override
  String get filterNoiseTitle => 'Achtergrondgeluid filteren';

  @override
  String get filterNoiseSubtitle =>
      'Houdt stemmen helder. Zet uit als je harde muziek draait of dj-apparatuur gebruikt.';

  @override
  String get startParty => 'Start het feest 🔥';

  @override
  String get onTheMic => 'Aan de microfoon 🎤';

  @override
  String get endParty => 'Feest beëindigen';

  @override
  String get endPartyTitle => 'Feest beëindigen?';

  @override
  String get endPartyMessage =>
      'Hiermee worden alle speakers losgekoppeld en stopt het geluid.';

  @override
  String get somethingWentWrong => 'Er is iets misgegaan.';

  @override
  String get firingUpParty => 'Het feest wordt opgestart…';

  @override
  String get creatingPartyNetwork => 'Je feestnetwerk wordt gemaakt';

  @override
  String get scanToJoinSound => 'Scan om mee te doen 📲';

  @override
  String get syncBufferTitle => 'Synchronisatiebuffer';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count telefoons verbonden',
      one: '$count telefoon verbonden',
    );
    return 'Speakers van de groep · $_temp0';
  }

  @override
  String get micMuted => 'Microfoon gedempt 🤫';

  @override
  String get liveOnAir => 'Live in de lucht 🎙️';

  @override
  String get tapToUnmute =>
      'Tik op de microfoon om het geluid weer aan te zetten';

  @override
  String get waitingForSquad => 'Wachten tot de groep scant en meedoet…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count telefoonspeakers',
      one: '$count telefoonspeaker',
    );
    return 'Live streamen naar $_temp0';
  }

  @override
  String get bufferDelayLabel => 'Bufferduur voordat het geluid speelt';

  @override
  String get syncBufferHelp =>
      'Schuif omhoog als het geluid hapert of wegvalt. Bluetooth-speakers en signaalversterkers hebben wat meer buffer nodig om perfect synchroon te blijven.';

  @override
  String get speakerMode => 'Speakermodus 🔊';

  @override
  String get leave => 'Verlaten';

  @override
  String get leavePartyTitle => 'Feest verlaten?';

  @override
  String get leavePartyBoosterMessage =>
      'Vrienden die via jouw versterker verbonden zijn, worden ook losgekoppeld.';

  @override
  String get leavePartyMessage => 'Deze telefoon stopt met geluid afspelen.';

  @override
  String get leaveParty => 'Feest verlaten';

  @override
  String get audioOutput => 'Audio-uitvoer';

  @override
  String get thisSpeaker => 'Deze speaker';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route heeft veel Bluetooth-vertraging ($latency ms), meer dan de synchronisatiebuffer van de host. Vraag de host om de \"Synchronisatiebuffer\" te verhogen naar $needed ms of meer, zodat jouw geluid kan spelen!';
  }

  @override
  String get echoFixTitle => 'Echocorrectie (fijnafstelling)';

  @override
  String get boostRangeTitle => 'Vergroot het bereik voor vrienden 📡';

  @override
  String get partyWrappedUp => 'Het feest is afgelopen 🎉';

  @override
  String get hostEndedParty => 'De host heeft het feest beëindigd.';

  @override
  String partyEndedByHost(String name) {
    return '\"$name\" is beëindigd door de host.';
  }

  @override
  String get backToHome => 'Terug naar start';

  @override
  String get joinAnotherParty => 'Meedoen aan een ander feest';

  @override
  String get tuningIn => 'Afstemmen…';

  @override
  String get warmingUpSpeakers => 'De speakers warmen op';

  @override
  String connectingToWifi(String ssid) {
    return 'Verbinden met $ssid…';
  }

  @override
  String get partyWifi => 'feest-wifi';

  @override
  String get tapAllowToConnect =>
      'Tik op Sta toe in de pop-up om te verbinden.';

  @override
  String get findingHost => 'De host zoeken…';

  @override
  String get searchingParty => 'Zoeken naar het feest op dit wifi-netwerk.';

  @override
  String get lockingIntoSync => 'Synchroniseren…';

  @override
  String get aligningBeat => 'De beat wordt uitgelijnd.';

  @override
  String get hostIsMuted => 'Host is gedempt 🤫';

  @override
  String get hostMutedSubtitle =>
      'Verbonden! Het geluid komt terug zodra de host het dempen opheft.';

  @override
  String get bumpingInSync => 'Synchroon aan het knallen 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'Direct verbonden met $name';
  }

  @override
  String get hostFallback => 'de host';

  @override
  String syncedVia(String name, int depth) {
    return 'Gesynchroniseerd via $name (hops vanaf microfoon: $depth)';
  }

  @override
  String get boosterFallback => 'de versterker';

  @override
  String get reSyncing => 'Opnieuw synchroniseren…';

  @override
  String get reconnectingStream => 'Opnieuw verbinden met de stream';

  @override
  String get notConnectedYet => 'Nog niet verbonden';

  @override
  String get phoneSpeaker => 'Telefoonspeaker';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'Bluetooth-vertraging (+$ms ms) automatisch gecompenseerd.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'Speakervertraging (+$ms ms) automatisch gekalibreerd.';
  }

  @override
  String get syncTiming => 'Synchronisatietiming';

  @override
  String get audioBuffer => 'Audiobuffer';

  @override
  String get streamDrops => 'Stream-uitval';

  @override
  String get autoAdjust => 'Automatisch bijstellen';

  @override
  String get defaultSyncZero => 'Standaard synchronisatie (geen verschuiving)';

  @override
  String nudgedEarlier(int ms) {
    return '$ms ms eerder';
  }

  @override
  String nudgedLater(int ms) {
    return '$ms ms later';
  }

  @override
  String get reset => 'Resetten';

  @override
  String get echoHelp =>
      'Hoor je een echo? Klinkt deze speaker achter op de groep, schuif dan naar rechts. Klinkt hij voor, schuif dan naar links. (De meeste speakers klinken al perfect zonder dit!)';

  @override
  String get relayUnsupportedIos =>
      'iPhones kunnen geen wifi delen tijdens het luisteren. Vraag een vriend met Android om de signaalversterker aan te zetten!';

  @override
  String get relayUnsupportedAndroid =>
      'Deze telefoon ondersteunt de Wi-Fi Direct-versterkermodus niet.';

  @override
  String get boostSignalTitle => 'Signaal versterken voor vrienden';

  @override
  String tooFarToBoost(int depth) {
    return 'Te ver van de host om het bereik verder te vergroten (hops vanaf host: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vrienden',
      one: '$count vriend',
    );
    return 'Geluid versterken voor $_temp0';
  }

  @override
  String get boostSubtitleOff =>
      'Maakt van je telefoon een wifi-versterker, zodat vrienden die verder weg zijn kunnen verbinden.';

  @override
  String get chargerTip =>
      'Sluit indien mogelijk een oplader aan: bereik vergroten kost extra batterij.';

  @override
  String get scanToConnectBooster =>
      'Scan om via de versterker te verbinden 📲';

  @override
  String get reconnectSameNetwork => 'Opnieuw verbinden met hetzelfde netwerk';

  @override
  String get retry => 'Opnieuw';

  @override
  String get switchLabel => 'Wisselen';

  @override
  String hostLabel(String name) {
    return '$name (host 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (versterker 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · synchroon: $count';
  }

  @override
  String get tryAgain => 'Opnieuw proberen';

  @override
  String get back => 'Terug';

  @override
  String get cancel => 'Annuleren';

  @override
  String get copy => 'Kopiëren';

  @override
  String get show => 'Tonen';

  @override
  String get hide => 'Verbergen';

  @override
  String copied(String label) {
    return '$label gekopieerd';
  }

  @override
  String get labelWifi => 'Wifi';

  @override
  String get labelPassword => 'Wachtwoord';

  @override
  String get labelAddress => 'Adres';

  @override
  String get partyCode => 'Feestcode';

  @override
  String get cameraQr => 'Camera-QR';

  @override
  String get settingUpNetwork => 'Feestnetwerk wordt ingesteld…';

  @override
  String get qrCameraHelp =>
      'Scan met de Camera-app van je telefoon om eerst verbinding te maken met de wifi. Open daarna Crowd Speaker en tik op \"Ik zit al op hetzelfde wifi-netwerk\".';

  @override
  String get qrAppHelp =>
      'Scan met Crowd Speaker → \"Doe mee met het geluid\". Maakt verbinding met wifi en synchroniseert het geluid automatisch met één tik!';

  @override
  String get noSpeakersYet =>
      'Nog geen speakers. Laat de groep je QR-code scannen om aan te sluiten!';

  @override
  String youLabel(String name) {
    return '$name (jij 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'Versterker 📡 · synchroon: $count';
  }

  @override
  String bufferDetail(int ms) {
    return '$ms ms buffer';
  }

  @override
  String dropsDetail(String pct) {
    return '$pct% uitval';
  }

  @override
  String get errMicNeeded =>
      'Toegang tot de microfoon is nodig om de microfoon te zijn.';

  @override
  String get errNearbyCreate =>
      'Sta \"Apparaten in de buurt\" toe, zodat de app een netwerk kan maken.';

  @override
  String get errNearbyShare =>
      'Sta \"Apparaten in de buurt\" toe, zodat de app een netwerk kan delen.';

  @override
  String errNetwork(String message) {
    return 'Netwerkfout: $message';
  }

  @override
  String get noticeHotspotOff =>
      'Je hotspot staat nog niet aan. Zet hem aan en de QR-code wordt vanzelf bijgewerkt.';

  @override
  String get noticeLostHost =>
      'Verbinding met de host verloren. Opnieuw proberen, of kies hieronder een ander netwerk.';

  @override
  String noticeLostParent(String name) {
    return 'Verbinding met $name verloren. Opnieuw proberen, of kies hieronder een ander netwerk.';
  }

  @override
  String get noticeRejectSyncing =>
      'Een versterkertelefoon gevonden, maar die is nog aan het synchroniseren. Probeer het zo opnieuw.';

  @override
  String get noticeRejectLoop =>
      'Die telefoon is al via jou verbonden en kan dus niet je bron zijn.';

  @override
  String noticeRejectOther(String reason) {
    return 'Een gevonden telefoon meldde: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'Het wifi-wachtwoord in deze code is $length tekens lang, maar wifi-wachtwoorden zijn 8-63 tekens. De host heeft het waarschijnlijk verkeerd getypt: vraag om het opnieuw in te voeren, of maak verbinding met \"$ssid\" in je wifi-instellingen en tik op \"Ik zit al op hetzelfde wifi-netwerk\".';
  }

  @override
  String get errHostNotFound =>
      'Kon de host niet vinden op dit wifi-netwerk. Controleer of de host live is en of je het juiste netwerk hebt gekozen.';

  @override
  String get errRelayNeedsAndroid =>
      'Delen vereist een Android-telefoon met Wi-Fi Direct.';

  @override
  String errTooDeep(int depth, int max) {
    return 'Deze telefoon is te ver van de host (hops vanaf host: $depth, max $max). Sluit aan op een netwerk dichter bij de host om te delen.';
  }

  @override
  String notifHosting(String name) {
    return '\"$name\" hosten';
  }

  @override
  String notifPlaying(String name) {
    return '\"$name\" afspelen';
  }
}
