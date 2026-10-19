// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get homeTagline =>
      'Convierte los móviles de tu grupo en un sistema de sonido enorme. 🔊 Un móvil toma el micro y todos los demás (y cualquier altavoz Bluetooth conectado) reproducen el sonido sincronizados.';

  @override
  String get nameLabel => 'Tu nombre o apodo';

  @override
  String get nameHelper => 'Lo que verá el grupo en su pantalla';

  @override
  String get homeVibeTitle => '¿Cuál es el plan?';

  @override
  String get hostCardTitle => 'Toma el micro 🎤';

  @override
  String get hostCardSubtitle =>
      'Organiza la fiesta. Lo que digas o transmitas suena en tiempo real por los altavoces de todos.';

  @override
  String get joinCardTitle => 'Súmate al sonido 🔊';

  @override
  String get joinCardSubtitle =>
      'Escanea el código QR del anfitrión. Convierte este móvil o tu altavoz Bluetooth en parte de la fiesta.';

  @override
  String get homeTipRelay =>
      'Consejo: ¡este móvil puede ampliar el alcance! Una vez conectado, puedes compartir el sonido con más amigos cerca.';

  @override
  String get homeTipIos =>
      'Los iPhone pueden organizar o unirse como altavoces. Para ampliar el alcance a amigos más lejanos, usa un móvil Android.';

  @override
  String get homeTipDefault =>
      '¡Listo para organizar la fiesta o unirte al sonido!';

  @override
  String get scanHostQr => 'Escanear QR del anfitrión';

  @override
  String get scanHostQrSubtitle =>
      'Conexión con un toque: se une al Wi-Fi y sincroniza el sonido automáticamente';

  @override
  String get alreadyOnWifi => 'Ya estoy en la misma red Wi-Fi';

  @override
  String get connectManually => 'Conectar manualmente';

  @override
  String get wifiNameLabel => 'Nombre del Wi-Fi';

  @override
  String get wifiPasswordLabel => 'Contraseña del Wi-Fi';

  @override
  String get hostIpLabel => 'Dirección IP del anfitrión (opcional)';

  @override
  String get hostIpHelper => 'Aparece debajo del código QR del anfitrión';

  @override
  String get connectToParty => 'Conectar a la fiesta';

  @override
  String get enterWifiName => 'Introduce el nombre del Wi-Fi.';

  @override
  String get joinTipIos =>
      'Cuando se te pida, toca \"Unirse\" para conectar. ¡Mantén Crowd Speaker abierta para que el sonido siga sonando!';

  @override
  String get joinTipAndroid =>
      'Cuando se te pida, toca para aceptar la conexión Wi-Fi y entrarás directo a la fiesta.';

  @override
  String get scannerNotACode =>
      'Ese no es un código de Crowd Speaker. ¡Escanea el QR en la pantalla de tu amigo!';

  @override
  String get scannerHint =>
      'Apunta la cámara al código QR en la pantalla de tu amigo.';

  @override
  String get hostSetupTitle => 'Organiza la fiesta 🎤';

  @override
  String get partyNameLabel => 'Nombre de la fiesta';

  @override
  String get partyNameHelper => 'Lo que verán tus amigos al unirse';

  @override
  String partyNameDefault(String name) {
    return 'Fiesta de $name';
  }

  @override
  String get defaultPartyName => 'Fiesta';

  @override
  String get connectQuestion => '¿Cómo se conectarán tus amigos?';

  @override
  String get instantNetworkTitle => 'Red de fiesta instantánea';

  @override
  String get badgeEasiest => 'La más fácil';

  @override
  String get instantNetworkSubtitle =>
      'Sin configuración. Crea al instante una red local para que todos se conecten. (No necesita internet).';

  @override
  String get usePersonalHotspot => 'Usar Punto de acceso personal';

  @override
  String get useMyHotspot => 'Usar la zona Wi-Fi de mi móvil';

  @override
  String get hotspotSubtitle =>
      'Activa manualmente la zona Wi-Fi de tu móvil. También permite a tus amigos usar tu internet móvil.';

  @override
  String get hotspotInfoIos =>
      'Activa el Punto de acceso personal en Ajustes (\"Permitir que otros se conecten\") y escribe abajo el nombre de tu iPhone y la contraseña para que tus amigos puedan unirse.';

  @override
  String get hotspotInfoAndroid =>
      'Activa la zona Wi-Fi en Ajustes y escribe abajo el nombre y la contraseña de tu Wi-Fi para que tus amigos puedan unirse.';

  @override
  String get openHotspotSettings => 'Abrir ajustes de zona Wi-Fi';

  @override
  String get hotspotSettingsHint =>
      'Abre Ajustes → Punto de acceso personal y activa \"Permitir que otros se conecten\".';

  @override
  String get hotspotWifiNameLabel => 'Nombre del Wi-Fi de la zona';

  @override
  String get hotspotPasswordLabel => 'Contraseña de la zona';

  @override
  String get enterHotspotName =>
      'Introduce el nombre de tu zona Wi-Fi para que tus amigos puedan unirse.';

  @override
  String get invalidWifiPassword =>
      'Las contraseñas Wi-Fi deben tener entre 8 y 63 caracteres. ¡Revisa los ajustes de tu zona Wi-Fi e inténtalo de nuevo!';

  @override
  String get audioTuning => 'Ajuste de audio';

  @override
  String get filterNoiseTitle => 'Filtrar ruido de fondo';

  @override
  String get filterNoiseSubtitle =>
      'Mantiene las voces nítidas. Desactívalo si pones música a todo volumen o usas equipo de DJ.';

  @override
  String get startParty => 'Empezar la fiesta 🔥';

  @override
  String get onTheMic => 'Con el micro 🎤';

  @override
  String get endParty => 'Terminar fiesta';

  @override
  String get endPartyTitle => '¿Terminar la fiesta?';

  @override
  String get endPartyMessage =>
      'Se desconectarán todos los altavoces y se detendrá el sonido.';

  @override
  String get somethingWentWrong => 'Algo salió mal.';

  @override
  String get firingUpParty => 'Preparando la fiesta…';

  @override
  String get creatingPartyNetwork => 'Creando tu red de fiesta';

  @override
  String get scanToJoinSound => 'Escanea para unirte al sonido 📲';

  @override
  String get syncBufferTitle => 'Búfer de sincronización';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count móviles conectados',
      one: '$count móvil conectado',
    );
    return 'Altavoces del grupo · $_temp0';
  }

  @override
  String get micMuted => 'Micro silenciado 🤫';

  @override
  String get liveOnAir => 'En directo 🎙️';

  @override
  String get tapToUnmute => 'Toca el micro para activarlo y volver';

  @override
  String get waitingForSquad => 'Esperando a que el grupo escanee y se una…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count móviles altavoz',
      one: '$count móvil altavoz',
    );
    return 'Transmitiendo en directo a $_temp0';
  }

  @override
  String get bufferDelayLabel => 'Retardo del búfer antes de reproducir';

  @override
  String get syncBufferHelp =>
      'Súbelo si el audio se entrecorta o se pierde. Los altavoces Bluetooth y los repetidores de señal necesitan algo más de búfer para mantenerse perfectamente sincronizados.';

  @override
  String get speakerMode => 'Modo altavoz 🔊';

  @override
  String get leave => 'Salir';

  @override
  String get leavePartyTitle => '¿Salir de la fiesta?';

  @override
  String get leavePartyBoosterMessage =>
      'Los amigos conectados a través de tu repetidor también se desconectarán.';

  @override
  String get leavePartyMessage => 'Este móvil dejará de reproducir sonido.';

  @override
  String get leaveParty => 'Salir de la fiesta';

  @override
  String get audioOutput => 'Salida de audio';

  @override
  String get thisSpeaker => 'Este altavoz';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route tiene un retardo Bluetooth alto ($latency ms), mayor que el búfer de sincronización del anfitrión. Pide al anfitrión que suba el \"Búfer de sincronización\" a $needed ms o más para que tu sonido pueda reproducirse.';
  }

  @override
  String get echoFixTitle => 'Corrección de eco (ajuste fino)';

  @override
  String get boostRangeTitle => 'Amplía el alcance para tus amigos 📡';

  @override
  String get partyWrappedUp => 'La fiesta ha terminado 🎉';

  @override
  String get hostEndedParty => 'El anfitrión terminó la fiesta.';

  @override
  String partyEndedByHost(String name) {
    return 'El anfitrión terminó \"$name\".';
  }

  @override
  String get backToHome => 'Volver al inicio';

  @override
  String get joinAnotherParty => 'Unirse a otra fiesta';

  @override
  String get tuningIn => 'Sintonizando…';

  @override
  String get warmingUpSpeakers => 'Calentando los altavoces';

  @override
  String connectingToWifi(String ssid) {
    return 'Conectando a $ssid…';
  }

  @override
  String get partyWifi => 'el Wi-Fi de la fiesta';

  @override
  String get tapAllowToConnect =>
      'Toca Permitir en la ventana emergente para conectar.';

  @override
  String get findingHost => 'Buscando al anfitrión…';

  @override
  String get searchingParty => 'Buscando la fiesta en este Wi-Fi.';

  @override
  String get lockingIntoSync => 'Sincronizando…';

  @override
  String get aligningBeat => 'Alineando el ritmo.';

  @override
  String get hostIsMuted => 'El anfitrión está en silencio 🤫';

  @override
  String get hostMutedSubtitle =>
      '¡Conectado! El sonido volverá cuando active el micro.';

  @override
  String get bumpingInSync => 'Sonando sincronizado 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'Conectado directamente a $name';
  }

  @override
  String get hostFallback => 'el anfitrión';

  @override
  String syncedVia(String name, int depth) {
    return 'Sincronizado vía $name (saltos desde el micro: $depth)';
  }

  @override
  String get boosterFallback => 'el repetidor';

  @override
  String get reSyncing => 'Resincronizando…';

  @override
  String get reconnectingStream => 'Reconectando a la transmisión';

  @override
  String get notConnectedYet => 'Aún sin conexión';

  @override
  String get phoneSpeaker => 'Altavoz del móvil';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'Retardo Bluetooth (+$ms ms) compensado automáticamente.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'Retardo del altavoz (+$ms ms) calibrado automáticamente.';
  }

  @override
  String get syncTiming => 'Sincronización';

  @override
  String get audioBuffer => 'Búfer de audio';

  @override
  String get streamDrops => 'Pérdidas de señal';

  @override
  String get autoAdjust => 'Ajuste automático';

  @override
  String get defaultSyncZero => 'Sincronización por defecto (desfase cero)';

  @override
  String nudgedEarlier(int ms) {
    return 'Adelantado $ms ms';
  }

  @override
  String nudgedLater(int ms) {
    return 'Retrasado $ms ms';
  }

  @override
  String get reset => 'Restablecer';

  @override
  String get echoHelp =>
      '¿Oyes eco? Si este altavoz suena por detrás del grupo, desliza a la derecha. Si suena por delante, a la izquierda. (¡La mayoría de los altavoces suenan perfectos sin esto!)';

  @override
  String get relayUnsupportedIos =>
      'Los iPhone no pueden compartir Wi-Fi mientras escuchan. ¡Pide a un amigo con Android que active el repetidor!';

  @override
  String get relayUnsupportedAndroid =>
      'Este móvil no admite el modo repetidor Wi-Fi Direct.';

  @override
  String get boostSignalTitle => 'Reforzar señal para amigos';

  @override
  String tooFarToBoost(int depth) {
    return 'Demasiado lejos del anfitrión para ampliar más el alcance (saltos desde el anfitrión: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count amigos',
      one: '$count amigo',
    );
    return 'Reforzando el sonido para $_temp0';
  }

  @override
  String get boostSubtitleOff =>
      'Convierte tu móvil en un repetidor Wi-Fi para que los amigos más lejanos puedan conectarse.';

  @override
  String get chargerTip =>
      'Conéctalo al cargador si puedes: ampliar el alcance consume más batería.';

  @override
  String get scanToConnectBooster =>
      'Escanea para conectar mediante el repetidor 📲';

  @override
  String get reconnectSameNetwork => 'Reconectar a la misma red';

  @override
  String get retry => 'Reintentar';

  @override
  String get switchLabel => 'Cambiar';

  @override
  String hostLabel(String name) {
    return '$name (anfitrión 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (repetidor 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · sincronizados: $count';
  }

  @override
  String get tryAgain => 'Intentar de nuevo';

  @override
  String get back => 'Atrás';

  @override
  String get cancel => 'Cancelar';

  @override
  String get copy => 'Copiar';

  @override
  String get show => 'Mostrar';

  @override
  String get hide => 'Ocultar';

  @override
  String copied(String label) {
    return '$label copiado';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'Contraseña';

  @override
  String get labelAddress => 'Dirección';

  @override
  String get partyCode => 'Código de fiesta';

  @override
  String get cameraQr => 'QR para cámara';

  @override
  String get settingUpNetwork => 'Preparando la red de la fiesta…';

  @override
  String get qrCameraHelp =>
      'Escanea con la app Cámara de tu móvil para unirte primero al Wi-Fi; luego abre Crowd Speaker y toca \"Ya estoy en la misma red Wi-Fi\".';

  @override
  String get qrAppHelp =>
      'Escanea con Crowd Speaker → \"Súmate al sonido\". ¡Se conecta al Wi-Fi y sincroniza el sonido automáticamente con un toque!';

  @override
  String get noSpeakersYet =>
      'Aún no hay altavoces. ¡Pide al grupo que escanee tu código QR para sumarse!';

  @override
  String youLabel(String name) {
    return '$name (tú 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'Repetidor 📡 · sincronizados: $count';
  }

  @override
  String bufferDetail(int ms) {
    return 'búfer de $ms ms';
  }

  @override
  String dropsDetail(String pct) {
    return '$pct% de pérdidas';
  }

  @override
  String get errMicNeeded =>
      'Se necesita acceso al micrófono para ser el micro.';

  @override
  String get errNearbyCreate =>
      'Permite \"Dispositivos cercanos\" para que la app pueda crear una red.';

  @override
  String get errNearbyShare =>
      'Permite \"Dispositivos cercanos\" para que la app pueda compartir una red.';

  @override
  String errNetwork(String message) {
    return 'Error de red: $message';
  }

  @override
  String get noticeHotspotOff =>
      'Tu zona Wi-Fi aún no está activada. Actívala y el código QR se actualizará solo.';

  @override
  String get noticeLostHost =>
      'Se perdió la conexión con el anfitrión. Reintentando, o elige otra red abajo.';

  @override
  String noticeLostParent(String name) {
    return 'Se perdió la conexión con $name. Reintentando, o elige otra red abajo.';
  }

  @override
  String get noticeRejectSyncing =>
      'Se encontró un móvil repetidor, pero aún se está sincronizando. Inténtalo de nuevo en un momento.';

  @override
  String get noticeRejectLoop =>
      'Ese móvil ya está conectado a través de ti, así que no puede ser tu fuente.';

  @override
  String noticeRejectOther(String reason) {
    return 'Se encontró un móvil que dijo: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'La contraseña Wi-Fi de este código tiene $length caracteres, pero las contraseñas Wi-Fi tienen entre 8 y 63. Probablemente el anfitrión la escribió mal: pídele que la vuelva a introducir, o únete a \"$ssid\" en los ajustes de Wi-Fi y toca \"Ya estoy en la misma red Wi-Fi\".';
  }

  @override
  String get errHostNotFound =>
      'No se encontró al anfitrión en este Wi-Fi. Comprueba que el anfitrión esté en directo y que te hayas unido a la red correcta.';

  @override
  String get errRelayNeedsAndroid =>
      'Compartir requiere un móvil Android con Wi-Fi Direct.';

  @override
  String errTooDeep(int depth, int max) {
    return 'Este móvil está demasiado lejos del anfitrión (saltos desde el anfitrión: $depth, máx. $max). Únete a una red más cercana al anfitrión para compartir.';
  }

  @override
  String notifHosting(String name) {
    return 'Organizando \"$name\"';
  }

  @override
  String notifPlaying(String name) {
    return 'Reproduciendo \"$name\"';
  }
}
