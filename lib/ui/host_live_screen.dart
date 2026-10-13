import 'package:flutter/material.dart';

import '../app_scope.dart';
import '../engine/session_engine.dart';
import 'host_setup_screen.dart';
import 'widgets/common.dart';
import 'widgets/network_tree.dart';
import 'widgets/qr_panel.dart';

class HostLiveScreen extends StatelessWidget {
  const HostLiveScreen({super.key});

  Future<void> _end(BuildContext context) async {
    final engine = AppScope.of(context).engine;
    final ok = engine.phase != SessionPhase.live ||
        await confirm(context,
            title: 'End the party?',
            message: 'This will disconnect all speakers and stop the sound.',
            action: 'End Party');
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
        if (!didPop) _end(context);
      },
      child: ListenableBuilder(
        listenable: engine,
        builder: (context, _) => Scaffold(
          appBar: AppBar(
            title: Text(engine.sessionName.isEmpty ? 'On the Mic 🎤' : engine.sessionName),
            actions: [
              TextButton.icon(
                onPressed: () => _end(context),
                icon: const Icon(Icons.stop_circle_outlined),
                label: const Text('End Party'),
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
    switch (engine.phase) {
      case SessionPhase.error:
        return ErrorView(
          message: engine.error ?? 'Something went wrong.',
          onRetry: () {
            engine.stop();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const HostSetupScreen()));
          },
          onBack: () {
            engine.stop();
            Navigator.pop(context);
          },
        );
      case SessionPhase.live:
        break;
      default:
        return BusyView(
          title: 'Firing up the party…',
          subtitle: engine.hostMode == HostNetworkMode.appNetwork
              ? 'Creating your party network'
              : null,
        );
    }
    final join = engine.hostJoin;
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      children: [
        _MicCard(engine: engine),
        if (engine.notice != null) ...[
          const SizedBox(height: 12),
          InfoBanner(engine.notice!, warning: true, icon: Icons.wifi_off),
        ],
        const SizedBox(height: 16),
        if (join != null) QrPanel(join: join, title: 'Scan to join the sound 📲'),
        const SectionTitle('Sound sync buffer'),
        _SyncDelayCard(engine: engine, scope: scope),
        SectionTitle('Squad speakers · ${engine.listenerCount} '
            '${engine.listenerCount == 1 ? 'phone' : 'phones'} connected'),
        NetworkTree(nodes: engine.nodes, rootId: engine.nodeId),
      ],
    );
  }
}

class _MicCard extends StatelessWidget {
  const _MicCard({required this.engine});
  final SessionEngine engine;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final muted = engine.muted;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
        child: Column(
          children: [
            ValueListenableBuilder<double>(
              valueListenable: engine.micLevel,
              builder: (context, level, child) => AnimatedContainer(
                duration: const Duration(milliseconds: 90),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: muted ? scheme.surfaceContainerHighest : scheme.primary,
                  boxShadow: [
                    if (!muted)
                      BoxShadow(
                        color: scheme.primary.withValues(alpha: 0.45),
                        blurRadius: 12 + level * 50,
                        spreadRadius: level * 22,
                      ),
                  ],
                ),
                child: child,
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () => engine.setMuted(!muted),
                  child: Icon(muted ? Icons.mic_off : Icons.mic,
                      size: 64,
                      color: muted ? scheme.onSurfaceVariant : scheme.onPrimary),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Text(muted ? 'Mic Muted 🤫' : 'Live on Air 🎙️',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Text(
              muted
                  ? 'Tap the mic to unmute and drop back in'
                  : engine.listenerCount == 0
                      ? 'Waiting for the squad to scan and join…'
                      : 'Streaming live to ${engine.listenerCount} '
                          '${engine.listenerCount == 1 ? 'phone speaker' : 'phone speakers'}',
              style: TextStyle(color: scheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}

class _SyncDelayCard extends StatelessWidget {
  const _SyncDelayCard({required this.engine, required this.scope});
  final SessionEngine engine;
  final AppScope scope;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text('Buffer delay before sound plays',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ),
                Text('${engine.syncDelayMs} ms',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: scheme.primary)),
              ],
            ),
            Slider(
              value: engine.syncDelayMs.toDouble(),
              min: 150,
              max: 1000,
              divisions: 34,
              label: '${engine.syncDelayMs} ms',
              onChanged: (v) => engine.setSyncDelay(v.round()),
              onChangeEnd: (v) => scope.prefs.syncDelayMs = v.round(),
            ),
            Text(
              'Slide up if audio stutters or drops out. Bluetooth speakers and '
              'signal boosters need a bit more buffer time to stay perfectly in sync.',
              style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 13, height: 1.35),
            ),
          ],
        ),
      ),
    );
  }
}
