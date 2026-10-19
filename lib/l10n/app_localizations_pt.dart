// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get homeTagline =>
      'Transforme os celulares da galera em um sistema de som gigante. 🔊 Um celular pega o microfone e todos os outros (mais qualquer caixa Bluetooth conectada) tocam o som em sincronia.';

  @override
  String get nameLabel => 'Seu nome ou apelido';

  @override
  String get nameHelper => 'O que a galera vê na tela';

  @override
  String get homeVibeTitle => 'Qual é a vibe?';

  @override
  String get hostCardTitle => 'Pegue o microfone 🎤';

  @override
  String get hostCardSubtitle =>
      'Comande a festa. Tudo o que você falar ou transmitir toca em tempo real nas caixas de som de todo mundo.';

  @override
  String get joinCardTitle => 'Entre no som 🔊';

  @override
  String get joinCardSubtitle =>
      'Escaneie o QR code do anfitrião. Transforme este celular ou sua caixa Bluetooth em parte da festa.';

  @override
  String get homeTipRelay =>
      'Dica: este celular pode ampliar o alcance! Depois de conectado, você pode compartilhar o som com ainda mais amigos por perto.';

  @override
  String get homeTipIos =>
      'iPhones podem comandar ou entrar como caixas de som. Para ampliar o alcance para amigos mais distantes, use um celular Android.';

  @override
  String get homeTipDefault => 'Pronto para comandar a festa ou entrar no som!';

  @override
  String get scanHostQr => 'Escanear QR do anfitrião';

  @override
  String get scanHostQrSubtitle =>
      'Conexão com um toque: conecta ao Wi-Fi e sincroniza o som automaticamente';

  @override
  String get alreadyOnWifi => 'Já estou no mesmo Wi-Fi';

  @override
  String get connectManually => 'Conectar manualmente';

  @override
  String get wifiNameLabel => 'Nome do Wi-Fi';

  @override
  String get wifiPasswordLabel => 'Senha do Wi-Fi';

  @override
  String get hostIpLabel => 'Endereço IP do anfitrião (opcional)';

  @override
  String get hostIpHelper => 'Fica abaixo do QR code do anfitrião';

  @override
  String get connectToParty => 'Conectar à festa';

  @override
  String get enterWifiName => 'Digite o nome do Wi-Fi.';

  @override
  String get joinTipIos =>
      'Quando solicitado, toque em \"Entrar\" para conectar. Mantenha o Crowd Speaker aberto para o som continuar tocando!';

  @override
  String get joinTipAndroid =>
      'Quando solicitado, toque para aceitar a conexão Wi-Fi e você entra direto na festa.';

  @override
  String get scannerNotACode =>
      'Este não é um código do Crowd Speaker. Escaneie o QR na tela do seu amigo!';

  @override
  String get scannerHint =>
      'Aponte a câmera para o QR code na tela do seu amigo.';

  @override
  String get hostSetupTitle => 'Comande a festa 🎤';

  @override
  String get partyNameLabel => 'Nome da festa';

  @override
  String get partyNameHelper => 'O que seus amigos verão ao entrar';

  @override
  String partyNameDefault(String name) {
    return 'Festa de $name';
  }

  @override
  String get defaultPartyName => 'Festa';

  @override
  String get connectQuestion => 'Como os amigos vão se conectar?';

  @override
  String get instantNetworkTitle => 'Rede de festa instantânea';

  @override
  String get badgeEasiest => 'Mais fácil';

  @override
  String get instantNetworkSubtitle =>
      'Sem configuração. Cria na hora uma rede local para todo mundo entrar. (Não precisa de internet).';

  @override
  String get usePersonalHotspot => 'Usar Ponto de Acesso Pessoal';

  @override
  String get useMyHotspot => 'Usar o hotspot do meu celular';

  @override
  String get hotspotSubtitle =>
      'Ative o hotspot do celular manualmente. Também permite que os amigos usem sua internet móvel.';

  @override
  String get hotspotInfoIos =>
      'Ative o Ponto de Acesso Pessoal em Ajustes (\"Permitir que Outros Entrem\") e digite abaixo o nome do seu iPhone e a senha do hotspot para os amigos entrarem.';

  @override
  String get hotspotInfoAndroid =>
      'Ative o hotspot em Configurações e digite abaixo o nome e a senha do seu Wi-Fi para os amigos entrarem.';

  @override
  String get openHotspotSettings => 'Abrir configurações de hotspot';

  @override
  String get hotspotSettingsHint =>
      'Abra Ajustes → Ponto de Acesso Pessoal e ative \"Permitir que Outros Entrem\".';

  @override
  String get hotspotWifiNameLabel => 'Nome do Wi-Fi do hotspot';

  @override
  String get hotspotPasswordLabel => 'Senha do hotspot';

  @override
  String get enterHotspotName =>
      'Digite o nome do seu hotspot para os amigos entrarem.';

  @override
  String get invalidWifiPassword =>
      'As senhas de Wi-Fi devem ter de 8 a 63 caracteres. Verifique as configurações do hotspot e tente novamente!';

  @override
  String get audioTuning => 'Ajuste de áudio';

  @override
  String get filterNoiseTitle => 'Filtrar ruído de fundo';

  @override
  String get filterNoiseSubtitle =>
      'Mantém as vozes nítidas. Desative se estiver tocando música alto ou usando equipamento de DJ.';

  @override
  String get startParty => 'Começar a festa 🔥';

  @override
  String get onTheMic => 'No microfone 🎤';

  @override
  String get endParty => 'Encerrar festa';

  @override
  String get endPartyTitle => 'Encerrar a festa?';

  @override
  String get endPartyMessage =>
      'Isso vai desconectar todas as caixas de som e parar o som.';

  @override
  String get somethingWentWrong => 'Algo deu errado.';

  @override
  String get firingUpParty => 'Preparando a festa…';

  @override
  String get creatingPartyNetwork => 'Criando sua rede de festa';

  @override
  String get scanToJoinSound => 'Escaneie para entrar no som 📲';

  @override
  String get syncBufferTitle => 'Buffer de sincronização';

  @override
  String squadSpeakers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count celulares conectados',
      one: '$count celular conectado',
    );
    return 'Caixas da galera · $_temp0';
  }

  @override
  String get micMuted => 'Microfone mudo 🤫';

  @override
  String get liveOnAir => 'Ao vivo 🎙️';

  @override
  String get tapToUnmute => 'Toque no microfone para reativar e voltar';

  @override
  String get waitingForSquad => 'Esperando a galera escanear e entrar…';

  @override
  String streamingTo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count celulares-caixa de som',
      one: '$count celular-caixa de som',
    );
    return 'Transmitindo ao vivo para $_temp0';
  }

  @override
  String get bufferDelayLabel => 'Atraso do buffer antes de tocar';

  @override
  String get syncBufferHelp =>
      'Aumente se o áudio travar ou falhar. Caixas Bluetooth e repetidores de sinal precisam de um pouco mais de buffer para ficar perfeitamente sincronizados.';

  @override
  String get speakerMode => 'Modo caixa de som 🔊';

  @override
  String get leave => 'Sair';

  @override
  String get leavePartyTitle => 'Sair da festa?';

  @override
  String get leavePartyBoosterMessage =>
      'Os amigos conectados pelo seu repetidor também serão desconectados.';

  @override
  String get leavePartyMessage => 'Este celular vai parar de tocar o som.';

  @override
  String get leaveParty => 'Sair da festa';

  @override
  String get audioOutput => 'Saída de áudio';

  @override
  String get thisSpeaker => 'Esta caixa de som';

  @override
  String bluetoothLagWarning(String route, int latency, int needed) {
    return '$route tem um atraso Bluetooth alto ($latency ms), maior que o buffer de sincronização do anfitrião. Peça ao anfitrião para aumentar o \"Buffer de sincronização\" para $needed ms ou mais para o seu som tocar!';
  }

  @override
  String get echoFixTitle => 'Correção de eco (ajuste fino)';

  @override
  String get boostRangeTitle => 'Amplie o alcance para os amigos 📡';

  @override
  String get partyWrappedUp => 'A festa acabou 🎉';

  @override
  String get hostEndedParty => 'O anfitrião encerrou a festa.';

  @override
  String partyEndedByHost(String name) {
    return '\"$name\" foi encerrada pelo anfitrião.';
  }

  @override
  String get backToHome => 'Voltar ao início';

  @override
  String get joinAnotherParty => 'Entrar em outra festa';

  @override
  String get tuningIn => 'Sintonizando…';

  @override
  String get warmingUpSpeakers => 'Aquecendo as caixas de som';

  @override
  String connectingToWifi(String ssid) {
    return 'Conectando a $ssid…';
  }

  @override
  String get partyWifi => 'o Wi-Fi da festa';

  @override
  String get tapAllowToConnect => 'Toque em Permitir na janela para conectar.';

  @override
  String get findingHost => 'Procurando o anfitrião…';

  @override
  String get searchingParty => 'Procurando a festa neste Wi-Fi.';

  @override
  String get lockingIntoSync => 'Sincronizando…';

  @override
  String get aligningBeat => 'Alinhando o ritmo.';

  @override
  String get hostIsMuted => 'O anfitrião está no mudo 🤫';

  @override
  String get hostMutedSubtitle =>
      'Conectado! O som volta quando ele reativar o microfone.';

  @override
  String get bumpingInSync => 'Bombando em sincronia 🔥';

  @override
  String linkedDirectlyTo(String name) {
    return 'Conectado diretamente a $name';
  }

  @override
  String get hostFallback => 'o anfitrião';

  @override
  String syncedVia(String name, int depth) {
    return 'Sincronizado via $name (saltos desde o microfone: $depth)';
  }

  @override
  String get boosterFallback => 'o repetidor';

  @override
  String get reSyncing => 'Sincronizando de novo…';

  @override
  String get reconnectingStream => 'Reconectando à transmissão';

  @override
  String get notConnectedYet => 'Ainda não conectado';

  @override
  String get phoneSpeaker => 'Alto-falante do celular';

  @override
  String bluetoothDelayZeroed(int ms) {
    return 'Atraso do Bluetooth (+$ms ms) compensado automaticamente.';
  }

  @override
  String speakerDelayCalibrated(int ms) {
    return 'Atraso do alto-falante (+$ms ms) calibrado automaticamente.';
  }

  @override
  String get syncTiming => 'Tempo de sincronia';

  @override
  String get audioBuffer => 'Buffer de áudio';

  @override
  String get streamDrops => 'Perdas na transmissão';

  @override
  String get autoAdjust => 'Ajuste automático';

  @override
  String get defaultSyncZero => 'Sincronia padrão (sem deslocamento)';

  @override
  String nudgedEarlier(int ms) {
    return 'Adiantado em $ms ms';
  }

  @override
  String nudgedLater(int ms) {
    return 'Atrasado em $ms ms';
  }

  @override
  String get reset => 'Redefinir';

  @override
  String get echoHelp =>
      'Ouvindo eco? Se esta caixa soa atrasada em relação à galera, deslize para a direita. Se soa adiantada, deslize para a esquerda. (A maioria das caixas já soa perfeita sem isso!)';

  @override
  String get relayUnsupportedIos =>
      'iPhones não conseguem compartilhar Wi-Fi enquanto ouvem. Peça a um amigo com Android para ativar o repetidor de sinal!';

  @override
  String get relayUnsupportedAndroid =>
      'Este celular não oferece suporte ao modo repetidor Wi-Fi Direct.';

  @override
  String get boostSignalTitle => 'Reforçar sinal para os amigos';

  @override
  String tooFarToBoost(int depth) {
    return 'Longe demais do anfitrião para ampliar mais o alcance (saltos desde o anfitrião: $depth).';
  }

  @override
  String boostingFor(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count amigos',
      one: '$count amigo',
    );
    return 'Reforçando o som para $_temp0';
  }

  @override
  String get boostSubtitleOff =>
      'Transforma seu celular em um repetidor Wi-Fi para que amigos mais distantes possam se conectar.';

  @override
  String get chargerTip =>
      'Se possível, conecte ao carregador: ampliar o alcance gasta mais bateria.';

  @override
  String get scanToConnectBooster => 'Escaneie para conectar pelo repetidor 📲';

  @override
  String get reconnectSameNetwork => 'Reconectar à mesma rede';

  @override
  String get retry => 'Tentar de novo';

  @override
  String get switchLabel => 'Trocar';

  @override
  String hostLabel(String name) {
    return '$name (anfitrião 🎤)';
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
  String get tryAgain => 'Tentar novamente';

  @override
  String get back => 'Voltar';

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
  String get labelPassword => 'Senha';

  @override
  String get labelAddress => 'Endereço';

  @override
  String get partyCode => 'Código da festa';

  @override
  String get cameraQr => 'QR da câmera';

  @override
  String get settingUpNetwork => 'Preparando a rede da festa…';

  @override
  String get qrCameraHelp =>
      'Escaneie com o app Câmera do celular para entrar primeiro no Wi-Fi; depois abra o Crowd Speaker e toque em \"Já estou no mesmo Wi-Fi\".';

  @override
  String get qrAppHelp =>
      'Escaneie com o Crowd Speaker → \"Entre no som\". Conecta ao Wi-Fi e sincroniza o som automaticamente com um toque!';

  @override
  String get noSpeakersYet =>
      'Ainda não há caixas de som. Peça para a galera escanear seu QR code e entrar!';

  @override
  String youLabel(String name) {
    return '$name (você 🎤)';
  }

  @override
  String boosterDetail(int count) {
    return 'Repetidor 📡 · sincronizados: $count';
  }

  @override
  String bufferDetail(int ms) {
    return 'buffer de $ms ms';
  }

  @override
  String dropsDetail(String pct) {
    return '$pct% de perdas';
  }

  @override
  String get errMicNeeded =>
      'É necessário acesso ao microfone para ser o microfone.';

  @override
  String get errNearbyCreate =>
      'Permita \"Dispositivos próximos\" para o app poder criar uma rede.';

  @override
  String get errNearbyShare =>
      'Permita \"Dispositivos próximos\" para o app poder compartilhar uma rede.';

  @override
  String errNetwork(String message) {
    return 'Erro de rede: $message';
  }

  @override
  String get noticeHotspotOff =>
      'Seu hotspot ainda não está ligado. Ligue-o e o QR code se atualiza sozinho.';

  @override
  String get noticeLostHost =>
      'Conexão com o anfitrião perdida. Tentando de novo, ou escolha outra rede abaixo.';

  @override
  String noticeLostParent(String name) {
    return 'Conexão com $name perdida. Tentando de novo, ou escolha outra rede abaixo.';
  }

  @override
  String get noticeRejectSyncing =>
      'Um celular repetidor foi encontrado, mas ainda está sincronizando. Tente de novo em instantes.';

  @override
  String get noticeRejectLoop =>
      'Esse celular já está conectado através de você, então não pode ser sua fonte.';

  @override
  String noticeRejectOther(String reason) {
    return 'Um celular encontrado respondeu: $reason';
  }

  @override
  String errPasswordLength(int length, String ssid) {
    return 'A senha de Wi-Fi neste código tem $length caracteres, mas senhas de Wi-Fi têm de 8 a 63. O anfitrião provavelmente digitou errado: peça para ele digitar de novo, ou entre em \"$ssid\" nas configurações de Wi-Fi e toque em \"Já estou no mesmo Wi-Fi\".';
  }

  @override
  String get errHostNotFound =>
      'Não foi possível encontrar o anfitrião neste Wi-Fi. Verifique se o anfitrião está ao vivo e se você entrou na rede certa.';

  @override
  String get errRelayNeedsAndroid =>
      'Compartilhar exige um celular Android com Wi-Fi Direct.';

  @override
  String errTooDeep(int depth, int max) {
    return 'Este celular está longe demais do anfitrião (saltos desde o anfitrião: $depth, máx. $max). Entre em uma rede mais próxima do anfitrião para compartilhar.';
  }

  @override
  String notifHosting(String name) {
    return 'Comandando \"$name\"';
  }

  @override
  String notifPlaying(String name) {
    return 'Tocando \"$name\"';
  }
}
