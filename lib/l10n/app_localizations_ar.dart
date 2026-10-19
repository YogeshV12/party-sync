// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get homeTagline =>
      'حوّل هواتف أصدقائك إلى نظام صوت ضخم واحد. 🔊 هاتف واحد يمسك الميكروفون، وكل الهواتف الأخرى (مع أي سماعة بلوتوث متصلة) تشغّل الصوت بتزامن تام.';

  @override
  String get nameLabel => 'اسمك أو لقبك';

  @override
  String get nameHelper => 'ما سيراه أصدقاؤك على شاشاتهم';

  @override
  String get homeVibeTitle => 'ما الأجواء اليوم؟';

  @override
  String get hostCardTitle => 'أمسك الميكروفون 🎤';

  @override
  String get hostCardSubtitle =>
      'استضف الحفلة. كل ما تقوله أو تبثّه يُشغَّل فورًا عبر سماعات الجميع.';

  @override
  String get joinCardTitle => 'انضم إلى الصوت 🔊';

  @override
  String get joinCardSubtitle =>
      'امسح رمز QR الخاص بالمضيف. اجعل هذا الهاتف أو سماعة البلوتوث جزءًا من الحفلة.';

  @override
  String get homeTipRelay =>
      'نصيحة: يمكن لهذا الهاتف توسيع نطاق التغطية! بعد الاتصال، يمكنك مشاركة الصوت مع المزيد من الأصدقاء القريبين.';

  @override
  String get homeTipIos =>
      'يمكن لأجهزة iPhone الاستضافة أو الانضمام كسماعات. لتوسيع نطاق الإشارة للأصدقاء الأبعد، استخدم هاتف أندرويد.';

  @override
  String get homeTipDefault => 'جاهز لاستضافة الحفلة أو الانضمام إلى الصوت!';

  @override
  String get scanHostQr => 'مسح رمز QR الخاص بالمضيف';

  @override
  String get scanHostQrSubtitle =>
      'اتصال بلمسة واحدة: يتصل بشبكة Wi-Fi ويزامن الصوت تلقائيًا';

  @override
  String get alreadyOnWifi => 'أنا متصل بنفس شبكة Wi-Fi بالفعل';

  @override
  String get connectManually => 'الاتصال يدويًا';

  @override
  String get wifiNameLabel => 'اسم شبكة Wi-Fi';

  @override
  String get wifiPasswordLabel => 'كلمة مرور Wi-Fi';

  @override
  String get hostIpLabel => 'عنوان IP للمضيف (اختياري)';

  @override
  String get hostIpHelper => 'تجده أسفل رمز QR الخاص بالمضيف';

  @override
  String get connectToParty => 'الاتصال بالحفلة';

  @override
  String get enterWifiName => 'يُرجى إدخال اسم شبكة Wi-Fi.';

  @override
  String get joinTipIos =>
      'عند الطلب، اضغط \"انضمام\" للاتصال. أبقِ Crowd Speaker مفتوحًا حتى يستمر الصوت!';

  @override
  String get joinTipAndroid =>
      'عند الطلب، اضغط لقبول اتصال Wi-Fi وستنضم إلى الحفلة مباشرة.';

  @override
  String get scannerNotACode =>
      'هذا ليس رمز Crowd Speaker. امسح رمز QR على شاشة صديقك!';

  @override
  String get scannerHint => 'وجّه الكاميرا نحو رمز QR على شاشة صديقك.';

  @override
  String get hostSetupTitle => 'استضف الحفلة 🎤';

  @override
  String get partyNameLabel => 'اسم الحفلة';

  @override
  String get partyNameHelper => 'ما سيراه الأصدقاء عند الانضمام';

  @override
  String partyNameDefault(String name) {
    return 'حفلة $name';
  }

  @override
  String get defaultPartyName => 'حفلة';

  @override
  String get connectQuestion => 'كيف سيتصل الأصدقاء؟';

  @override
  String get instantNetworkTitle => 'شبكة حفلة فورية';

  @override
  String get badgeEasiest => 'الأسهل';

  @override
  String get instantNetworkSubtitle =>
      'لا يحتاج إلى أي إعداد. ينشئ شبكة محلية فورية ليدخلها الجميع. (لا حاجة إلى الإنترنت).';

  @override
  String get usePersonalHotspot => 'استخدام نقطة الاتصال الشخصية';

  @override
  String get useMyHotspot => 'استخدام نقطة اتصال هاتفي';

  @override
  String get hotspotSubtitle =>
      'فعّل نقطة اتصال هاتفك يدويًا. كما يتيح لأصدقائك مشاركة إنترنت هاتفك.';

  @override
  String get hotspotInfoIos =>
      'فعّل \"نقطة الاتصال الشخصية\" من الإعدادات (\"السماح للآخرين بالانضمام\")، ثم أدخل أدناه اسم iPhone وكلمة مرور نقطة الاتصال ليتمكن الأصدقاء من الانضمام.';

  @override
  String get hotspotInfoAndroid =>
      'فعّل نقطة الاتصال من الإعدادات، ثم أدخل أدناه اسم شبكة Wi-Fi وكلمة المرور ليتمكن الأصدقاء من الانضمام.';

  @override
  String get openHotspotSettings => 'فتح إعدادات نقطة الاتصال';

  @override
  String get hotspotSettingsHint =>
      'افتح الإعدادات ← نقطة الاتصال الشخصية وفعّل \"السماح للآخرين بالانضمام\".';

  @override
  String get hotspotWifiNameLabel => 'اسم Wi-Fi لنقطة الاتصال';

  @override
  String get hotspotPasswordLabel => 'كلمة مرور نقطة الاتصال';

  @override
  String get enterHotspotName =>
      'أدخل اسم نقطة الاتصال ليتمكن الأصدقاء من الانضمام.';

  @override
  String get invalidWifiPassword =>
      'يجب أن تتكون كلمات مرور Wi-Fi من 8 إلى 63 حرفًا. تحقق من إعدادات نقطة الاتصال وحاول مجددًا!';

  @override
  String get audioTuning => 'ضبط الصوت';

  @override
  String get filterNoiseTitle => 'تصفية ضجيج الخلفية';

  @override
  String get filterNoiseSubtitle =>
      'يحافظ على وضوح الأصوات. أوقفه إذا كنت تشغّل موسيقى بصوت عالٍ أو تستخدم معدات DJ.';

  @override
  String get startParty => 'ابدأ الحفلة 🔥';

  @override
  String get onTheMic => 'على الميكروفون 🎤';

  @override
  String get endParty => 'إنهاء الحفلة';

  @override
  String get endPartyTitle => 'إنهاء الحفلة؟';

  @override
  String get endPartyMessage => 'سيؤدي هذا إلى فصل جميع السماعات وإيقاف الصوت.';

  @override
  String get somethingWentWrong => 'حدث خطأ ما.';

  @override
  String get firingUpParty => 'جارٍ إشعال الحفلة…';

  @override
  String get creatingPartyNetwork => 'جارٍ إنشاء شبكة حفلتك';

  @override
  String get scanToJoinSound => 'امسح للانضمام إلى الصوت 📲';

  @override
  String get syncBufferTitle => 'مخزن مزامنة الصوت';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count هاتف متصل',
      many: '$count هاتفًا متصلًا',
      few: '$count هواتف متصلة',
      two: 'هاتفان متصلان',
      one: 'هاتف واحد متصل',
      zero: 'لا هواتف متصلة',
    );
    return 'سماعات المجموعة · $_temp0';
  }

  @override
  String get micMuted => 'الميكروفون مكتوم 🤫';

  @override
  String get liveOnAir => 'بث مباشر 🎙️';

  @override
  String get tapToUnmute => 'اضغط على الميكروفون لإلغاء الكتم والعودة';

  @override
  String get waitingForSquad => 'في انتظار أن يمسح الأصدقاء الرمز وينضموا…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سماعة هاتف',
      many: '$count سماعة هاتف',
      few: '$count سماعات هاتف',
      two: 'سماعتي هاتف',
      one: 'سماعة هاتف واحدة',
      zero: 'لا سماعات هاتف',
    );
    return 'بث مباشر إلى $_temp0';
  }

  @override
  String get bufferDelayLabel => 'تأخير المخزن قبل تشغيل الصوت';

  @override
  String get syncBufferHelp =>
      'ارفعه إذا تقطّع الصوت أو انقطع. تحتاج سماعات البلوتوث ومقويات الإشارة إلى مخزن أكبر قليلًا لتبقى متزامنة تمامًا.';

  @override
  String get speakerMode => 'وضع السماعة 🔊';

  @override
  String get leave => 'مغادرة';

  @override
  String get leavePartyTitle => 'مغادرة الحفلة؟';

  @override
  String get leavePartyBoosterMessage =>
      'سيُفصل أيضًا الأصدقاء المتصلون عبر مقوّي الإشارة الخاص بك.';

  @override
  String get leavePartyMessage => 'سيتوقف هذا الهاتف عن تشغيل الصوت.';

  @override
  String get leaveParty => 'مغادرة الحفلة';

  @override
  String get audioOutput => 'مخرج الصوت';

  @override
  String get thisSpeaker => 'هذه السماعة';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route لديها تأخير بلوتوث مرتفع ($latency مللي ثانية)، وهو أطول من مخزن مزامنة المضيف. اطلب من المضيف رفع \"مخزن مزامنة الصوت\" إلى $needed مللي ثانية أو أكثر ليتمكن صوتك من العمل!';
  }

  @override
  String get echoFixTitle => 'إصلاح الصدى (ضبط دقيق للمزامنة)';

  @override
  String get boostRangeTitle => 'وسّع النطاق للأصدقاء 📡';

  @override
  String get partyWrappedUp => 'انتهت الحفلة 🎉';

  @override
  String get hostEndedParty => 'أنهى المضيف الحفلة.';

  @override
  String partyEndedByHost(String name) {
    return 'أنهى المضيف \"$name\".';
  }

  @override
  String get backToHome => 'العودة إلى الرئيسية';

  @override
  String get joinAnotherParty => 'الانضمام إلى حفلة أخرى';

  @override
  String get tuningIn => 'جارٍ الاتصال…';

  @override
  String get warmingUpSpeakers => 'جارٍ تسخين السماعات';

  @override
  String connectingToWifi(String ssid) {
    return 'جارٍ الاتصال بـ $ssid…';
  }

  @override
  String get partyWifi => 'شبكة Wi-Fi الحفلة';

  @override
  String get tapAllowToConnect => 'اضغط \"سماح\" في النافذة المنبثقة للاتصال.';

  @override
  String get findingHost => 'جارٍ البحث عن المضيف…';

  @override
  String get searchingParty => 'جارٍ البحث عن الحفلة على شبكة Wi-Fi هذه.';

  @override
  String get lockingIntoSync => 'جارٍ تثبيت المزامنة…';

  @override
  String get aligningBeat => 'جارٍ ضبط توقيت الإيقاع.';

  @override
  String get hostIsMuted => 'المضيف مكتوم 🤫';

  @override
  String get hostMutedSubtitle =>
      'تم الاتصال! سيعود الصوت عندما يلغي المضيف الكتم.';

  @override
  String get bumpingInSync => 'الحماس متزامن 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'متصل مباشرة بـ $name';
  }

  @override
  String get hostFallback => 'المضيف';

  @override
  String syncedVia(String name, int depth) {
    return 'متزامن عبر $name (القفزات من الميكروفون: $depth)';
  }

  @override
  String get boosterFallback => 'مقوّي الإشارة';

  @override
  String get reSyncing => 'جارٍ إعادة المزامنة…';

  @override
  String get reconnectingStream => 'جارٍ إعادة الاتصال بالبث';

  @override
  String get notConnectedYet => 'غير متصل بعد';

  @override
  String get phoneSpeaker => 'سماعة الهاتف';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'تم تصفير تأخير البلوتوث (+$ms مللي ثانية) تلقائيًا.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'تمت معايرة تأخير السماعة (+$ms مللي ثانية) تلقائيًا.';
  }

  @override
  String get syncTiming => 'توقيت المزامنة';

  @override
  String get audioBuffer => 'مخزن الصوت';

  @override
  String get streamDrops => 'انقطاعات البث';

  @override
  String get autoAdjust => 'ضبط تلقائي';

  @override
  String get defaultSyncZero => 'المزامنة الافتراضية (إزاحة صفر)';

  @override
  String nudgedEarlier(int ms) {
    return 'تم التقديم $ms مللي ثانية';
  }

  @override
  String nudgedLater(int ms) {
    return 'تم التأخير $ms مللي ثانية';
  }

  @override
  String get reset => 'إعادة ضبط';

  @override
  String get echoHelp =>
      'تسمع صدى؟ إذا كانت هذه السماعة متأخرة عن المجموعة فمرّر لليمين، وإذا كانت متقدمة فمرّر لليسار. (معظم السماعات تعمل بشكل ممتاز دون هذا!)';

  @override
  String get relayUnsupportedIos =>
      'لا يمكن لأجهزة iPhone مشاركة Wi-Fi أثناء الاستماع. اطلب من صديق يستخدم أندرويد تفعيل مقوّي الإشارة!';

  @override
  String get relayUnsupportedAndroid =>
      'هذا الهاتف لا يدعم وضع مقوّي Wi-Fi Direct.';

  @override
  String get boostSignalTitle => 'تقوية الإشارة للأصدقاء';

  @override
  String tooFarToBoost(int depth) {
    return 'بعيد جدًا عن المضيف لتوسيع النطاق أكثر (القفزات من المضيف: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صديق',
      many: '$count صديقًا',
      few: '$count أصدقاء',
      two: 'صديقين',
      one: 'صديق واحد',
      zero: 'لا أصدقاء',
    );
    return 'جارٍ تقوية الصوت لـ $_temp0';
  }

  @override
  String get boostSubtitleOff =>
      'يحوّل هاتفك إلى مقوٍّ لشبكة Wi-Fi ليتمكن الأصدقاء الأبعد من الاتصال.';

  @override
  String get chargerTip =>
      'صِل الشاحن إن أمكن: توسيع النطاق يستهلك بطارية إضافية.';

  @override
  String get scanToConnectBooster => 'امسح للاتصال عبر مقوّي الإشارة 📲';

  @override
  String get reconnectSameNetwork => 'إعادة الاتصال بنفس الشبكة';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get switchLabel => 'تبديل';

  @override
  String hostLabel(String name) {
    return '$name (مضيف 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (مقوّي إشارة 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · متزامن: $count';
  }

  @override
  String get tryAgain => 'حاول مرة أخرى';

  @override
  String get back => 'رجوع';

  @override
  String get cancel => 'إلغاء';

  @override
  String get copy => 'نسخ';

  @override
  String get show => 'إظهار';

  @override
  String get hide => 'إخفاء';

  @override
  String copied(String label) {
    return 'تم نسخ $label';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'كلمة المرور';

  @override
  String get labelAddress => 'العنوان';

  @override
  String get partyCode => 'رمز الحفلة';

  @override
  String get cameraQr => 'QR للكاميرا';

  @override
  String get settingUpNetwork => 'جارٍ إعداد شبكة الحفلة…';

  @override
  String get qrCameraHelp =>
      'امسح بتطبيق الكاميرا في هاتفك للانضمام إلى شبكة Wi-Fi أولًا، ثم افتح Crowd Speaker واضغط \"أنا متصل بنفس شبكة Wi-Fi بالفعل\".';

  @override
  String get qrAppHelp =>
      'امسح باستخدام Crowd Speaker ← \"انضم إلى الصوت\". يتصل بشبكة Wi-Fi ويزامن الصوت تلقائيًا بلمسة واحدة!';

  @override
  String get noSpeakersYet =>
      'لا توجد سماعات بعد. اطلب من أصدقائك مسح رمز QR الخاص بك للانضمام!';

  @override
  String youLabel(String name) {
    return '$name (أنت 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'مقوّي إشارة 📡 · متزامن: $count';
  }

  @override
  String bufferDetail(int ms) {
    return 'مخزن $ms مللي ثانية';
  }

  @override
  String dropsDetail(String pct) {
    return 'انقطاع $pct%';
  }

  @override
  String get errMicNeeded => 'يلزم الوصول إلى الميكروفون لتكون أنت الميكروفون.';

  @override
  String get errNearbyCreate =>
      'اسمح بـ \"الأجهزة القريبة\" ليتمكن التطبيق من إنشاء شبكة.';

  @override
  String get errNearbyShare =>
      'اسمح بـ \"الأجهزة القريبة\" ليتمكن التطبيق من مشاركة شبكة.';

  @override
  String errNetwork(String message) {
    return 'خطأ في الشبكة: $message';
  }

  @override
  String get noticeHotspotOff =>
      'نقطة الاتصال لديك غير مفعّلة بعد. فعّلها وسيتحدث رمز QR تلقائيًا.';

  @override
  String get noticeLostHost =>
      'انقطع الاتصال بالمضيف. تجري إعادة المحاولة، أو اختر شبكة أخرى أدناه.';

  @override
  String noticeLostParent(String name) {
    return 'انقطع الاتصال بـ $name. تجري إعادة المحاولة، أو اختر شبكة أخرى أدناه.';
  }

  @override
  String get noticeRejectSyncing =>
      'تم العثور على هاتف مقوٍّ للإشارة لكنه لا يزال يزامن. حاول مجددًا بعد قليل.';

  @override
  String get noticeRejectLoop =>
      'ذلك الهاتف متصل بالفعل عبرك، فلا يمكن أن يكون مصدرك.';

  @override
  String noticeRejectOther(String reason) {
    return 'ردّ هاتف تم العثور عليه: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'كلمة مرور Wi-Fi في هذا الرمز مكوّنة من $length حرفًا، لكن كلمات مرور Wi-Fi تتكون من 8 إلى 63 حرفًا. ربما أخطأ المضيف في كتابتها: اطلب منه إعادة إدخالها، أو انضم إلى \"$ssid\" من إعدادات Wi-Fi ثم اضغط \"أنا متصل بنفس شبكة Wi-Fi بالفعل\".';
  }

  @override
  String get errHostNotFound =>
      'تعذّر العثور على المضيف على شبكة Wi-Fi هذه. تأكد من أن المضيف يبث وأنك انضممت إلى الشبكة الصحيحة.';

  @override
  String get errRelayNeedsAndroid =>
      'تتطلب المشاركة هاتف أندرويد يدعم Wi-Fi Direct.';

  @override
  String errTooDeep(int depth, int max) {
    return 'هذا الهاتف بعيد جدًا عن المضيف (القفزات من المضيف: $depth، الحد الأقصى $max). انضم إلى شبكة أقرب إلى المضيف للمشاركة.';
  }

  @override
  String notifHosting(String name) {
    return 'استضافة \"$name\"';
  }

  @override
  String notifPlaying(String name) {
    return 'تشغيل \"$name\"';
  }
}
