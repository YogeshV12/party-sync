import 'package:flutter/material.dart';

import '../app_scope.dart';
import '../core/protocol.dart';
import '../engine/session_engine.dart';
import '../l10n/app_localizations.dart';
import 'join_screen.dart';
import 'theme.dart';
import 'widgets/common.dart';
import 'widgets/qr_panel.dart';

class ListenerScreen extends StatelessWidget {
  const ListenerScreen({super.key});

  Future<void> _leave(BuildContext context) async {
    final engine = AppScope.of(context).engine;
    final l10n = AppLocalizations.of(context);
    final ok = engine.phase != SessionPhase.live ||
        await confirm(context,
            title: l10n.leavePartyTitle,
            message: engine.relaying
                ? l10n.leavePartyBoosterMessage
                : l10n.leavePartyMessage,
            action: l10n.leaveParty);
    if (!ok || !context.mounted) return;
    await engine.stop();
    if (context.mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final scope = AppScope.of(context);
    final engine = scope.engine;
    final l10n = AppLocalizations.of(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _leave(context);
      },
      child: ListenableBuilder(
        listenable: engine,
        builder: (context, _) => Scaffold(
          appBar: AppBar(
            title: Text(engine.sessionName.isEmpty ? l10n.speakerMode : engine.sessionName),
            actions: [
              TextButton.icon(
                onPressed: () => _leave(context),
                icon: const Icon(Icons.logout),
                label: Text(l10n.leave),
              ),
            ],
          ),
          body: SafeArea(child: _body(context, scope)),
        ),
      ),
    );
  }

  Widget _body(BuildContext context, AppScope scope) {
    final engine = scope.engine;
    final l10n = AppLocalizations.of(context);
    if (engine.phase == SessionPhase.error) {
      return ErrorView(
        message: engine.error ?? l10n.somethingWentWrong,
        onRetry: () {
          final info = engine.upstreamJoin;
          if (info != null) engine.joinSession(info, alreadyOnWifi: info.ssid.isEmpty);
        },
        onBack: () {
          engine.stop();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const JoinScreen()));
        },
      );
    }
    if (engine.phase == SessionPhase.ended) {
      return _EndedView(
        name: engine.sessionName,
        onDone: () => _leave(context),
        onJoinAnother: () {
          engine.stop();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const JoinScreen()));
        },
      );
    }
    final connected = engine.phase == SessionPhase.live ||
        engine.phase == SessionPhase.reconnecting;
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      children: [
        _StatusHero(engine: engine),
        if (engine.notice != null) ...[
          const SizedBox(height: 12),
          InfoBanner(engine.notice!,
              warning: engine.phase == SessionPhase.reconnecting,
              icon: Icons.wifi_find),
        ],
        if (engine.phase == SessionPhase.reconnecting) ...[
          const SizedBox(height: 12),
          _Alternatives(engine: engine),
        ],
        if (connected) ...[
          SectionTitle(l10n.audioOutput),
          _OutputCard(engine: engine),
          const SizedBox(height: 12),
          _Stats(engine: engine),
          if (engine.neededSyncDelayMs case final needed?) ...[
            const SizedBox(height: 12),
            InfoBanner(
                l10n.bluetoothLagWarning(
                    engine.playback.route.isEmpty
                        ? l10n.thisSpeaker
                        : engine.playback.route,
                    engine.playback.outputLatencyMs.round(),
                    needed),
                warning: true,
                icon: Icons.bluetooth_audio),
          ],
          SectionTitle(l10n.echoFixTitle),
          _OffsetCard(engine: engine, scope: scope),
          SectionTitle(l10n.boostRangeTitle),
          _RelayCard(engine: engine),
        ],
      ],
    );
  }
}

class _EndedView extends StatelessWidget {
  const _EndedView({
    required this.name,
    required this.onDone,
    required this.onJoinAnother,
  });
  final String name;
  final VoidCallback onDone;
  final VoidCallback onJoinAnother;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.stop_circle_outlined, size: 56, color: scheme.onSurfaceVariant),
            const SizedBox(height: 16),
            Text(l10n.partyWrappedUp,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              name.isEmpty ? l10n.hostEndedParty : l10n.partyEndedByHost(name),
              textAlign: TextAlign.center,
              style: TextStyle(color: scheme.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            FilledButton(onPressed: onDone, child: Text(l10n.backToHome)),
            const SizedBox(height: 10),
            OutlinedButton(
                onPressed: onJoinAnother, child: Text(l10n.joinAnotherParty)),
          ],
        ),
      ),
    );
  }
}

class _StatusHero extends StatelessWidget {
  const _StatusHero({required this.engine});
  final SessionEngine engine;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    final ssid = engine.upstreamJoin?.ssid ?? '';
    final (IconData icon, String title, String subtitle, bool busy) = switch (engine.phase) {
      SessionPhase.starting => (Icons.hourglass_top, l10n.tuningIn, l10n.warmingUpSpeakers, true),
      SessionPhase.joiningWifi => (
          Icons.wifi,
          l10n.connectingToWifi(ssid.isEmpty ? l10n.partyWifi : ssid),
          l10n.tapAllowToConnect,
          true
        ),
      SessionPhase.discovering => (
          Icons.travel_explore,
          l10n.findingHost,
          l10n.searchingParty,
          true
        ),
      SessionPhase.syncing => (Icons.timer_outlined, l10n.lockingIntoSync, l10n.aligningBeat, true),
      SessionPhase.live when engine.hostMuted => (
          Icons.mic_off,
          l10n.hostIsMuted,
          l10n.hostMutedSubtitle,
          false
        ),
      SessionPhase.live => (
          Icons.graphic_eq,
          l10n.bumpingInSync,
          engine.depth <= 1
              ? l10n.linkedDirectlyTo(
                  engine.parentName.isEmpty ? l10n.hostFallback : engine.parentName)
              : l10n.syncedVia(
                  engine.parentName.isEmpty ? l10n.boosterFallback : engine.parentName,
                  engine.depth),
          false
        ),
      SessionPhase.reconnecting => (Icons.sync_problem, l10n.reSyncing, l10n.reconnectingStream, true),
      _ => (Icons.speaker, l10n.notConnectedYet, '', false),
    };
    final live = engine.phase == SessionPhase.live;
    return Card(
      color: live ? scheme.primaryContainer : null,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Row(
          children: [
            SizedBox(
              width: 56,
              height: 56,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (busy) const SizedBox.expand(child: CircularProgressIndicator(strokeWidth: 3)),
                  Icon(icon, size: 30, color: live ? scheme.primary : scheme.onSurfaceVariant),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w700)),
                  if (subtitle.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(subtitle, style: TextStyle(color: scheme.onSurfaceVariant)),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OutputCard extends StatelessWidget {
  const _OutputCard({required this.engine});
  final SessionEngine engine;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    final p = engine.playback;
    final icon = switch (p.routeKind) {
      String k when k.startsWith('bluetooth') => Icons.bluetooth_audio,
      'wired' => Icons.headphones,
      'usb' => Icons.usb,
      'airplay' => Icons.airplay,
      _ => Icons.speaker,
    };
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: scheme.secondaryContainer,
          child: Icon(icon, color: scheme.onSecondaryContainer),
        ),
        title: Text(p.route.isEmpty ? l10n.phoneSpeaker : p.route,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(p.isBluetooth
            ? l10n.bluetoothDelayZeroed(p.outputLatencyMs.round())
            : l10n.speakerDelayCalibrated(p.outputLatencyMs.round())),
      ),
    );
  }
}

class _Stats extends StatelessWidget {
  const _Stats({required this.engine});
  final SessionEngine engine;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    final p = engine.playback;
    final syncMs = engine.clock.errorBoundMs;
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 2.3,
      children: [
        StatTile(
          label: l10n.syncTiming,
          value: syncMs == null ? '…' : '±${syncMs.toStringAsFixed(1)} ms',
          color: syncMs == null
              ? null
              : healthColor(scheme, syncMs < 3 ? 1 : (syncMs < 10 ? 0.5 : 0)),
        ),
        StatTile(
          label: l10n.audioBuffer,
          value: engine.hostMuted ? '—' : '${p.bufferedMs.round()} ms',
          color: engine.hostMuted ? null : healthColor(scheme, bufferHealth(p.bufferedMs)),
        ),
        StatTile(
          label: l10n.streamDrops,
          value: '${engine.lossPct.toStringAsFixed(1)}%',
          color: healthColor(
              scheme, engine.lossPct < 1 ? 1 : (engine.lossPct < 5 ? 0.5 : 0)),
        ),
        StatTile(
          label: l10n.autoAdjust,
          value: '${p.syncErrorMs.abs().toStringAsFixed(1)} ms',
        ),
      ],
    );
  }
}

class _OffsetCard extends StatelessWidget {
  const _OffsetCard({required this.engine, required this.scope});
  final SessionEngine engine;
  final AppScope scope;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    final ms = engine.outputOffsetMs;
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    ms == 0
                        ? l10n.defaultSyncZero
                        : ms > 0
                            ? l10n.nudgedEarlier(ms.round())
                            : l10n.nudgedLater((-ms).round()),
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                if (ms != 0)
                  TextButton(
                    onPressed: () {
                      engine.setOutputOffset(0);
                      scope.prefs.outputOffsetMs = 0;
                    },
                    child: Text(l10n.reset),
                  ),
              ],
            ),
            Slider(
              value: ms.clamp(-300, 300),
              min: -300,
              max: 300,
              divisions: 120,
              label: '${ms.round()} ms',
              onChanged: (v) => engine.setOutputOffset(v.roundToDouble()),
              onChangeEnd: (v) => scope.prefs.outputOffsetMs = v.roundToDouble(),
            ),
            Text(
              l10n.echoHelp,
              style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 13, height: 1.35),
            ),
          ],
        ),
      ),
    );
  }
}

class _RelayCard extends StatelessWidget {
  const _RelayCard({required this.engine});
  final SessionEngine engine;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);
    if (!engine.caps.canRelay) {
      return InfoBanner(
        engine.caps.isIOS ? l10n.relayUnsupportedIos : l10n.relayUnsupportedAndroid,
        icon: Icons.wifi_tethering_off,
      );
    }
    final tooDeep = engine.depth >= engine.maxDepth;
    final join = engine.relayJoin;
    return Column(
      children: [
        Card(
          child: SwitchListTile(
            value: engine.relaying,
            onChanged: engine.relayBusy || (tooDeep && !engine.relaying)
                ? null
                : engine.setRelaying,
            secondary: engine.relayBusy
                ? const SizedBox(
                    width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2.5))
                : Icon(Icons.wifi_tethering,
                    color: engine.relaying ? scheme.primary : null),
            title: Text(l10n.boostSignalTitle),
            subtitle: Text(tooDeep
                ? l10n.tooFarToBoost(engine.depth)
                : engine.relaying
                    ? l10n.boostingFor(engine.childCount)
                    : l10n.boostSubtitleOff),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        if (engine.relayError != null) ...[
          const SizedBox(height: 10),
          InfoBanner(engine.relayError!, warning: true, icon: Icons.error_outline),
        ],
        if (engine.relaying && join != null) ...[
          const SizedBox(height: 12),
          InfoBanner(
            l10n.chargerTip,
            icon: Icons.battery_charging_full,
          ),
          const SizedBox(height: 12),
          QrPanel(join: join, title: l10n.scanToConnectBooster),
        ],
      ],
    );
  }
}

class _Alternatives extends StatelessWidget {
  const _Alternatives({required this.engine});
  final SessionEngine engine;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final entries = [...engine.alternatives]
      ..sort((a, b) => a.depth != b.depth
          ? a.depth.compareTo(b.depth)
          : a.children.compareTo(b.children));
    // The theme's full-width buttons can't sit in a list tile's trailing slot.
    const compact = Size(88, 40);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: const Icon(Icons.refresh),
              title: Text(l10n.reconnectSameNetwork),
              trailing: FilledButton.tonal(
                style: FilledButton.styleFrom(minimumSize: compact),
                onPressed: engine.retryConnection,
                child: Text(l10n.retry),
              ),
            ),
            for (final EntryPoint e in entries)
              ListTile(
                leading: Icon(e.isHost ? Icons.mic : Icons.wifi_tethering),
                title: Text(e.isHost ? l10n.hostLabel(e.name) : l10n.boosterLabel(e.name)),
                subtitle: Text(l10n.inSyncCount(e.ssid, e.children)),
                trailing: FilledButton(
                  style: FilledButton.styleFrom(minimumSize: compact),
                  onPressed: () => engine.switchTo(e),
                  child: Text(l10n.switchLabel),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
