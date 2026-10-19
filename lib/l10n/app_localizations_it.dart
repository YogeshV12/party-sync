// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get homeTagline =>
      'Trasforma gli smartphone della tua comitiva in un enorme impianto audio. 🔊 Uno smartphone prende il microfono e tutti gli altri (più qualsiasi speaker Bluetooth collegato) riproducono il suono in sincrono.';

  @override
  String get nameLabel => 'Il tuo nome o soprannome';

  @override
  String get nameHelper => 'Quello che la comitiva vede sullo schermo';

  @override
  String get homeVibeTitle => 'Che si fa?';

  @override
  String get hostCardTitle => 'Prendi il microfono 🎤';

  @override
  String get hostCardSubtitle =>
      'Organizza la festa. Tutto ciò che dici o trasmetti suona in tempo reale negli speaker di tutti.';

  @override
  String get joinCardTitle => 'Unisciti al suono 🔊';

  @override
  String get joinCardSubtitle =>
      'Inquadra il QR code dell\'host. Trasforma questo telefono o il tuo speaker Bluetooth in parte della festa.';

  @override
  String get homeTipRelay =>
      'Consiglio: questo telefono può estendere la portata! Una volta connesso, puoi condividere il suono con altri amici vicini.';

  @override
  String get homeTipIos =>
      'Gli iPhone possono ospitare o unirsi come speaker. Per estendere la portata verso amici più lontani, usa un telefono Android.';

  @override
  String get homeTipDefault =>
      'Pronto a organizzare la festa o a unirti al suono!';

  @override
  String get scanHostQr => 'Scansiona il QR dell\'host';

  @override
  String get scanHostQrSubtitle =>
      'Connessione con un tocco: si collega al Wi-Fi e sincronizza il suono automaticamente';

  @override
  String get alreadyOnWifi => 'Sono già sulla stessa rete Wi-Fi';

  @override
  String get connectManually => 'Connetti manualmente';

  @override
  String get wifiNameLabel => 'Nome del Wi-Fi';

  @override
  String get wifiPasswordLabel => 'Password del Wi-Fi';

  @override
  String get hostIpLabel => 'Indirizzo IP dell\'host (facoltativo)';

  @override
  String get hostIpHelper => 'Si trova sotto il QR code dell\'host';

  @override
  String get connectToParty => 'Connetti alla festa';

  @override
  String get enterWifiName => 'Inserisci il nome del Wi-Fi.';

  @override
  String get joinTipIos =>
      'Quando richiesto, tocca \"Unisciti\" per connetterti. Tieni aperta Crowd Speaker così il suono continua!';

  @override
  String get joinTipAndroid =>
      'Quando richiesto, tocca per accettare la connessione Wi-Fi ed entrerai subito nella festa.';

  @override
  String get scannerNotACode =>
      'Non è un codice Crowd Speaker. Inquadra il QR sullo schermo del tuo amico!';

  @override
  String get scannerHint =>
      'Inquadra con la fotocamera il QR code sullo schermo del tuo amico.';

  @override
  String get hostSetupTitle => 'Organizza la festa 🎤';

  @override
  String get partyNameLabel => 'Nome della festa';

  @override
  String get partyNameHelper =>
      'Quello che vedranno gli amici quando si uniscono';

  @override
  String partyNameDefault(String name) {
    return 'La festa di $name';
  }

  @override
  String get defaultPartyName => 'Festa';

  @override
  String get connectQuestion => 'Come devono connettersi gli amici?';

  @override
  String get instantNetworkTitle => 'Rete festa istantanea';

  @override
  String get badgeEasiest => 'Il più facile';

  @override
  String get instantNetworkSubtitle =>
      'Nessuna configurazione. Crea subito una rete locale a cui tutti possono collegarsi. (Non serve internet).';

  @override
  String get usePersonalHotspot => 'Usa Hotspot personale';

  @override
  String get useMyHotspot => 'Usa l\'hotspot del mio telefono';

  @override
  String get hotspotSubtitle =>
      'Attiva manualmente l\'hotspot del telefono. Permette agli amici di usare anche la tua connessione dati.';

  @override
  String get hotspotInfoIos =>
      'Attiva Hotspot personale in Impostazioni (\"Consenti ad altri di accedere\"), poi inserisci qui sotto il nome del tuo iPhone e la password dell\'hotspot per far unire gli amici.';

  @override
  String get hotspotInfoAndroid =>
      'Attiva l\'hotspot in Impostazioni, poi inserisci qui sotto nome e password del Wi-Fi per far unire gli amici.';

  @override
  String get openHotspotSettings => 'Apri impostazioni hotspot';

  @override
  String get hotspotSettingsHint =>
      'Apri Impostazioni → Hotspot personale e attiva \"Consenti ad altri di accedere\".';

  @override
  String get hotspotWifiNameLabel => 'Nome Wi-Fi dell\'hotspot';

  @override
  String get hotspotPasswordLabel => 'Password dell\'hotspot';

  @override
  String get enterHotspotName =>
      'Inserisci il nome del tuo hotspot per far unire gli amici.';

  @override
  String get invalidWifiPassword =>
      'Le password Wi-Fi devono avere da 8 a 63 caratteri. Controlla le impostazioni dell\'hotspot e riprova!';

  @override
  String get audioTuning => 'Regolazione audio';

  @override
  String get filterNoiseTitle => 'Filtra il rumore di fondo';

  @override
  String get filterNoiseSubtitle =>
      'Mantiene le voci nitide. Disattivalo se metti musica ad alto volume o usi attrezzatura da DJ.';

  @override
  String get startParty => 'Inizia la festa 🔥';

  @override
  String get onTheMic => 'Al microfono 🎤';

  @override
  String get endParty => 'Termina festa';

  @override
  String get endPartyTitle => 'Terminare la festa?';

  @override
  String get endPartyMessage =>
      'Tutti gli speaker verranno disconnessi e il suono si fermerà.';

  @override
  String get somethingWentWrong => 'Qualcosa è andato storto.';

  @override
  String get firingUpParty => 'Si accende la festa…';

  @override
  String get creatingPartyNetwork => 'Creazione della rete della festa';

  @override
  String get scanToJoinSound => 'Scansiona per unirti al suono 📲';

  @override
  String get syncBufferTitle => 'Buffer di sincronizzazione';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count telefoni connessi',
      one: '$count telefono connesso',
    );
    return 'Speaker della comitiva · $_temp0';
  }

  @override
  String get micMuted => 'Microfono disattivato 🤫';

  @override
  String get liveOnAir => 'In diretta 🎙️';

  @override
  String get tapToUnmute => 'Tocca il microfono per riattivarlo e rientrare';

  @override
  String get waitingForSquad =>
      'In attesa che la comitiva scansioni e si unisca…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count telefoni speaker',
      one: '$count telefono speaker',
    );
    return 'Trasmissione in diretta a $_temp0';
  }

  @override
  String get bufferDelayLabel => 'Ritardo del buffer prima della riproduzione';

  @override
  String get syncBufferHelp =>
      'Aumenta se l\'audio scatta o si interrompe. Gli speaker Bluetooth e i ripetitori di segnale richiedono un po\' più di buffer per restare perfettamente sincronizzati.';

  @override
  String get speakerMode => 'Modalità speaker 🔊';

  @override
  String get leave => 'Esci';

  @override
  String get leavePartyTitle => 'Uscire dalla festa?';

  @override
  String get leavePartyBoosterMessage =>
      'Anche gli amici connessi tramite il tuo ripetitore verranno disconnessi.';

  @override
  String get leavePartyMessage =>
      'Questo telefono smetterà di riprodurre il suono.';

  @override
  String get leaveParty => 'Esci dalla festa';

  @override
  String get audioOutput => 'Uscita audio';

  @override
  String get thisSpeaker => 'Questo speaker';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route ha un forte ritardo Bluetooth ($latency ms), superiore al buffer di sincronizzazione dell\'host. Chiedi all\'host di aumentare il \"Buffer di sincronizzazione\" a $needed ms o più per far suonare l\'audio!';
  }

  @override
  String get echoFixTitle => 'Correzione eco (regolazione fine)';

  @override
  String get boostRangeTitle => 'Estendi la portata per gli amici 📡';

  @override
  String get partyWrappedUp => 'La festa è finita 🎉';

  @override
  String get hostEndedParty => 'L\'host ha terminato la festa.';

  @override
  String partyEndedByHost(String name) {
    return '\"$name\" è stata terminata dall\'host.';
  }

  @override
  String get backToHome => 'Torna alla home';

  @override
  String get joinAnotherParty => 'Unisciti a un\'altra festa';

  @override
  String get tuningIn => 'Sintonizzazione…';

  @override
  String get warmingUpSpeakers => 'Si scaldano gli speaker';

  @override
  String connectingToWifi(String ssid) {
    return 'Connessione a $ssid…';
  }

  @override
  String get partyWifi => 'il Wi-Fi della festa';

  @override
  String get tapAllowToConnect => 'Tocca Consenti nel pop-up per connetterti.';

  @override
  String get findingHost => 'Ricerca dell\'host…';

  @override
  String get searchingParty => 'Ricerca della festa su questo Wi-Fi.';

  @override
  String get lockingIntoSync => 'Sincronizzazione…';

  @override
  String get aligningBeat => 'Allineamento del ritmo.';

  @override
  String get hostIsMuted => 'L\'host è in muto 🤫';

  @override
  String get hostMutedSubtitle =>
      'Connesso! Il suono tornerà quando riattiverà il microfono.';

  @override
  String get bumpingInSync => 'In sincrono a tutto volume 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'Collegato direttamente a $name';
  }

  @override
  String get hostFallback => 'l\'host';

  @override
  String syncedVia(String name, int depth) {
    return 'Sincronizzato tramite $name (salti dal microfono: $depth)';
  }

  @override
  String get boosterFallback => 'il ripetitore';

  @override
  String get reSyncing => 'Risincronizzazione…';

  @override
  String get reconnectingStream => 'Riconnessione allo stream';

  @override
  String get notConnectedYet => 'Non ancora connesso';

  @override
  String get phoneSpeaker => 'Altoparlante del telefono';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'Ritardo Bluetooth (+$ms ms) compensato automaticamente.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'Ritardo dello speaker (+$ms ms) calibrato automaticamente.';
  }

  @override
  String get syncTiming => 'Tempi di sincronia';

  @override
  String get audioBuffer => 'Buffer audio';

  @override
  String get streamDrops => 'Perdite dello stream';

  @override
  String get autoAdjust => 'Regolazione automatica';

  @override
  String get defaultSyncZero => 'Sincronia predefinita (offset zero)';

  @override
  String nudgedEarlier(int ms) {
    return 'Anticipato di $ms ms';
  }

  @override
  String nudgedLater(int ms) {
    return 'Ritardato di $ms ms';
  }

  @override
  String get reset => 'Ripristina';

  @override
  String get echoHelp =>
      'Senti un\'eco? Se questo speaker suona dopo gli altri, sposta a destra. Se suona prima, sposta a sinistra. (La maggior parte degli speaker suona già perfettamente senza!)';

  @override
  String get relayUnsupportedIos =>
      'Gli iPhone non possono condividere il Wi-Fi mentre ascoltano. Chiedi a un amico con Android di attivare il ripetitore di segnale!';

  @override
  String get relayUnsupportedAndroid =>
      'Questo telefono non supporta la modalità ripetitore Wi-Fi Direct.';

  @override
  String get boostSignalTitle => 'Potenzia il segnale per gli amici';

  @override
  String tooFarToBoost(int depth) {
    return 'Troppo lontano dall\'host per estendere ancora la portata (salti dall\'host: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count amici',
      one: '$count amico',
    );
    return 'Potenziamento del suono per $_temp0';
  }

  @override
  String get boostSubtitleOff =>
      'Trasforma il telefono in un ripetitore Wi-Fi così gli amici più lontani possono connettersi.';

  @override
  String get chargerTip =>
      'Se possibile collega un caricabatterie: estendere la portata consuma più batteria.';

  @override
  String get scanToConnectBooster =>
      'Scansiona per connetterti tramite il ripetitore 📲';

  @override
  String get reconnectSameNetwork => 'Riconnetti alla stessa rete';

  @override
  String get retry => 'Riprova';

  @override
  String get switchLabel => 'Passa';

  @override
  String hostLabel(String name) {
    return '$name (host 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (ripetitore 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · sincronizzati: $count';
  }

  @override
  String get tryAgain => 'Riprova';

  @override
  String get back => 'Indietro';

  @override
  String get cancel => 'Annulla';

  @override
  String get copy => 'Copia';

  @override
  String get show => 'Mostra';

  @override
  String get hide => 'Nascondi';

  @override
  String copied(String label) {
    return '$label copiato';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'Password';

  @override
  String get labelAddress => 'Indirizzo';

  @override
  String get partyCode => 'Codice festa';

  @override
  String get cameraQr => 'QR per fotocamera';

  @override
  String get settingUpNetwork => 'Preparazione della rete della festa…';

  @override
  String get qrCameraHelp =>
      'Inquadra con l\'app Fotocamera del telefono per collegarti prima al Wi-Fi, poi apri Crowd Speaker e tocca \"Sono già sulla stessa rete Wi-Fi\".';

  @override
  String get qrAppHelp =>
      'Inquadra con Crowd Speaker → \"Unisciti al suono\". Si collega al Wi-Fi e sincronizza il suono automaticamente con un tocco!';

  @override
  String get noSpeakersYet =>
      'Ancora nessuno speaker. Fai scansionare il tuo QR code alla comitiva per partire!';

  @override
  String youLabel(String name) {
    return '$name (tu 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'Ripetitore 📡 · sincronizzati: $count';
  }

  @override
  String bufferDetail(int ms) {
    return 'buffer $ms ms';
  }

  @override
  String dropsDetail(String pct) {
    return '$pct% di perdite';
  }

  @override
  String get errMicNeeded =>
      'Serve l\'accesso al microfono per fare da microfono.';

  @override
  String get errNearbyCreate =>
      'Consenti \"Dispositivi nelle vicinanze\" così l\'app può creare una rete.';

  @override
  String get errNearbyShare =>
      'Consenti \"Dispositivi nelle vicinanze\" così l\'app può condividere una rete.';

  @override
  String errNetwork(String message) {
    return 'Errore di rete: $message';
  }

  @override
  String get noticeHotspotOff =>
      'Il tuo hotspot non è ancora attivo. Attivalo e il QR code si aggiornerà da solo.';

  @override
  String get noticeLostHost =>
      'Connessione con l\'host persa. Nuovo tentativo in corso, oppure scegli un\'altra rete qui sotto.';

  @override
  String noticeLostParent(String name) {
    return 'Connessione con $name persa. Nuovo tentativo in corso, oppure scegli un\'altra rete qui sotto.';
  }

  @override
  String get noticeRejectSyncing =>
      'Trovato un telefono ripetitore, ma si sta ancora sincronizzando. Riprova tra un attimo.';

  @override
  String get noticeRejectLoop =>
      'Quel telefono è già connesso tramite te, quindi non può essere la tua fonte.';

  @override
  String noticeRejectOther(String reason) {
    return 'Un telefono trovato ha risposto: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'La password Wi-Fi in questo codice ha $length caratteri, ma le password Wi-Fi vanno da 8 a 63. Probabilmente l\'host ha sbagliato a digitarla: chiedigli di reinserirla, oppure collegati a \"$ssid\" nelle impostazioni Wi-Fi e tocca \"Sono già sulla stessa rete Wi-Fi\".';
  }

  @override
  String get errHostNotFound =>
      'Impossibile trovare l\'host su questo Wi-Fi. Controlla che l\'host sia in diretta e che ti sia collegato alla rete giusta.';

  @override
  String get errRelayNeedsAndroid =>
      'Per condividere serve un telefono Android con Wi-Fi Direct.';

  @override
  String errTooDeep(int depth, int max) {
    return 'Questo telefono è troppo lontano dall\'host (salti dall\'host: $depth, max $max). Collegati a una rete più vicina all\'host per condividere.';
  }

  @override
  String notifHosting(String name) {
    return 'Organizzazione di \"$name\"';
  }

  @override
  String notifPlaying(String name) {
    return 'Riproduzione di \"$name\"';
  }
}
