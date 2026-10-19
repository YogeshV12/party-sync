// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get homeTagline =>
      'Превратите телефоны вашей компании в одну огромную звуковую систему. 🔊 Один телефон берёт микрофон, а все остальные (и подключённые Bluetooth-колонки) воспроизводят звук синхронно.';

  @override
  String get nameLabel => 'Ваше имя или ник';

  @override
  String get nameHelper => 'Что компания увидит на экране';

  @override
  String get homeVibeTitle => 'Какой настрой?';

  @override
  String get hostCardTitle => 'Взять микрофон 🎤';

  @override
  String get hostCardSubtitle =>
      'Устройте вечеринку. Всё, что вы говорите или транслируете, звучит в реальном времени из колонок всех участников.';

  @override
  String get joinCardTitle => 'Подключиться к звуку 🔊';

  @override
  String get joinCardSubtitle =>
      'Отсканируйте QR-код ведущего. Сделайте этот телефон или свою Bluetooth-колонку частью вечеринки.';

  @override
  String get homeTipRelay =>
      'Совет: этот телефон может расширить зону покрытия! После подключения вы сможете делиться звуком с ещё большим числом друзей рядом.';

  @override
  String get homeTipIos =>
      'iPhone могут быть ведущими или подключаться как колонки. Чтобы расширить зону покрытия для более далёких друзей, используйте телефон на Android.';

  @override
  String get homeTipDefault =>
      'Готовы устроить вечеринку или подключиться к звуку!';

  @override
  String get scanHostQr => 'Сканировать QR-код ведущего';

  @override
  String get scanHostQrSubtitle =>
      'Подключение одним касанием: подключается к Wi-Fi и автоматически синхронизирует звук';

  @override
  String get alreadyOnWifi => 'Я уже в этой же сети Wi-Fi';

  @override
  String get connectManually => 'Подключиться вручную';

  @override
  String get wifiNameLabel => 'Имя сети Wi-Fi';

  @override
  String get wifiPasswordLabel => 'Пароль Wi-Fi';

  @override
  String get hostIpLabel => 'IP-адрес ведущего (необязательно)';

  @override
  String get hostIpHelper => 'Указан под QR-кодом ведущего';

  @override
  String get connectToParty => 'Подключиться к вечеринке';

  @override
  String get enterWifiName => 'Введите имя сети Wi-Fi.';

  @override
  String get joinTipIos =>
      'Когда появится запрос, нажмите «Подключиться». Не закрывайте Crowd Speaker, чтобы звук продолжал играть!';

  @override
  String get joinTipAndroid =>
      'Когда появится запрос, нажмите, чтобы принять подключение к Wi-Fi, и вы сразу попадёте на вечеринку.';

  @override
  String get scannerNotACode =>
      'Это не код Crowd Speaker. Отсканируйте QR-код на экране друга!';

  @override
  String get scannerHint => 'Наведите камеру на QR-код на экране друга.';

  @override
  String get hostSetupTitle => 'Устроить вечеринку 🎤';

  @override
  String get partyNameLabel => 'Название вечеринки';

  @override
  String get partyNameHelper => 'Что друзья увидят при подключении';

  @override
  String partyNameDefault(String name) {
    return 'Вечеринка: $name';
  }

  @override
  String get defaultPartyName => 'Вечеринка';

  @override
  String get connectQuestion => 'Как друзьям подключаться?';

  @override
  String get instantNetworkTitle => 'Мгновенная сеть вечеринки';

  @override
  String get badgeEasiest => 'Проще всего';

  @override
  String get instantNetworkSubtitle =>
      'Настройка не нужна. Мгновенно создаёт локальную сеть, к которой может подключиться каждый. (Интернет не нужен).';

  @override
  String get usePersonalHotspot => 'Использовать режим модема';

  @override
  String get useMyHotspot => 'Использовать точку доступа телефона';

  @override
  String get hotspotSubtitle =>
      'Включите точку доступа на телефоне вручную. Друзья также смогут пользоваться вашим мобильным интернетом.';

  @override
  String get hotspotInfoIos =>
      'Включите «Режим модема» в Настройках («Разрешать другим подключаться»), затем введите ниже имя вашего iPhone и пароль точки доступа, чтобы друзья могли подключиться.';

  @override
  String get hotspotInfoAndroid =>
      'Включите точку доступа в Настройках, затем введите ниже имя сети Wi-Fi и пароль, чтобы друзья могли подключиться.';

  @override
  String get openHotspotSettings => 'Открыть настройки точки доступа';

  @override
  String get hotspotSettingsHint =>
      'Откройте Настройки → Режим модема и включите «Разрешать другим подключаться».';

  @override
  String get hotspotWifiNameLabel => 'Имя Wi-Fi точки доступа';

  @override
  String get hotspotPasswordLabel => 'Пароль точки доступа';

  @override
  String get enterHotspotName =>
      'Введите имя точки доступа, чтобы друзья могли подключиться.';

  @override
  String get invalidWifiPassword =>
      'Пароль Wi-Fi должен содержать от 8 до 63 символов. Проверьте настройки точки доступа и попробуйте снова!';

  @override
  String get audioTuning => 'Настройка звука';

  @override
  String get filterNoiseTitle => 'Фильтровать фоновый шум';

  @override
  String get filterNoiseSubtitle =>
      'Сохраняет чёткость голоса. Отключите, если играете громкую музыку или используете DJ-оборудование.';

  @override
  String get startParty => 'Начать вечеринку 🔥';

  @override
  String get onTheMic => 'У микрофона 🎤';

  @override
  String get endParty => 'Завершить';

  @override
  String get endPartyTitle => 'Завершить вечеринку?';

  @override
  String get endPartyMessage =>
      'Все колонки будут отключены, звук остановится.';

  @override
  String get somethingWentWrong => 'Что-то пошло не так.';

  @override
  String get firingUpParty => 'Запускаем вечеринку…';

  @override
  String get creatingPartyNetwork => 'Создаём сеть вечеринки';

  @override
  String get scanToJoinSound => 'Сканируйте, чтобы подключиться к звуку 📲';

  @override
  String get syncBufferTitle => 'Буфер синхронизации звука';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'подключено $count телефона',
      many: 'подключено $count телефонов',
      few: 'подключено $count телефона',
      one: 'подключён $count телефон',
    );
    return 'Колонки компании · $_temp0';
  }

  @override
  String get micMuted => 'Микрофон выключен 🤫';

  @override
  String get liveOnAir => 'В прямом эфире 🎙️';

  @override
  String get tapToUnmute =>
      'Нажмите на микрофон, чтобы включить звук и вернуться';

  @override
  String get waitingForSquad =>
      'Ждём, пока компания отсканирует код и подключится…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count телефона-колонки',
      many: '$count телефонов-колонок',
      few: '$count телефона-колонки',
      one: '$count телефон-колонку',
    );
    return 'Прямая трансляция на $_temp0';
  }

  @override
  String get bufferDelayLabel => 'Задержка буфера перед воспроизведением';

  @override
  String get syncBufferHelp =>
      'Сдвиньте вверх, если звук прерывается или пропадает. Bluetooth-колонкам и усилителям сигнала нужно чуть больше буфера, чтобы оставаться в идеальной синхронизации.';

  @override
  String get speakerMode => 'Режим колонки 🔊';

  @override
  String get leave => 'Выйти';

  @override
  String get leavePartyTitle => 'Покинуть вечеринку?';

  @override
  String get leavePartyBoosterMessage =>
      'Друзья, подключённые через ваш усилитель, тоже отключатся.';

  @override
  String get leavePartyMessage =>
      'Этот телефон перестанет воспроизводить звук.';

  @override
  String get leaveParty => 'Покинуть вечеринку';

  @override
  String get audioOutput => 'Вывод звука';

  @override
  String get thisSpeaker => 'Эта колонка';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route: большая задержка Bluetooth ($latency мс), больше, чем буфер синхронизации ведущего. Попросите ведущего увеличить «Буфер синхронизации звука» до $needed мс или больше, чтобы ваш звук мог играть!';
  }

  @override
  String get echoFixTitle => 'Коррекция эха (точная настройка)';

  @override
  String get boostRangeTitle => 'Расширить зону для друзей 📡';

  @override
  String get partyWrappedUp => 'Вечеринка закончилась 🎉';

  @override
  String get hostEndedParty => 'Ведущий завершил вечеринку.';

  @override
  String partyEndedByHost(String name) {
    return '«$name» завершена ведущим.';
  }

  @override
  String get backToHome => 'На главный экран';

  @override
  String get joinAnotherParty => 'Подключиться к другой вечеринке';

  @override
  String get tuningIn => 'Настройка…';

  @override
  String get warmingUpSpeakers => 'Разогреваем колонки';

  @override
  String connectingToWifi(String ssid) {
    return 'Подключение к $ssid…';
  }

  @override
  String get partyWifi => 'Wi-Fi вечеринки';

  @override
  String get tapAllowToConnect =>
      'Нажмите «Разрешить» во всплывающем окне, чтобы подключиться.';

  @override
  String get findingHost => 'Ищем ведущего…';

  @override
  String get searchingParty => 'Ищем вечеринку в этой сети Wi-Fi.';

  @override
  String get lockingIntoSync => 'Синхронизация…';

  @override
  String get aligningBeat => 'Выравниваем ритм.';

  @override
  String get hostIsMuted => 'Ведущий выключил звук 🤫';

  @override
  String get hostMutedSubtitle =>
      'Подключено! Звук вернётся, когда он включит микрофон.';

  @override
  String get bumpingInSync => 'Качаем синхронно 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'Напрямую подключено к: $name';
  }

  @override
  String get hostFallback => 'ведущему';

  @override
  String syncedVia(String name, int depth) {
    return 'Синхронизация через: $name (шагов от микрофона: $depth)';
  }

  @override
  String get boosterFallback => 'усилителю';

  @override
  String get reSyncing => 'Повторная синхронизация…';

  @override
  String get reconnectingStream => 'Переподключение к трансляции';

  @override
  String get notConnectedYet => 'Пока не подключено';

  @override
  String get phoneSpeaker => 'Динамик телефона';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'Задержка Bluetooth (+$ms мс) компенсирована автоматически.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'Задержка колонки (+$ms мс) откалибрована автоматически.';
  }

  @override
  String get syncTiming => 'Время синхронизации';

  @override
  String get audioBuffer => 'Аудиобуфер';

  @override
  String get streamDrops => 'Потери потока';

  @override
  String get autoAdjust => 'Автокоррекция';

  @override
  String get defaultSyncZero => 'Синхронизация по умолчанию (нулевой сдвиг)';

  @override
  String nudgedEarlier(int ms) {
    return 'Сдвиг раньше на $ms мс';
  }

  @override
  String nudgedLater(int ms) {
    return 'Сдвиг позже на $ms мс';
  }

  @override
  String get reset => 'Сбросить';

  @override
  String get echoHelp =>
      'Слышите эхо? Если эта колонка звучит позже остальных, сдвиньте вправо. Если раньше — влево. (Большинство колонок и так звучат идеально!)';

  @override
  String get relayUnsupportedIos =>
      'iPhone не может раздавать Wi-Fi во время прослушивания. Попросите друга с Android включить усилитель сигнала!';

  @override
  String get relayUnsupportedAndroid =>
      'Этот телефон не поддерживает режим усилителя Wi-Fi Direct.';

  @override
  String get boostSignalTitle => 'Усилить сигнал для друзей';

  @override
  String tooFarToBoost(int depth) {
    return 'Слишком далеко от ведущего, чтобы расширять зону дальше (шагов от ведущего: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count друга',
      many: '$count друзей',
      few: '$count друзей',
      one: '$count друга',
    );
    return 'Усиливаем звук для $_temp0';
  }

  @override
  String get boostSubtitleOff =>
      'Превращает ваш телефон в усилитель Wi-Fi, чтобы подключиться могли и более далёкие друзья.';

  @override
  String get chargerTip =>
      'Подключите зарядку, если возможно: расширение зоны расходует больше заряда.';

  @override
  String get scanToConnectBooster =>
      'Сканируйте, чтобы подключиться через усилитель 📲';

  @override
  String get reconnectSameNetwork => 'Переподключиться к той же сети';

  @override
  String get retry => 'Повторить';

  @override
  String get switchLabel => 'Перейти';

  @override
  String hostLabel(String name) {
    return '$name (ведущий 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (усилитель 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · синхронизировано: $count';
  }

  @override
  String get tryAgain => 'Повторить';

  @override
  String get back => 'Назад';

  @override
  String get cancel => 'Отмена';

  @override
  String get copy => 'Копировать';

  @override
  String get show => 'Показать';

  @override
  String get hide => 'Скрыть';

  @override
  String copied(String label) {
    return 'Скопировано: $label';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'Пароль';

  @override
  String get labelAddress => 'Адрес';

  @override
  String get partyCode => 'Код вечеринки';

  @override
  String get cameraQr => 'QR для камеры';

  @override
  String get settingUpNetwork => 'Настраиваем сеть вечеринки…';

  @override
  String get qrCameraHelp =>
      'Отсканируйте приложением «Камера», чтобы сначала подключиться к Wi-Fi, затем откройте Crowd Speaker и нажмите «Я уже в этой же сети Wi-Fi».';

  @override
  String get qrAppHelp =>
      'Сканируйте в Crowd Speaker → «Подключиться к звуку». Подключает к Wi-Fi и автоматически синхронизирует звук одним касанием!';

  @override
  String get noSpeakersYet =>
      'Колонок пока нет. Попросите компанию отсканировать ваш QR-код, чтобы присоединиться!';

  @override
  String youLabel(String name) {
    return '$name (вы 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'Усилитель 📡 · синхронизировано: $count';
  }

  @override
  String bufferDetail(int ms) {
    return 'буфер $ms мс';
  }

  @override
  String dropsDetail(String pct) {
    return 'потерь $pct%';
  }

  @override
  String get errMicNeeded => 'Для роли микрофона нужен доступ к микрофону.';

  @override
  String get errNearbyCreate =>
      'Разрешите «Устройства поблизости», чтобы приложение могло создать сеть.';

  @override
  String get errNearbyShare =>
      'Разрешите «Устройства поблизости», чтобы приложение могло поделиться сетью.';

  @override
  String errNetwork(String message) {
    return 'Ошибка сети: $message';
  }

  @override
  String get noticeHotspotOff =>
      'Точка доступа ещё не включена. Включите её, и QR-код обновится сам.';

  @override
  String get noticeLostHost =>
      'Связь с ведущим потеряна. Пробуем снова, или выберите другую сеть ниже.';

  @override
  String noticeLostParent(String name) {
    return 'Связь потеряна: $name. Пробуем снова, или выберите другую сеть ниже.';
  }

  @override
  String get noticeRejectSyncing =>
      'Найден телефон-усилитель, но он ещё синхронизируется. Повторите через мгновение.';

  @override
  String get noticeRejectLoop =>
      'Этот телефон уже подключён через вас, поэтому не может быть вашим источником.';

  @override
  String noticeRejectOther(String reason) {
    return 'Найденный телефон ответил: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'Пароль Wi-Fi в этом коде содержит $length символов, а пароли Wi-Fi — от 8 до 63. Вероятно, ведущий ошибся при вводе: попросите его ввести заново или подключитесь к «$ssid» в настройках Wi-Fi и нажмите «Я уже в этой же сети Wi-Fi».';
  }

  @override
  String get errHostNotFound =>
      'Не удалось найти ведущего в этой сети Wi-Fi. Убедитесь, что ведущий в эфире и вы подключились к нужной сети.';

  @override
  String get errRelayNeedsAndroid =>
      'Для раздачи нужен телефон на Android с Wi-Fi Direct.';

  @override
  String errTooDeep(int depth, int max) {
    return 'Этот телефон слишком далеко от ведущего (шагов от ведущего: $depth, максимум $max). Подключитесь к сети ближе к ведущему, чтобы делиться.';
  }

  @override
  String notifHosting(String name) {
    return 'Ведёте «$name»';
  }

  @override
  String notifPlaying(String name) {
    return 'Воспроизведение «$name»';
  }
}
