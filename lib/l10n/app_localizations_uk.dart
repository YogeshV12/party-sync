// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get homeTagline =>
      'Перетворіть телефони вашої компанії на одну величезну звукову систему. 🔊 Один телефон бере мікрофон, а всі інші (і підключені Bluetooth-колонки) відтворюють звук синхронно.';

  @override
  String get nameLabel => 'Ваше ім\'я або нік';

  @override
  String get nameHelper => 'Що компанія побачить на екрані';

  @override
  String get homeVibeTitle => 'Який настрій?';

  @override
  String get hostCardTitle => 'Взяти мікрофон 🎤';

  @override
  String get hostCardSubtitle =>
      'Влаштуйте вечірку. Усе, що ви говорите чи транслюєте, звучить у реальному часі з колонок усіх учасників.';

  @override
  String get joinCardTitle => 'Приєднатися до звуку 🔊';

  @override
  String get joinCardSubtitle =>
      'Скануйте QR-код ведучого. Зробіть цей телефон або свою Bluetooth-колонку частиною вечірки.';

  @override
  String get homeTipRelay =>
      'Порада: цей телефон може збільшити зону покриття! Після підключення ви зможете ділитися звуком з іще більшою кількістю друзів поруч.';

  @override
  String get homeTipIos =>
      'iPhone можуть бути ведучими або приєднуватися як колонки. Щоб збільшити зону покриття для далеких друзів, скористайтеся телефоном на Android.';

  @override
  String get homeTipDefault =>
      'Готові влаштувати вечірку або приєднатися до звуку!';

  @override
  String get scanHostQr => 'Сканувати QR-код ведучого';

  @override
  String get scanHostQrSubtitle =>
      'Підключення одним дотиком: підключається до Wi-Fi та автоматично синхронізує звук';

  @override
  String get alreadyOnWifi => 'Я вже в тій самій мережі Wi-Fi';

  @override
  String get connectManually => 'Підключитися вручну';

  @override
  String get wifiNameLabel => 'Назва мережі Wi-Fi';

  @override
  String get wifiPasswordLabel => 'Пароль Wi-Fi';

  @override
  String get hostIpLabel => 'IP-адреса ведучого (необов\'язково)';

  @override
  String get hostIpHelper => 'Вказана під QR-кодом ведучого';

  @override
  String get connectToParty => 'Підключитися до вечірки';

  @override
  String get enterWifiName => 'Введіть назву мережі Wi-Fi.';

  @override
  String get joinTipIos =>
      'Коли з\'явиться запит, торкніться «Приєднатися». Не закривайте Crowd Speaker, щоб звук не зникав!';

  @override
  String get joinTipAndroid =>
      'Коли з\'явиться запит, торкніться, щоб прийняти підключення до Wi-Fi, і ви одразу потрапите на вечірку.';

  @override
  String get scannerNotACode =>
      'Це не код Crowd Speaker. Скануйте QR-код на екрані друга!';

  @override
  String get scannerHint => 'Наведіть камеру на QR-код на екрані друга.';

  @override
  String get hostSetupTitle => 'Влаштувати вечірку 🎤';

  @override
  String get partyNameLabel => 'Назва вечірки';

  @override
  String get partyNameHelper => 'Що друзі побачать під час приєднання';

  @override
  String partyNameDefault(String name) {
    return 'Вечірка: $name';
  }

  @override
  String get defaultPartyName => 'Вечірка';

  @override
  String get connectQuestion => 'Як друзям підключатися?';

  @override
  String get instantNetworkTitle => 'Миттєва мережа вечірки';

  @override
  String get badgeEasiest => 'Найпростіше';

  @override
  String get instantNetworkSubtitle =>
      'Налаштування не потрібні. Миттєво створює локальну мережу, до якої може підключитися кожен. (Інтернет не потрібен).';

  @override
  String get usePersonalHotspot => 'Використати режим модема';

  @override
  String get useMyHotspot => 'Використати точку доступу телефона';

  @override
  String get hotspotSubtitle =>
      'Увімкніть точку доступу на телефоні вручну. Друзі також зможуть користуватися вашим мобільним інтернетом.';

  @override
  String get hotspotInfoIos =>
      'Увімкніть «Режим модема» в Параметрах («Дозволяти іншим підключатися»), потім введіть нижче назву вашого iPhone і пароль точки доступу, щоб друзі могли приєднатися.';

  @override
  String get hotspotInfoAndroid =>
      'Увімкніть точку доступу в Налаштуваннях, потім введіть нижче назву мережі Wi-Fi і пароль, щоб друзі могли приєднатися.';

  @override
  String get openHotspotSettings => 'Відкрити налаштування точки доступу';

  @override
  String get hotspotSettingsHint =>
      'Відкрийте Параметри → Режим модема та ввімкніть «Дозволяти іншим підключатися».';

  @override
  String get hotspotWifiNameLabel => 'Назва Wi-Fi точки доступу';

  @override
  String get hotspotPasswordLabel => 'Пароль точки доступу';

  @override
  String get enterHotspotName =>
      'Введіть назву точки доступу, щоб друзі могли приєднатися.';

  @override
  String get invalidWifiPassword =>
      'Пароль Wi-Fi має містити від 8 до 63 символів. Перевірте налаштування точки доступу й спробуйте ще раз!';

  @override
  String get audioTuning => 'Налаштування звуку';

  @override
  String get filterNoiseTitle => 'Фільтрувати фоновий шум';

  @override
  String get filterNoiseSubtitle =>
      'Зберігає чіткість голосу. Вимкніть, якщо граєте гучну музику або використовуєте DJ-обладнання.';

  @override
  String get startParty => 'Почати вечірку 🔥';

  @override
  String get onTheMic => 'У мікрофона 🎤';

  @override
  String get endParty => 'Завершити';

  @override
  String get endPartyTitle => 'Завершити вечірку?';

  @override
  String get endPartyMessage =>
      'Усі колонки буде відключено, а звук зупиниться.';

  @override
  String get somethingWentWrong => 'Щось пішло не так.';

  @override
  String get firingUpParty => 'Запускаємо вечірку…';

  @override
  String get creatingPartyNetwork => 'Створюємо мережу вечірки';

  @override
  String get scanToJoinSound => 'Скануйте, щоб приєднатися до звуку 📲';

  @override
  String get syncBufferTitle => 'Буфер синхронізації звуку';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'підключено $count телефона',
      many: 'підключено $count телефонів',
      few: 'підключено $count телефони',
      one: 'підключено $count телефон',
    );
    return 'Колонки компанії · $_temp0';
  }

  @override
  String get micMuted => 'Мікрофон вимкнено 🤫';

  @override
  String get liveOnAir => 'У прямому ефірі 🎙️';

  @override
  String get tapToUnmute =>
      'Торкніться мікрофона, щоб увімкнути звук і повернутися';

  @override
  String get waitingForSquad =>
      'Чекаємо, поки компанія відскануює код і приєднається…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count телефона-колонки',
      many: '$count телефонів-колонок',
      few: '$count телефони-колонки',
      one: '$count телефон-колонку',
    );
    return 'Пряма трансляція на $_temp0';
  }

  @override
  String get bufferDelayLabel => 'Затримка буфера перед відтворенням';

  @override
  String get syncBufferHelp =>
      'Посуньте вгору, якщо звук уривається або зникає. Bluetooth-колонкам і підсилювачам сигналу потрібно трохи більше буфера, щоб залишатися в ідеальній синхронізації.';

  @override
  String get speakerMode => 'Режим колонки 🔊';

  @override
  String get leave => 'Вийти';

  @override
  String get leavePartyTitle => 'Покинути вечірку?';

  @override
  String get leavePartyBoosterMessage =>
      'Друзі, підключені через ваш підсилювач, також відключаться.';

  @override
  String get leavePartyMessage => 'Цей телефон припинить відтворювати звук.';

  @override
  String get leaveParty => 'Покинути вечірку';

  @override
  String get audioOutput => 'Вивід звуку';

  @override
  String get thisSpeaker => 'Ця колонка';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route: велика затримка Bluetooth ($latency мс), більша за буфер синхронізації ведучого. Попросіть ведучого збільшити «Буфер синхронізації звуку» до $needed мс або більше, щоб ваш звук міг грати!';
  }

  @override
  String get echoFixTitle => 'Корекція відлуння (точне налаштування)';

  @override
  String get boostRangeTitle => 'Збільшити зону для друзів 📡';

  @override
  String get partyWrappedUp => 'Вечірку завершено 🎉';

  @override
  String get hostEndedParty => 'Ведучий завершив вечірку.';

  @override
  String partyEndedByHost(String name) {
    return '«$name» завершено ведучим.';
  }

  @override
  String get backToHome => 'На головний екран';

  @override
  String get joinAnotherParty => 'Приєднатися до іншої вечірки';

  @override
  String get tuningIn => 'Налаштування…';

  @override
  String get warmingUpSpeakers => 'Розігріваємо колонки';

  @override
  String connectingToWifi(String ssid) {
    return 'Підключення до $ssid…';
  }

  @override
  String get partyWifi => 'Wi-Fi вечірки';

  @override
  String get tapAllowToConnect =>
      'Торкніться «Дозволити» у спливному вікні, щоб підключитися.';

  @override
  String get findingHost => 'Шукаємо ведучого…';

  @override
  String get searchingParty => 'Шукаємо вечірку в цій мережі Wi-Fi.';

  @override
  String get lockingIntoSync => 'Синхронізація…';

  @override
  String get aligningBeat => 'Вирівнюємо ритм.';

  @override
  String get hostIsMuted => 'Ведучий вимкнув звук 🤫';

  @override
  String get hostMutedSubtitle =>
      'Підключено! Звук повернеться, коли він увімкне мікрофон.';

  @override
  String get bumpingInSync => 'Качаємо синхронно 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'Напряму підключено до: $name';
  }

  @override
  String get hostFallback => 'ведучого';

  @override
  String syncedVia(String name, int depth) {
    return 'Синхронізація через: $name (кроків від мікрофона: $depth)';
  }

  @override
  String get boosterFallback => 'підсилювача';

  @override
  String get reSyncing => 'Повторна синхронізація…';

  @override
  String get reconnectingStream => 'Повторне підключення до трансляції';

  @override
  String get notConnectedYet => 'Ще не підключено';

  @override
  String get phoneSpeaker => 'Динамік телефона';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'Затримку Bluetooth (+$ms мс) компенсовано автоматично.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'Затримку колонки (+$ms мс) відкалібровано автоматично.';
  }

  @override
  String get syncTiming => 'Час синхронізації';

  @override
  String get audioBuffer => 'Аудіобуфер';

  @override
  String get streamDrops => 'Втрати потоку';

  @override
  String get autoAdjust => 'Автокорекція';

  @override
  String get defaultSyncZero =>
      'Синхронізація за замовчуванням (нульовий зсув)';

  @override
  String nudgedEarlier(int ms) {
    return 'Зсув раніше на $ms мс';
  }

  @override
  String nudgedLater(int ms) {
    return 'Зсув пізніше на $ms мс';
  }

  @override
  String get reset => 'Скинути';

  @override
  String get echoHelp =>
      'Чуєте відлуння? Якщо ця колонка звучить пізніше за решту, посуньте вправо. Якщо раніше — вліво. (Більшість колонок і так звучать ідеально!)';

  @override
  String get relayUnsupportedIos =>
      'iPhone не може роздавати Wi-Fi під час прослуховування. Попросіть друга з Android увімкнути підсилювач сигналу!';

  @override
  String get relayUnsupportedAndroid =>
      'Цей телефон не підтримує режим підсилювача Wi-Fi Direct.';

  @override
  String get boostSignalTitle => 'Підсилити сигнал для друзів';

  @override
  String tooFarToBoost(int depth) {
    return 'Занадто далеко від ведучого, щоб розширювати зону далі (кроків від ведучого: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count друга',
      many: '$count друзів',
      few: '$count друзів',
      one: '$count друга',
    );
    return 'Підсилюємо звук для $_temp0';
  }

  @override
  String get boostSubtitleOff =>
      'Перетворює ваш телефон на підсилювач Wi-Fi, щоб могли підключитися й віддаленіші друзі.';

  @override
  String get chargerTip =>
      'Підключіть зарядку, якщо можливо: розширення зони витрачає більше заряду.';

  @override
  String get scanToConnectBooster =>
      'Скануйте, щоб підключитися через підсилювач 📲';

  @override
  String get reconnectSameNetwork => 'Перепідключитися до тієї ж мережі';

  @override
  String get retry => 'Повторити';

  @override
  String get switchLabel => 'Перейти';

  @override
  String hostLabel(String name) {
    return '$name (ведучий 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (підсилювач 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · синхронізовано: $count';
  }

  @override
  String get tryAgain => 'Повторити';

  @override
  String get back => 'Назад';

  @override
  String get cancel => 'Скасувати';

  @override
  String get copy => 'Копіювати';

  @override
  String get show => 'Показати';

  @override
  String get hide => 'Сховати';

  @override
  String copied(String label) {
    return 'Скопійовано: $label';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'Пароль';

  @override
  String get labelAddress => 'Адреса';

  @override
  String get partyCode => 'Код вечірки';

  @override
  String get cameraQr => 'QR для камери';

  @override
  String get settingUpNetwork => 'Налаштовуємо мережу вечірки…';

  @override
  String get qrCameraHelp =>
      'Скануйте застосунком «Камера», щоб спершу приєднатися до Wi-Fi, потім відкрийте Crowd Speaker і торкніться «Я вже в тій самій мережі Wi-Fi».';

  @override
  String get qrAppHelp =>
      'Скануйте в Crowd Speaker → «Приєднатися до звуку». Підключає до Wi-Fi та автоматично синхронізує звук одним дотиком!';

  @override
  String get noSpeakersYet =>
      'Колонок поки немає. Попросіть компанію відсканувати ваш QR-код, щоб долучитися!';

  @override
  String youLabel(String name) {
    return '$name (ви 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'Підсилювач 📡 · синхронізовано: $count';
  }

  @override
  String bufferDetail(int ms) {
    return 'буфер $ms мс';
  }

  @override
  String dropsDetail(String pct) {
    return 'втрат $pct%';
  }

  @override
  String get errMicNeeded =>
      'Щоб бути мікрофоном, потрібен доступ до мікрофона.';

  @override
  String get errNearbyCreate =>
      'Дозвольте «Пристрої поблизу», щоб застосунок міг створити мережу.';

  @override
  String get errNearbyShare =>
      'Дозвольте «Пристрої поблизу», щоб застосунок міг поділитися мережею.';

  @override
  String errNetwork(String message) {
    return 'Помилка мережі: $message';
  }

  @override
  String get noticeHotspotOff =>
      'Точку доступу ще не ввімкнено. Увімкніть її, і QR-код оновиться сам.';

  @override
  String get noticeLostHost =>
      'Зв\'язок із ведучим втрачено. Пробуємо знову, або виберіть іншу мережу нижче.';

  @override
  String noticeLostParent(String name) {
    return 'Зв\'язок утрачено: $name. Пробуємо знову, або виберіть іншу мережу нижче.';
  }

  @override
  String get noticeRejectSyncing =>
      'Знайдено телефон-підсилювач, але він іще синхронізується. Повторіть за мить.';

  @override
  String get noticeRejectLoop =>
      'Цей телефон уже підключений через вас, тому не може бути вашим джерелом.';

  @override
  String noticeRejectOther(String reason) {
    return 'Знайдений телефон відповів: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'Пароль Wi-Fi у цьому коді має $length символів, а паролі Wi-Fi — від 8 до 63. Імовірно, ведучий помилився під час введення: попросіть ввести знову або підключіться до «$ssid» у налаштуваннях Wi-Fi і торкніться «Я вже в тій самій мережі Wi-Fi».';
  }

  @override
  String get errHostNotFound =>
      'Не вдалося знайти ведучого в цій мережі Wi-Fi. Переконайтеся, що ведучий в ефірі, а ви підключилися до потрібної мережі.';

  @override
  String get errRelayNeedsAndroid =>
      'Для роздачі потрібен телефон на Android із Wi-Fi Direct.';

  @override
  String errTooDeep(int depth, int max) {
    return 'Цей телефон надто далеко від ведучого (кроків від ведучого: $depth, максимум $max). Підключіться до мережі ближче до ведучого, щоб ділитися.';
  }

  @override
  String notifHosting(String name) {
    return 'Ви ведете «$name»';
  }

  @override
  String notifPlaying(String name) {
    return 'Відтворення «$name»';
  }
}
