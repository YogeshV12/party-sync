// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get homeTagline =>
      'Transformez les téléphones de votre bande en un énorme système sonore. 🔊 Un téléphone prend le micro, et tous les autres (ainsi que toute enceinte Bluetooth connectée) diffusent le son en synchro.';

  @override
  String get nameLabel => 'Votre nom ou pseudo';

  @override
  String get nameHelper => 'Ce que la bande verra sur son écran';

  @override
  String get homeVibeTitle => 'Quel est le programme ?';

  @override
  String get hostCardTitle => 'Prenez le micro 🎤';

  @override
  String get hostCardSubtitle =>
      'Organisez la fête. Tout ce que vous dites ou diffusez passe en temps réel par les haut-parleurs de tout le monde.';

  @override
  String get joinCardTitle => 'Rejoindre le son 🔊';

  @override
  String get joinCardSubtitle =>
      'Scannez le QR code de l\'hôte. Faites de ce téléphone ou de votre enceinte Bluetooth une partie de la fête.';

  @override
  String get homeTipRelay =>
      'Astuce : ce téléphone peut étendre la portée ! Une fois connecté, vous pouvez partager le son avec encore plus d\'amis à proximité.';

  @override
  String get homeTipIos =>
      'Les iPhone peuvent organiser ou rejoindre comme haut-parleurs. Pour étendre la portée vers des amis plus éloignés, utilisez un téléphone Android.';

  @override
  String get homeTipDefault =>
      'Prêt à organiser la fête ou à rejoindre le son !';

  @override
  String get scanHostQr => 'Scanner le QR code de l\'hôte';

  @override
  String get scanHostQrSubtitle =>
      'Connexion en un geste : se connecte au Wi-Fi et synchronise le son automatiquement';

  @override
  String get alreadyOnWifi => 'Je suis déjà sur le même Wi-Fi';

  @override
  String get connectManually => 'Se connecter manuellement';

  @override
  String get wifiNameLabel => 'Nom du Wi-Fi';

  @override
  String get wifiPasswordLabel => 'Mot de passe du Wi-Fi';

  @override
  String get hostIpLabel => 'Adresse IP de l\'hôte (facultatif)';

  @override
  String get hostIpHelper => 'Indiquée sous le QR code de l\'hôte';

  @override
  String get connectToParty => 'Rejoindre la fête';

  @override
  String get enterWifiName => 'Veuillez saisir le nom du Wi-Fi.';

  @override
  String get joinTipIos =>
      'Quand c\'est demandé, touchez « Rejoindre » pour vous connecter. Gardez Crowd Speaker ouverte pour que le son continue !';

  @override
  String get joinTipAndroid =>
      'Quand c\'est demandé, touchez pour accepter la connexion Wi-Fi et vous entrerez directement dans la fête.';

  @override
  String get scannerNotACode =>
      'Ce n\'est pas un code Crowd Speaker. Scannez le QR sur l\'écran de votre ami !';

  @override
  String get scannerHint =>
      'Pointez la caméra vers le QR code sur l\'écran de votre ami.';

  @override
  String get hostSetupTitle => 'Organiser la fête 🎤';

  @override
  String get partyNameLabel => 'Nom de la fête';

  @override
  String get partyNameHelper => 'Ce que vos amis verront en rejoignant';

  @override
  String partyNameDefault(String name) {
    return 'La fête de $name';
  }

  @override
  String get defaultPartyName => 'Fête';

  @override
  String get connectQuestion => 'Comment vos amis se connectent-ils ?';

  @override
  String get instantNetworkTitle => 'Réseau de fête instantané';

  @override
  String get badgeEasiest => 'Le plus simple';

  @override
  String get instantNetworkSubtitle =>
      'Aucune configuration. Crée instantanément une bulle locale où tout le monde peut se connecter. (Pas besoin d\'Internet).';

  @override
  String get usePersonalHotspot => 'Utiliser le Partage de connexion';

  @override
  String get useMyHotspot => 'Utiliser le point d\'accès de mon téléphone';

  @override
  String get hotspotSubtitle =>
      'Activez manuellement le point d\'accès de votre téléphone. Permet aussi à vos amis de profiter de votre Internet mobile.';

  @override
  String get hotspotInfoIos =>
      'Activez le Partage de connexion dans Réglages (« Autoriser d\'autres utilisateurs à se connecter »), puis saisissez ci-dessous le nom de votre iPhone et le mot de passe pour que vos amis puissent rejoindre.';

  @override
  String get hotspotInfoAndroid =>
      'Activez votre point d\'accès dans les Paramètres, puis saisissez ci-dessous le nom et le mot de passe de votre Wi-Fi pour que vos amis puissent rejoindre.';

  @override
  String get openHotspotSettings => 'Ouvrir les réglages du point d\'accès';

  @override
  String get hotspotSettingsHint =>
      'Ouvrez Réglages → Partage de connexion et activez « Autoriser d\'autres utilisateurs à se connecter ».';

  @override
  String get hotspotWifiNameLabel => 'Nom du Wi-Fi du point d\'accès';

  @override
  String get hotspotPasswordLabel => 'Mot de passe du point d\'accès';

  @override
  String get enterHotspotName =>
      'Saisissez le nom de votre point d\'accès pour que vos amis puissent rejoindre.';

  @override
  String get invalidWifiPassword =>
      'Les mots de passe Wi-Fi doivent comporter de 8 à 63 caractères. Vérifiez les réglages de votre point d\'accès et réessayez !';

  @override
  String get audioTuning => 'Réglages audio';

  @override
  String get filterNoiseTitle => 'Filtrer le bruit de fond';

  @override
  String get filterNoiseSubtitle =>
      'Garde les voix nettes. Désactivez si vous diffusez de la musique à fond ou utilisez du matériel de DJ.';

  @override
  String get startParty => 'Lancer la fête 🔥';

  @override
  String get onTheMic => 'Au micro 🎤';

  @override
  String get endParty => 'Terminer la fête';

  @override
  String get endPartyTitle => 'Terminer la fête ?';

  @override
  String get endPartyMessage =>
      'Tous les haut-parleurs seront déconnectés et le son s\'arrêtera.';

  @override
  String get somethingWentWrong => 'Une erreur s\'est produite.';

  @override
  String get firingUpParty => 'On lance la fête…';

  @override
  String get creatingPartyNetwork => 'Création de votre réseau de fête';

  @override
  String get scanToJoinSound => 'Scannez pour rejoindre le son 📲';

  @override
  String get syncBufferTitle => 'Tampon de synchronisation';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count téléphones connectés',
      one: '$count téléphone connecté',
    );
    return 'Haut-parleurs de la bande · $_temp0';
  }

  @override
  String get micMuted => 'Micro coupé 🤫';

  @override
  String get liveOnAir => 'En direct 🎙️';

  @override
  String get tapToUnmute => 'Touchez le micro pour le réactiver et revenir';

  @override
  String get waitingForSquad => 'En attente que la bande scanne et rejoigne…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count téléphones haut-parleurs',
      one: '$count téléphone haut-parleur',
    );
    return 'Diffusion en direct vers $_temp0';
  }

  @override
  String get bufferDelayLabel => 'Délai du tampon avant lecture';

  @override
  String get syncBufferHelp =>
      'Augmentez si le son saccade ou coupe. Les enceintes Bluetooth et les relais de signal ont besoin d\'un peu plus de tampon pour rester parfaitement synchronisés.';

  @override
  String get speakerMode => 'Mode haut-parleur 🔊';

  @override
  String get leave => 'Quitter';

  @override
  String get leavePartyTitle => 'Quitter la fête ?';

  @override
  String get leavePartyBoosterMessage =>
      'Les amis connectés via votre relais seront aussi déconnectés.';

  @override
  String get leavePartyMessage => 'Ce téléphone arrêtera de diffuser le son.';

  @override
  String get leaveParty => 'Quitter la fête';

  @override
  String get audioOutput => 'Sortie audio';

  @override
  String get thisSpeaker => 'Cette enceinte';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route a un fort décalage Bluetooth ($latency ms), supérieur au tampon de synchronisation de l\'hôte. Demandez à l\'hôte d\'augmenter le « Tampon de synchronisation » à $needed ms ou plus pour que votre son puisse être lu !';
  }

  @override
  String get echoFixTitle => 'Correction d\'écho (réglage fin)';

  @override
  String get boostRangeTitle => 'Étendre la portée pour vos amis 📡';

  @override
  String get partyWrappedUp => 'La fête est terminée 🎉';

  @override
  String get hostEndedParty => 'L\'hôte a terminé la fête.';

  @override
  String partyEndedByHost(String name) {
    return '« $name » a été terminée par l\'hôte.';
  }

  @override
  String get backToHome => 'Retour à l\'accueil';

  @override
  String get joinAnotherParty => 'Rejoindre une autre fête';

  @override
  String get tuningIn => 'Connexion en cours…';

  @override
  String get warmingUpSpeakers => 'Échauffement des haut-parleurs';

  @override
  String connectingToWifi(String ssid) {
    return 'Connexion à $ssid…';
  }

  @override
  String get partyWifi => 'le Wi-Fi de la fête';

  @override
  String get tapAllowToConnect =>
      'Touchez Autoriser dans la fenêtre pour vous connecter.';

  @override
  String get findingHost => 'Recherche de l\'hôte…';

  @override
  String get searchingParty => 'Recherche de la fête sur ce Wi-Fi.';

  @override
  String get lockingIntoSync => 'Synchronisation en cours…';

  @override
  String get aligningBeat => 'Alignement du rythme.';

  @override
  String get hostIsMuted => 'L\'hôte est en sourdine 🤫';

  @override
  String get hostMutedSubtitle =>
      'Connecté ! Le son reviendra quand il réactivera son micro.';

  @override
  String get bumpingInSync => 'En pleine synchro 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'Lié directement à $name';
  }

  @override
  String get hostFallback => 'l\'hôte';

  @override
  String syncedVia(String name, int depth) {
    return 'Synchronisé via $name (sauts depuis le micro : $depth)';
  }

  @override
  String get boosterFallback => 'le relais';

  @override
  String get reSyncing => 'Resynchronisation…';

  @override
  String get reconnectingStream => 'Reconnexion au flux';

  @override
  String get notConnectedYet => 'Pas encore connecté';

  @override
  String get phoneSpeaker => 'Haut-parleur du téléphone';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'Décalage Bluetooth (+$ms ms) compensé automatiquement.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'Décalage du haut-parleur (+$ms ms) calibré automatiquement.';
  }

  @override
  String get syncTiming => 'Synchronisation';

  @override
  String get audioBuffer => 'Tampon audio';

  @override
  String get streamDrops => 'Pertes du flux';

  @override
  String get autoAdjust => 'Ajustement auto';

  @override
  String get defaultSyncZero => 'Synchro par défaut (décalage nul)';

  @override
  String nudgedEarlier(int ms) {
    return 'Avancé de $ms ms';
  }

  @override
  String nudgedLater(int ms) {
    return 'Retardé de $ms ms';
  }

  @override
  String get reset => 'Réinitialiser';

  @override
  String get echoHelp =>
      'Un écho ? Si cette enceinte est en retard sur la bande, glissez vers la droite. Si elle est en avance, vers la gauche. (La plupart des enceintes sonnent déjà parfaitement sans cela !)';

  @override
  String get relayUnsupportedIos =>
      'Les iPhone ne peuvent pas partager le Wi-Fi pendant l\'écoute. Demandez à un ami sur Android d\'activer le relais de signal !';

  @override
  String get relayUnsupportedAndroid =>
      'Ce téléphone ne prend pas en charge le mode relais Wi-Fi Direct.';

  @override
  String get boostSignalTitle => 'Relayer le signal pour vos amis';

  @override
  String tooFarToBoost(int depth) {
    return 'Trop loin de l\'hôte pour étendre davantage la portée (sauts depuis l\'hôte : $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count amis',
      one: '$count ami',
    );
    return 'Relais du son pour $_temp0';
  }

  @override
  String get boostSubtitleOff =>
      'Transforme votre téléphone en relais Wi-Fi pour que les amis plus éloignés puissent se connecter.';

  @override
  String get chargerTip =>
      'Branchez un chargeur si possible : étendre la portée consomme plus de batterie.';

  @override
  String get scanToConnectBooster =>
      'Scannez pour vous connecter via le relais 📲';

  @override
  String get reconnectSameNetwork => 'Se reconnecter au même réseau';

  @override
  String get retry => 'Réessayer';

  @override
  String get switchLabel => 'Basculer';

  @override
  String hostLabel(String name) {
    return '$name (hôte 🎤)';
  }

  @override
  String boosterLabel(String name) {
    return '$name (relais 📡)';
  }

  @override
  String inSyncCount(String ssid, int count) {
    return '$ssid · synchronisés : $count';
  }

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get back => 'Retour';

  @override
  String get cancel => 'Annuler';

  @override
  String get copy => 'Copier';

  @override
  String get show => 'Afficher';

  @override
  String get hide => 'Masquer';

  @override
  String copied(String label) {
    return '$label copié';
  }

  @override
  String get labelWifi => 'Wi-Fi';

  @override
  String get labelPassword => 'Mot de passe';

  @override
  String get labelAddress => 'Adresse';

  @override
  String get partyCode => 'Code de la fête';

  @override
  String get cameraQr => 'QR pour caméra';

  @override
  String get settingUpNetwork => 'Préparation du réseau de la fête…';

  @override
  String get qrCameraHelp =>
      'Scannez avec l\'appareil photo de votre téléphone pour d\'abord rejoindre le Wi-Fi, puis ouvrez Crowd Speaker et touchez « Je suis déjà sur le même Wi-Fi ».';

  @override
  String get qrAppHelp =>
      'Scannez avec Crowd Speaker → « Rejoindre le son ». Se connecte au Wi-Fi et synchronise le son automatiquement en un geste !';

  @override
  String get noSpeakersYet =>
      'Pas encore de haut-parleurs. Demandez à la bande de scanner votre QR code pour s\'y mettre !';

  @override
  String youLabel(String name) {
    return '$name (vous 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'Relais 📡 · synchronisés : $count';
  }

  @override
  String bufferDetail(int ms) {
    return 'tampon de $ms ms';
  }

  @override
  String dropsDetail(String pct) {
    return '$pct % de pertes';
  }

  @override
  String get errMicNeeded =>
      'L\'accès au microphone est nécessaire pour être le micro.';

  @override
  String get errNearbyCreate =>
      'Autorisez « Appareils à proximité » pour que l\'app puisse créer un réseau.';

  @override
  String get errNearbyShare =>
      'Autorisez « Appareils à proximité » pour que l\'app puisse partager un réseau.';

  @override
  String errNetwork(String message) {
    return 'Erreur réseau : $message';
  }

  @override
  String get noticeHotspotOff =>
      'Votre point d\'accès n\'est pas encore activé. Activez-le et le QR code se mettra à jour tout seul.';

  @override
  String get noticeLostHost =>
      'Connexion à l\'hôte perdue. Nouvelle tentative en cours, ou choisissez un autre réseau ci-dessous.';

  @override
  String noticeLostParent(String name) {
    return 'Connexion à $name perdue. Nouvelle tentative en cours, ou choisissez un autre réseau ci-dessous.';
  }

  @override
  String get noticeRejectSyncing =>
      'Un téléphone relais a été trouvé, mais il est encore en cours de synchronisation. Réessayez dans un instant.';

  @override
  String get noticeRejectLoop =>
      'Ce téléphone est déjà connecté via vous, il ne peut donc pas être votre source.';

  @override
  String noticeRejectOther(String reason) {
    return 'Un téléphone trouvé a répondu : $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'Le mot de passe Wi-Fi de ce code compte $length caractères, alors que les mots de passe Wi-Fi font de 8 à 63. L\'hôte s\'est probablement trompé : demandez-lui de le ressaisir, ou rejoignez « $ssid » dans les réglages Wi-Fi et touchez « Je suis déjà sur le même Wi-Fi ».';
  }

  @override
  String get errHostNotFound =>
      'Impossible de trouver l\'hôte sur ce Wi-Fi. Vérifiez que l\'hôte est en direct et que vous avez rejoint le bon réseau.';

  @override
  String get errRelayNeedsAndroid =>
      'Le partage nécessite un téléphone Android avec Wi-Fi Direct.';

  @override
  String errTooDeep(int depth, int max) {
    return 'Ce téléphone est trop éloigné de l\'hôte (sauts depuis l\'hôte : $depth, max. $max). Rejoignez un réseau plus proche de l\'hôte pour partager.';
  }

  @override
  String notifHosting(String name) {
    return 'Organisation de « $name »';
  }

  @override
  String notifPlaying(String name) {
    return 'Lecture de « $name »';
  }
}
