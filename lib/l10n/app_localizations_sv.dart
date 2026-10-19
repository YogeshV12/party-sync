// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get homeTagline =>
      'Förvandla kompisgängets mobiler till ett enda stort ljudsystem. 🔊 En mobil tar mikrofonen, och alla andra (plus anslutna Bluetooth-högtalare) spelar upp ljudet i synk.';

  @override
  String get nameLabel => 'Ditt namn eller smeknamn';

  @override
  String get nameHelper => 'Det som gänget ser på sin skärm';

  @override
  String get homeVibeTitle => 'Vad blir det?';

  @override
  String get hostCardTitle => 'Ta mikrofonen 🎤';

  @override
  String get hostCardSubtitle =>
      'Var värd för festen. Allt du säger eller strömmar spelas upp i realtid i allas högtalare.';

  @override
  String get joinCardTitle => 'Häng med i ljudet 🔊';

  @override
  String get joinCardSubtitle =>
      'Skanna värdens QR-kod. Gör den här mobilen eller din Bluetooth-högtalare till en del av festen.';

  @override
  String get homeTipRelay =>
      'Tips: den här mobilen kan öka räckvidden! När du är ansluten kan du dela ljudet med ännu fler vänner i närheten.';

  @override
  String get homeTipIos =>
      'iPhone kan vara värd eller ansluta som högtalare. För att öka räckvidden till vänner längre bort, använd en Android-mobil.';

  @override
  String get homeTipDefault =>
      'Redo att vara värd för festen eller hänga med i ljudet!';

  @override
  String get scanHostQr => 'Skanna värdens QR-kod';

  @override
  String get scanHostQrSubtitle =>
      'Anslut med ett tryck: kopplar upp mot wifi och synkar ljudet automatiskt';

  @override
  String get alreadyOnWifi => 'Jag är redan på samma wifi';

  @override
  String get connectManually => 'Anslut manuellt';

  @override
  String get wifiNameLabel => 'Wifi-namn';

  @override
  String get wifiPasswordLabel => 'Wifi-lösenord';

  @override
  String get hostIpLabel => 'Värdens IP-adress (valfritt)';

  @override
  String get hostIpHelper => 'Finns under värdens QR-kod';

  @override
  String get connectToParty => 'Anslut till festen';

  @override
  String get enterWifiName => 'Ange wifi-namnet.';

  @override
  String get joinTipIos =>
      'Tryck på \"Anslut\" när du blir ombedd. Låt Crowd Speaker vara öppen så att ljudet fortsätter spela!';

  @override
  String get joinTipAndroid =>
      'Tryck för att godkänna wifi-anslutningen när du blir ombedd, så är du direkt med på festen.';

  @override
  String get scannerNotACode =>
      'Det här är inte en Crowd Speaker-kod. Skanna QR-koden på din väns skärm!';

  @override
  String get scannerHint => 'Rikta kameran mot QR-koden på din väns skärm.';

  @override
  String get hostSetupTitle => 'Var värd för festen 🎤';

  @override
  String get partyNameLabel => 'Festens namn';

  @override
  String get partyNameHelper => 'Det som vännerna ser när de ansluter';

  @override
  String partyNameDefault(String name) {
    return '${name}s fest';
  }

  @override
  String get defaultPartyName => 'Fest';

  @override
  String get connectQuestion => 'Hur ska vännerna ansluta?';

  @override
  String get instantNetworkTitle => 'Direkt festnätverk';

  @override
  String get badgeEasiest => 'Enklast';

  @override
  String get instantNetworkSubtitle =>
      'Ingen inställning krävs. Skapar direkt ett lokalt nätverk som alla kan ansluta till. (Inget internet behövs.)';

  @override
  String get usePersonalHotspot => 'Använd Internetdelning';

  @override
  String get useMyHotspot => 'Använd min mobils hotspot';

  @override
  String get hotspotSubtitle =>
      'Slå på mobilens hotspot manuellt. Låter också vänner dela ditt mobila internet.';

  @override
  String get hotspotInfoIos =>
      'Slå på Internetdelning i Inställningar (\"Tillåt andra att ansluta\") och ange sedan din iPhones namn och hotspot-lösenordet nedan så att vännerna kan ansluta.';

  @override
  String get hotspotInfoAndroid =>
      'Slå på hotspot i Inställningar och ange sedan ditt wifi-namn och lösenord nedan så att vännerna kan ansluta.';

  @override
  String get openHotspotSettings => 'Öppna hotspot-inställningar';

  @override
  String get hotspotSettingsHint =>
      'Öppna Inställningar → Internetdelning och slå på \"Tillåt andra att ansluta\".';

  @override
  String get hotspotWifiNameLabel => 'Hotspotens wifi-namn';

  @override
  String get hotspotPasswordLabel => 'Hotspot-lösenord';

  @override
  String get enterHotspotName =>
      'Ange hotspotens namn så att vännerna kan ansluta.';

  @override
  String get invalidWifiPassword =>
      'Wifi-lösenord måste vara 8–63 tecken. Kontrollera hotspot-inställningarna och försök igen!';

  @override
  String get audioTuning => 'Ljudinställningar';

  @override
  String get filterNoiseTitle => 'Filtrera bakgrundsljud';

  @override
  String get filterNoiseSubtitle =>
      'Håller rösterna klara. Stäng av om du spelar hög musik eller använder DJ-utrustning.';

  @override
  String get startParty => 'Starta festen 🔥';

  @override
  String get onTheMic => 'På mikrofonen 🎤';

  @override
  String get endParty => 'Avsluta festen';

  @override
  String get endPartyTitle => 'Avsluta festen?';

  @override
  String get endPartyMessage =>
      'Då kopplas alla högtalare bort och ljudet slutar spelas.';

  @override
  String get somethingWentWrong => 'Något gick fel.';

  @override
  String get firingUpParty => 'Festen startas…';

  @override
  String get creatingPartyNetwork => 'Skapar ditt festnätverk';

  @override
  String get scanToJoinSound => 'Skanna för att hänga med 📲';

  @override
  String get syncBufferTitle => 'Synkbuffert';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mobiler anslutna',
      one: '$count mobil ansluten',
    );
    return 'Gängets högtalare · $_temp0';
  }

  @override
  String get micMuted => 'Mikrofonen är avstängd 🤫';

  @override
  String get liveOnAir => 'Live i sändning 🎙️';

  @override
  String get tapToUnmute => 'Tryck på mikrofonen för att slå på ljudet igen';

  @override
  String get waitingForSquad => 'Väntar på att gänget ska skanna och ansluta…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mobilhögtalare',
      one: '$count mobilhögtalare',
    );
    return 'Strömmar live till $_temp0';
  }

  @override
  String get bufferDelayLabel => 'Buffertfördröjning innan ljudet spelas';

  @override
  String get syncBufferHelp =>
      'Skjut uppåt om ljudet hackar eller försvinner. Bluetooth-högtalare och signalförstärkare behöver lite mer buffert för att hålla perfekt synk.';

  @override
  String get speakerMode => 'Högtalarläge 🔊';

  @override
  String get leave => 'Lämna';

  @override
  String get leavePartyTitle => 'Lämna festen?';

  @override
  String get leavePartyBoosterMessage =>
      'Vänner som är anslutna via din förstärkare kopplas också bort.';

  @override
  String get leavePartyMessage => 'Den här mobilen slutar spela upp ljud.';

  @override
  String get leaveParty => 'Lämna festen';

  @override
  String get audioOutput => 'Ljudutgång';

  @override
  String get thisSpeaker => 'Den här högtalaren';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route har hög Bluetooth-fördröjning ($latency ms), längre än värdens synkbuffert. Be värden höja \"Synkbuffert\" till $needed ms eller mer så att ditt ljud kan spelas!';
  }

  @override
  String get echoFixTitle => 'Ekokorrigering (finjustera synk)';

  @override
  String get boostRangeTitle => 'Öka räckvidden för vänner 📡';

  @override
  String get partyWrappedUp => 'Festen är slut 🎉';

  @override
  String get hostEndedParty => 'Värden avslutade festen.';

  @override
  String partyEndedByHost(String name) {
    return '\"$name\" avslutades av värden.';
  }

  @override
  String get backToHome => 'Tillbaka till start';

  @override
  String get joinAnotherParty => 'Gå med i en annan fest';

  @override
  String get tuningIn => 'Ställer in…';

  @override
  String get warmingUpSpeakers => 'Värmer upp högtalarna';

  @override
  String connectingToWifi(String ssid) {
    return 'Ansluter till $ssid…';
  }

  @override
  String get partyWifi => 'festens wifi';

  @override
  String get tapAllowToConnect =>
      'Tryck på Tillåt i dialogrutan för att ansluta.';

  @override
  String get findingHost => 'Letar efter värden…';

  @override
  String get searchingParty => 'Söker efter festen på det här wifi-nätverket.';

  @override
  String get lockingIntoSync => 'Synkar…';

  @override
  String get aligningBeat => 'Justerar taktens timing.';

  @override
  String get hostIsMuted => 'Värden är avstängd 🤫';

  @override
  String get hostMutedSubtitle =>
      'Ansluten! Ljudet kommer tillbaka när värden slår på mikrofonen.';

  @override
  String get bumpingInSync => 'Pumpar i synk 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'Direktansluten till $name';
  }

  @override
  String get hostFallback => 'värden';

  @override
  String syncedVia(String name, int depth) {
    return 'Synkad via $name (hopp från mikrofonen: $depth)';
  }

  @override
  String get boosterFallback => 'förstärkaren';

  @override
  String get reSyncing => 'Synkar om…';

  @override
  String get reconnectingStream => 'Återansluter till strömmen';

  @override
  String get notConnectedYet => 'Inte ansluten än';

  @override
  String get phoneSpeaker => 'Mobilhögtalare';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'Bluetooth-fördröjning (+$ms ms) nollställs automatiskt.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'Högtalarfördröjning (+$ms ms) kalibreras automatiskt.';
  }

  @override
  String get syncTiming => 'Synktiming';

  @override
  String get audioBuffer => 'Ljudbuffert';

  @override
  String get streamDrops => 'Strömavbrott';

  @override
  String get autoAdjust => 'Autojustering';

  @override
  String get defaultSyncZero => 'Standardsynk (ingen förskjutning)';

  @override
  String nudgedEarlier(int ms) {
    return 'Flyttad $ms ms tidigare';
  }

  @override
  String nudgedLater(int ms) {
    return 'Flyttad $ms ms senare';
  }

  @override
  String get reset => 'Återställ';

  @override
  String get echoHelp =>
      'Hör du eko? Om den här högtalaren låter efter gänget, skjut åt höger. Om den låter före, skjut åt vänster. (De flesta högtalare låter redan perfekt utan detta!)';

  @override
  String get relayUnsupportedIos =>
      'iPhone kan inte dela wifi medan den lyssnar. Be en vän med Android slå på signalförstärkaren!';

  @override
  String get relayUnsupportedAndroid =>
      'Den här mobilen stöder inte förstärkarläge med Wi-Fi Direct.';

  @override
  String get boostSignalTitle => 'Förstärk signalen för vänner';

  @override
  String tooFarToBoost(int depth) {
    return 'För långt från värden för att öka räckvidden mer (hopp från värden: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vänner',
      one: '$count vän',
    );
    return 'Förstärker ljudet för $_temp0';
  }

  @override
  String get boostSubtitleOff =>
      'Gör din mobil till en wifi-förstärkare så att vänner längre bort kan ansluta.';

  @override
  String get chargerTip =>
      'Sätt i en laddare om det går: att öka räckvidden drar extra batteri.';

  @override
  String get scanToConnectBooster =>
      'Skanna för att ansluta via förstärkaren 📲';

  @override
  String get reconnectSameNetwork => 'Återanslut till samma nätverk';

  @override
  String get retry => 'Försök igen';

  @override
  String get switchLabel => 'Byt';

  @override
  String hostLabel(String name) {
    return '$name (värd 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (förstärkare 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · i synk: $count';
  }

  @override
  String get tryAgain => 'Försök igen';

  @override
  String get back => 'Tillbaka';

  @override
  String get cancel => 'Avbryt';

  @override
  String get copy => 'Kopiera';

  @override
  String get show => 'Visa';

  @override
  String get hide => 'Dölj';

  @override
  String copied(String label) {
    return '$label kopierad';
  }

  @override
  String get labelWifi => 'Wifi';

  @override
  String get labelPassword => 'Lösenord';

  @override
  String get labelAddress => 'Adress';

  @override
  String get partyCode => 'Festkod';

  @override
  String get cameraQr => 'Kamera-QR';

  @override
  String get settingUpNetwork => 'Ställer in festnätverket…';

  @override
  String get qrCameraHelp =>
      'Skanna med mobilens kameraapp för att först ansluta till wifi, öppna sedan Crowd Speaker och tryck på \"Jag är redan på samma wifi\".';

  @override
  String get qrAppHelp =>
      'Skanna med Crowd Speaker → \"Häng med i ljudet\". Ansluter till wifi och synkar ljudet automatiskt med ett tryck!';

  @override
  String get noSpeakersYet =>
      'Inga högtalare än. Låt gänget skanna din QR-kod för att haka på!';

  @override
  String youLabel(String name) {
    return '$name (du 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'Förstärkare 📡 · synkade: $count';
  }

  @override
  String bufferDetail(int ms) {
    return '$ms ms buffert';
  }

  @override
  String dropsDetail(String pct) {
    return '$pct % avbrott';
  }

  @override
  String get errMicNeeded =>
      'Åtkomst till mikrofonen krävs för att vara mikrofonen.';

  @override
  String get errNearbyCreate =>
      'Tillåt \"Enheter i närheten\" så att appen kan skapa ett nätverk.';

  @override
  String get errNearbyShare =>
      'Tillåt \"Enheter i närheten\" så att appen kan dela ett nätverk.';

  @override
  String errNetwork(String message) {
    return 'Nätverksfel: $message';
  }

  @override
  String get noticeHotspotOff =>
      'Din hotspot är inte på än. Slå på den så uppdateras QR-koden av sig själv.';

  @override
  String get noticeLostHost =>
      'Tappade kontakten med värden. Försöker igen, eller välj ett annat nätverk nedan.';

  @override
  String noticeLostParent(String name) {
    return 'Tappade kontakten med $name. Försöker igen, eller välj ett annat nätverk nedan.';
  }

  @override
  String get noticeRejectSyncing =>
      'Hittade en förstärkarmobil, men den synkar fortfarande. Försök igen om en stund.';

  @override
  String get noticeRejectLoop =>
      'Den mobilen är redan ansluten via dig och kan därför inte vara din källa.';

  @override
  String noticeRejectOther(String reason) {
    return 'En hittad mobil svarade: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'Wifi-lösenordet i den här koden är $length tecken, men wifi-lösenord är 8–63. Värden har troligen skrivit fel: be hen skriva in det igen, eller anslut till \"$ssid\" i wifi-inställningarna och tryck på \"Jag är redan på samma wifi\".';
  }

  @override
  String get errHostNotFound =>
      'Kunde inte hitta värden på det här wifi-nätverket. Kontrollera att värden är live och att du anslutit till rätt nätverk.';

  @override
  String get errRelayNeedsAndroid =>
      'Delning kräver en Android-mobil med Wi-Fi Direct.';

  @override
  String errTooDeep(int depth, int max) {
    return 'Den här mobilen är för långt från värden (hopp från värden: $depth, max $max). Anslut till ett nätverk närmare värden för att dela.';
  }

  @override
  String notifHosting(String name) {
    return 'Är värd för \"$name\"';
  }

  @override
  String notifPlaying(String name) {
    return 'Spelar \"$name\"';
  }
}
