import 'package:flutter/material.dart';

import '../app_scope.dart';
import '../core/protocol.dart';
import '../engine/session_engine.dart';
import 'join_screen.dart';
import 'theme.dart';
import 'widgets/common.dart';
import 'widgets/qr_panel.dart';

class ListenerScreen extends StatelessWidget {
  const ListenerScreen({super.key});

  Future<void> _leave(BuildContext context) async {
    final engine = AppScope.of(context).engine;
    final ok = engine.phase != SessionPhase.live ||
        await confirm(context,
            title: 'Leave the session?',
            message: engine.relaying
                ? 'Phones connected through you will lose the sound too.'
                : 'This phone stops playing.',
            action: 'Leave');
    if (!ok || !context.mounted) return;
    await engine.stop();
    if (context.mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final scope = AppScope.of(context);
    final engine = scope.engine;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _leave(context);
      },
      child: ListenableBuilder(
        listenable: engine,
        builder: (context, _) => Scaffold(
          appBar: AppBar(
            title: Text(engine.sessionName.isEmpty ? 'Speaker' : engine.sessionName),
            actions: [
              TextButton.icon(
                onPressed: () => _leave(context),
                icon: const Icon(Icons.logout),
                label: const Text('Leave'),
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
    if (engine.phase == SessionPhase.error) {
      return ErrorView(
        message: engine.error ?? 'Something went wrong.',
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
          const SectionTitle('This speaker'),
          _OutputCard(engine: engine),
          const SizedBox(height: 12),
          _Stats(engine: engine),
          const SectionTitle('Speaker lag correction'),
          _OffsetCard(engine: engine, scope: scope),
          const SectionTitle('Share to more phones'),
          _RelayCard(engine: engine),
        ],
      ],
    );
  }
}

class _StatusHero extends StatelessWidget {
  const _StatusHero({required this.engine});
  final SessionEngine engine;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final ssid = engine.upstreamJoin?.ssid ?? '';
    final (IconData icon, String title, String subtitle, bool busy) = switch (engine.phase) {
      SessionPhase.starting => (Icons.hourglass_top, 'Getting ready…', '', true),
      SessionPhase.joiningWifi => (
          Icons.wifi,
          'Joining ${ssid.isEmpty ? 'Wi-Fi' : ssid}…',
          'Approve the system prompt to connect.',
          true
        ),
      SessionPhase.discovering => (
          Icons.travel_explore,
          'Looking for the host…',
          'Searching this Wi-Fi network.',
          true
        ),
      SessionPhase.syncing => (Icons.timer_outlined, 'Syncing clocks…', 'Almost there.', true),
      SessionPhase.live => (
          Icons.graphic_eq,
          'Playing',
          'via ${engine.parentName.isEmpty ? 'host' : engine.parentName}'
              ' · ${engine.depth} ${engine.depth == 1 ? 'hop' : 'hops'} from the mic',
          false
        ),
      SessionPhase.reconnecting => (Icons.sync_problem, 'Reconnecting…', '', true),
      _ => (Icons.speaker, 'Not connected', '', false),
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
        title: Text(p.route.isEmpty ? 'Phone speaker' : p.route,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(p.isBluetooth
            ? 'Bluetooth adds ${p.outputLatencyMs.round()} ms. Already corrected.'
            : 'Output delay ${p.outputLatencyMs.round()} ms. Already corrected.'),
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
          label: 'Clock sync',
          value: syncMs == null ? '…' : '± ${syncMs.toStringAsFixed(1)} ms',
          color: syncMs == null
              ? null
              : healthColor(scheme, syncMs < 3 ? 1 : (syncMs < 10 ? 0.5 : 0)),
        ),
        StatTile(
          label: 'Buffer ahead',
          value: '${p.bufferedMs.round()} ms',
          color: healthColor(scheme, bufferHealth(p.bufferedMs)),
        ),
        StatTile(
          label: 'Packet loss',
          value: '${engine.lossPct.toStringAsFixed(1)} %',
          color: healthColor(
              scheme, engine.lossPct < 1 ? 1 : (engine.lossPct < 5 ? 0.5 : 0)),
        ),
        StatTile(
          label: 'Drift fix',
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
                        ? 'No correction'
                        : ms > 0
                            ? 'Playing ${ms.round()} ms earlier'
                            : 'Playing ${(-ms).round()} ms later',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                if (ms != 0)
                  TextButton(
                    onPressed: () {
                      engine.setOutputOffset(0);
                      scope.prefs.outputOffsetMs = 0;
                    },
                    child: const Text('Reset'),
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
              'If this speaker sounds behind the others, slide right. If it '
              'sounds ahead, slide left. Most speakers need no correction.',
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
    if (!engine.caps.canRelay) {
      return InfoBanner(
        engine.caps.isIOS
            ? "iPhones can't share a Wi-Fi network while connected to one. "
                'An Android phone in the room can relay instead.'
            : "This phone doesn't support Wi-Fi Direct, so it can't relay.",
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
            title: const Text('Relay to more phones'),
            subtitle: Text(tooDeep
                ? 'Too far from the host to relay (${engine.depth} hops).'
                : engine.relaying
                    ? '${engine.childCount} '
                        '${engine.childCount == 1 ? 'phone' : 'phones'} connected through you'
                    : 'Creates a Wi-Fi network from this phone so more phones can join.'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        if (engine.relayError != null) ...[
          const SizedBox(height: 10),
          InfoBanner(engine.relayError!, warning: true, icon: Icons.error_outline),
        ],
        if (engine.relaying && join != null) ...[
          const SizedBox(height: 12),
          const InfoBanner(
            'Keep this phone plugged in if you can. Relaying uses more battery.',
            icon: Icons.battery_charging_full,
          ),
          const SizedBox(height: 12),
          QrPanel(join: join, title: 'Scan to join through this phone'),
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
              title: const Text('Try the same network again'),
              trailing: FilledButton.tonal(
                style: FilledButton.styleFrom(minimumSize: compact),
                onPressed: engine.retryConnection,
                child: const Text('Retry'),
              ),
            ),
            for (final EntryPoint e in entries)
              ListTile(
                leading: Icon(e.isHost ? Icons.mic : Icons.wifi_tethering),
                title: Text(e.isHost ? '${e.name} (host)' : e.name),
                subtitle: Text('${e.ssid} · ${e.children} connected'),
                trailing: FilledButton(
                  style: FilledButton.styleFrom(minimumSize: compact),
                  onPressed: () => engine.switchTo(e),
                  child: const Text('Switch'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
