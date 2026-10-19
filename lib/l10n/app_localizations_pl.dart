// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get homeTagline =>
      'Zamień telefony swojej ekipy w jeden potężny system nagłośnienia. 🔊 Jeden telefon bierze mikrofon, a wszystkie pozostałe (oraz podłączone głośniki Bluetooth) odtwarzają dźwięk w synchronizacji.';

  @override
  String get nameLabel => 'Twoje imię lub pseudonim';

  @override
  String get nameHelper => 'Co ekipa zobaczy na swoim ekranie';

  @override
  String get homeVibeTitle => 'Jaki klimat?';

  @override
  String get hostCardTitle => 'Weź mikrofon 🎤';

  @override
  String get hostCardSubtitle =>
      'Zorganizuj imprezę. Wszystko, co powiesz lub prześlesz, gra na żywo w głośnikach wszystkich.';

  @override
  String get joinCardTitle => 'Dołącz do dźwięku 🔊';

  @override
  String get joinCardSubtitle =>
      'Zeskanuj kod QR gospodarza. Zrób z tego telefonu lub swojego głośnika Bluetooth część imprezy.';

  @override
  String get homeTipRelay =>
      'Wskazówka: ten telefon może zwiększyć zasięg! Po połączeniu możesz podzielić się dźwiękiem z jeszcze większą liczbą znajomych w pobliżu.';

  @override
  String get homeTipIos =>
      'iPhone\'y mogą być gospodarzem lub dołączać jako głośniki. Aby zwiększyć zasięg dla znajomych stojących dalej, użyj telefonu z Androidem.';

  @override
  String get homeTipDefault =>
      'Gotowy, by zorganizować imprezę lub dołączyć do dźwięku!';

  @override
  String get scanHostQr => 'Zeskanuj kod QR gospodarza';

  @override
  String get scanHostQrSubtitle =>
      'Połączenie jednym dotknięciem: łączy z Wi-Fi i automatycznie synchronizuje dźwięk';

  @override
  String get alreadyOnWifi => 'Jestem już w tej samej sieci Wi-Fi';

  @override
  String get connectManually => 'Połącz ręcznie';

  @override
  String get wifiNameLabel => 'Nazwa Wi-Fi';

  @override
  String get wifiPasswordLabel => 'Hasło Wi-Fi';

  @override
  String get hostIpLabel => 'Adres IP gospodarza (opcjonalnie)';

  @override
  String get hostIpHelper => 'Znajdziesz go pod kodem QR gospodarza';

  @override
  String get connectToParty => 'Połącz z imprezą';

  @override
  String get enterWifiName => 'Wpisz nazwę Wi-Fi.';

  @override
  String get joinTipIos =>
      'Gdy pojawi się prośba, dotknij „Dołącz”, aby się połączyć. Zostaw Crowd Speaker uruchomiony, żeby dźwięk grał dalej!';

  @override
  String get joinTipAndroid =>
      'Gdy pojawi się prośba, dotknij, aby zaakceptować połączenie Wi-Fi, i od razu wskakujesz na imprezę.';

  @override
  String get scannerNotACode =>
      'To nie jest kod Crowd Speaker. Zeskanuj kod QR na ekranie znajomego!';

  @override
  String get scannerHint => 'Skieruj aparat na kod QR na ekranie znajomego.';

  @override
  String get hostSetupTitle => 'Zorganizuj imprezę 🎤';

  @override
  String get partyNameLabel => 'Nazwa imprezy';

  @override
  String get partyNameHelper => 'Co znajomi zobaczą po dołączeniu';

  @override
  String partyNameDefault(String name) {
    return 'Impreza: $name';
  }

  @override
  String get defaultPartyName => 'Impreza';

  @override
  String get connectQuestion => 'Jak znajomi mają się łączyć?';

  @override
  String get instantNetworkTitle => 'Błyskawiczna sieć imprezy';

  @override
  String get badgeEasiest => 'Najłatwiej';

  @override
  String get instantNetworkSubtitle =>
      'Bez konfiguracji. Od razu tworzy sieć lokalną, do której każdy może dołączyć. (Internet niepotrzebny).';

  @override
  String get usePersonalHotspot => 'Użyj Osobistego hotspotu';

  @override
  String get useMyHotspot => 'Użyj hotspotu mojego telefonu';

  @override
  String get hotspotSubtitle =>
      'Włącz hotspot w telefonie ręcznie. Pozwala też znajomym korzystać z Twojego mobilnego internetu.';

  @override
  String get hotspotInfoIos =>
      'Włącz Osobisty hotspot w Ustawieniach („Zezwalaj innym na dołączanie”), a potem wpisz poniżej nazwę iPhone\'a i hasło hotspotu, aby znajomi mogli dołączyć.';

  @override
  String get hotspotInfoAndroid =>
      'Włącz hotspot w Ustawieniach, a potem wpisz poniżej nazwę Wi-Fi i hasło, aby znajomi mogli dołączyć.';

  @override
  String get openHotspotSettings => 'Otwórz ustawienia hotspotu';

  @override
  String get hotspotSettingsHint =>
      'Otwórz Ustawienia → Osobisty hotspot i włącz „Zezwalaj innym na dołączanie”.';

  @override
  String get hotspotWifiNameLabel => 'Nazwa Wi-Fi hotspotu';

  @override
  String get hotspotPasswordLabel => 'Hasło hotspotu';

  @override
  String get enterHotspotName =>
      'Wpisz nazwę hotspotu, aby znajomi mogli dołączyć.';

  @override
  String get invalidWifiPassword =>
      'Hasła Wi-Fi muszą mieć 8–63 znaków. Sprawdź ustawienia hotspotu i spróbuj ponownie!';

  @override
  String get audioTuning => 'Strojenie dźwięku';

  @override
  String get filterNoiseTitle => 'Filtruj szumy tła';

  @override
  String get filterNoiseSubtitle =>
      'Utrzymuje wyraźne głosy. Wyłącz, jeśli puszczasz głośną muzykę lub używasz sprzętu DJ-skiego.';

  @override
  String get startParty => 'Zacznij imprezę 🔥';

  @override
  String get onTheMic => 'Przy mikrofonie 🎤';

  @override
  String get endParty => 'Zakończ imprezę';

  @override
  String get endPartyTitle => 'Zakończyć imprezę?';

  @override
  String get endPartyMessage =>
      'Spowoduje to odłączenie wszystkich głośników i zatrzymanie dźwięku.';

  @override
  String get somethingWentWrong => 'Coś poszło nie tak.';

  @override
  String get firingUpParty => 'Rozkręcamy imprezę…';

  @override
  String get creatingPartyNetwork => 'Tworzenie sieci imprezy';

  @override
  String get scanToJoinSound => 'Zeskanuj, aby dołączyć do dźwięku 📲';

  @override
  String get syncBufferTitle => 'Bufor synchronizacji dźwięku';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count telefonu połączonego',
      many: '$count telefonów połączonych',
      few: '$count telefony połączone',
      one: '$count telefon połączony',
    );
    return 'Głośniki ekipy · $_temp0';
  }

  @override
  String get micMuted => 'Mikrofon wyciszony 🤫';

  @override
  String get liveOnAir => 'Na żywo 🎙️';

  @override
  String get tapToUnmute => 'Dotknij mikrofonu, aby włączyć dźwięk i wrócić';

  @override
  String get waitingForSquad => 'Czekamy, aż ekipa zeskanuje kod i dołączy…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count telefonu-głośnika',
      many: '$count telefonów-głośników',
      few: '$count telefonów-głośników',
      one: '$count telefonu-głośnika',
    );
    return 'Transmisja na żywo do $_temp0';
  }

  @override
  String get bufferDelayLabel => 'Opóźnienie bufora przed odtworzeniem dźwięku';

  @override
  String get syncBufferHelp =>
      'Przesuń w górę, jeśli dźwięk się zacina lub zanika. Głośniki Bluetooth i wzmacniacze sygnału potrzebują nieco większego bufora, by zachować pełną synchronizację.';

  @override
  String get speakerMode => 'Tryb głośnika 🔊';

  @override
  String get leave => 'Wyjdź';

  @override
  String get leavePartyTitle => 'Opuścić imprezę?';

  @override
  String get leavePartyBoosterMessage =>
      'Znajomi połączeni przez Twój wzmacniacz również zostaną rozłączeni.';

  @override
  String get leavePartyMessage => 'Ten telefon przestanie odtwarzać dźwięk.';

  @override
  String get leaveParty => 'Opuść imprezę';

  @override
  String get audioOutput => 'Wyjście audio';

  @override
  String get thisSpeaker => 'Ten głośnik';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route ma duże opóźnienie Bluetooth ($latency ms), większe niż bufor synchronizacji gospodarza. Poproś gospodarza o zwiększenie „Bufora synchronizacji dźwięku” do $needed ms lub więcej, aby Twój dźwięk mógł grać!';
  }

  @override
  String get echoFixTitle => 'Korekta echa (dostrajanie synchronizacji)';

  @override
  String get boostRangeTitle => 'Zwiększ zasięg dla znajomych 📡';

  @override
  String get partyWrappedUp => 'Impreza dobiegła końca 🎉';

  @override
  String get hostEndedParty => 'Gospodarz zakończył imprezę.';

  @override
  String partyEndedByHost(String name) {
    return '„$name” została zakończona przez gospodarza.';
  }

  @override
  String get backToHome => 'Wróć do ekranu głównego';

  @override
  String get joinAnotherParty => 'Dołącz do innej imprezy';

  @override
  String get tuningIn => 'Dostrajanie…';

  @override
  String get warmingUpSpeakers => 'Rozgrzewanie głośników';

  @override
  String connectingToWifi(String ssid) {
    return 'Łączenie z $ssid…';
  }

  @override
  String get partyWifi => 'Wi-Fi imprezy';

  @override
  String get tapAllowToConnect => 'Dotknij Zezwól w oknie, aby się połączyć.';

  @override
  String get findingHost => 'Szukanie gospodarza…';

  @override
  String get searchingParty => 'Szukanie imprezy w tej sieci Wi-Fi.';

  @override
  String get lockingIntoSync => 'Synchronizowanie…';

  @override
  String get aligningBeat => 'Wyrównywanie rytmu.';

  @override
  String get hostIsMuted => 'Gospodarz jest wyciszony 🤫';

  @override
  String get hostMutedSubtitle =>
      'Połączono! Dźwięk wróci, gdy włączy mikrofon.';

  @override
  String get bumpingInSync => 'Gramy w synchronizacji 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'Połączono bezpośrednio z: $name';
  }

  @override
  String get hostFallback => 'gospodarzem';

  @override
  String syncedVia(String name, int depth) {
    return 'Synchronizacja przez: $name (przeskoków od mikrofonu: $depth)';
  }

  @override
  String get boosterFallback => 'wzmacniaczem';

  @override
  String get reSyncing => 'Ponowna synchronizacja…';

  @override
  String get reconnectingStream => 'Ponowne łączenie ze strumieniem';

  @override
  String get notConnectedYet => 'Jeszcze nie połączono';

  @override
  String get phoneSpeaker => 'Głośnik telefonu';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'Opóźnienie Bluetooth (+$ms ms) zostało automatycznie zniwelowane.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'Opóźnienie głośnika (+$ms ms) zostało automatycznie skalibrowane.';
  }

  @override
  String get syncTiming => 'Czas synchronizacji';

  @override
  String get audioBuffer => 'Bufor audio';

  @override
  String get streamDrops => 'Zaniki strumienia';

  @override
  String get autoAdjust => 'Automatyczna korekta';

  @override
  String get defaultSyncZero => 'Domyślna synchronizacja (zero przesunięcia)';

  @override
  String nudgedEarlier(int ms) {
    return 'Przyspieszono o $ms ms';
  }

  @override
  String nudgedLater(int ms) {
    return 'Opóźniono o $ms ms';
  }

  @override
  String get reset => 'Resetuj';

  @override
  String get echoHelp =>
      'Słyszysz echo? Jeśli ten głośnik gra z opóźnieniem względem ekipy, przesuń w prawo. Jeśli wyprzedza, przesuń w lewo. (Większość głośników brzmi idealnie bez tego!)';

  @override
  String get relayUnsupportedIos =>
      'iPhone\'y nie mogą udostępniać Wi-Fi podczas słuchania. Poproś znajomego z Androidem o włączenie wzmacniacza sygnału!';

  @override
  String get relayUnsupportedAndroid =>
      'Ten telefon nie obsługuje trybu wzmacniacza Wi-Fi Direct.';

  @override
  String get boostSignalTitle => 'Wzmocnij sygnał dla znajomych';

  @override
  String tooFarToBoost(int depth) {
    return 'Zbyt daleko od gospodarza, by dalej zwiększać zasięg (przeskoków od gospodarza: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count znajomego',
      many: '$count znajomych',
      few: '$count znajomych',
      one: '$count znajomego',
    );
    return 'Wzmacnianie dźwięku dla $_temp0';
  }

  @override
  String get boostSubtitleOff =>
      'Zamienia telefon we wzmacniacz Wi-Fi, aby mogli połączyć się znajomi stojący dalej.';

  @override
  String get chargerTip =>
      'Jeśli możesz, podłącz ładowarkę: zwiększanie zasięgu zużywa więcej baterii.';

  @override
  String get scanToConnectBooster =>
      'Zeskanuj, aby połączyć się przez wzmacniacz 📲';

  @override
  String get reconnectSameNetwork => 'Połącz ponownie z tą samą siecią';

  @override
  String get retry => 'Ponów';

  @override
  String get switchLabel => 'Przełącz';

  @override
  String hostLabel(String name) {
    return '$name (gospodarz 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (wzmacniacz 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · zsynchronizowanych: $count';
  }

  @override
  String get tryAgain => 'Spróbuj ponownie';

  @override
  String get back => 'Wstecz';

  @override
  String get cancel => 'Anuluj';

  @override
  String get copy => 'Kopiuj';

  @override
  String get show => 'Pokaż';

  @override
  String get hide => 'Ukryj';

  @override
  String copied(String label) {
    return 'Skopiowano: $label';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'Hasło';

  @override
  String get labelAddress => 'Adres';

  @override
  String get partyCode => 'Kod imprezy';

  @override
  String get cameraQr => 'QR dla aparatu';

  @override
  String get settingUpNetwork => 'Konfigurowanie sieci imprezy…';

  @override
  String get qrCameraHelp =>
      'Zeskanuj aplikacją Aparat w telefonie, aby najpierw dołączyć do Wi-Fi, potem otwórz Crowd Speaker i dotknij „Jestem już w tej samej sieci Wi-Fi”.';

  @override
  String get qrAppHelp =>
      'Zeskanuj w Crowd Speaker → „Dołącz do dźwięku”. Łączy z Wi-Fi i synchronizuje dźwięk automatycznie jednym dotknięciem!';

  @override
  String get noSpeakersYet =>
      'Brak jeszcze głośników. Niech ekipa zeskanuje Twój kod QR, by dołączyć!';

  @override
  String youLabel(String name) {
    return '$name (Ty 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'Wzmacniacz 📡 · zsynchronizowanych: $count';
  }

  @override
  String bufferDetail(int ms) {
    return 'bufor $ms ms';
  }

  @override
  String dropsDetail(String pct) {
    return '$pct% zaników';
  }

  @override
  String get errMicNeeded =>
      'Aby być mikrofonem, potrzebny jest dostęp do mikrofonu.';

  @override
  String get errNearbyCreate =>
      'Zezwól na „Urządzenia w pobliżu”, aby aplikacja mogła utworzyć sieć.';

  @override
  String get errNearbyShare =>
      'Zezwól na „Urządzenia w pobliżu”, aby aplikacja mogła udostępnić sieć.';

  @override
  String errNetwork(String message) {
    return 'Błąd sieci: $message';
  }

  @override
  String get noticeHotspotOff =>
      'Twój hotspot nie jest jeszcze włączony. Włącz go, a kod QR zaktualizuje się sam.';

  @override
  String get noticeLostHost =>
      'Utracono połączenie z gospodarzem. Próbuję ponownie lub wybierz poniżej inną sieć.';

  @override
  String noticeLostParent(String name) {
    return 'Utracono połączenie z: $name. Próbuję ponownie lub wybierz poniżej inną sieć.';
  }

  @override
  String get noticeRejectSyncing =>
      'Znaleziono telefon-wzmacniacz, ale wciąż się synchronizuje. Spróbuj ponownie za chwilę.';

  @override
  String get noticeRejectLoop =>
      'Ten telefon jest już połączony przez Ciebie, więc nie może być Twoim źródłem.';

  @override
  String noticeRejectOther(String reason) {
    return 'Znaleziony telefon odpowiedział: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'Hasło Wi-Fi w tym kodzie ma $length znaków, a hasła Wi-Fi mają 8-63. Gospodarz prawdopodobnie się pomylił: poproś o ponowne wpisanie lub dołącz do „$ssid” w ustawieniach Wi-Fi i dotknij „Jestem już w tej samej sieci Wi-Fi”.';
  }

  @override
  String get errHostNotFound =>
      'Nie znaleziono gospodarza w tej sieci Wi-Fi. Sprawdź, czy gospodarz nadaje na żywo i czy dołączono do właściwej sieci.';

  @override
  String get errRelayNeedsAndroid =>
      'Udostępnianie wymaga telefonu z Androidem i Wi-Fi Direct.';

  @override
  String errTooDeep(int depth, int max) {
    return 'Ten telefon jest zbyt daleko od gospodarza (przeskoków od gospodarza: $depth, maks. $max). Dołącz do sieci bliżej gospodarza, aby udostępniać.';
  }

  @override
  String notifHosting(String name) {
    return 'Prowadzisz „$name”';
  }

  @override
  String notifPlaying(String name) {
    return 'Odtwarzanie „$name”';
  }
}
