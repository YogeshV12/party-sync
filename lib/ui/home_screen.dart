import 'package:flutter/material.dart';

import '../app_scope.dart';
import 'host_setup_screen.dart';
import 'join_screen.dart';
import 'widgets/common.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? _nameController;
  TextEditingController get _name => _nameController!;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _nameController ??=
        TextEditingController(text: AppScope.of(context).engine.displayName);
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  void _saveName(String value) {
    final scope = AppScope.of(context);
    final name = value.trim().isEmpty ? 'Phone' : value.trim();
    scope.engine.displayName = name;
    scope.prefs.displayName = name;
  }

  @override
  Widget build(BuildContext context) {
    final scope = AppScope.of(context);
    final caps = scope.engine.caps;
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
          children: [
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [scheme.primary, scheme.tertiary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(Icons.graphic_eq, color: scheme.onPrimary, size: 30),
                ),
                const SizedBox(width: 14),
                Text('Party Sync',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w700)),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              'One phone is the mic. Every other phone, and the Bluetooth '
              'speaker connected to it, plays your voice in sync.',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: scheme.onSurfaceVariant, height: 1.4),
            ),
            const SizedBox(height: 22),
            TextField(
              controller: _name,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Your name',
                helperText: 'Shown to the host and other phones',
                prefixIcon: Icon(Icons.person_outline),
              ),
              onChanged: _saveName,
            ),
            const SectionTitle('What do you want to do?'),
            _RoleCard(
              icon: Icons.mic,
              title: 'Be the mic',
              subtitle: 'Host the session. Your voice plays on every phone that joins.',
              primary: true,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const HostSetupScreen())),
            ),
            const SizedBox(height: 12),
            _RoleCard(
              icon: Icons.speaker_group,
              title: 'Join as a speaker',
              subtitle: "Scan the host's QR code and play through this phone or "
                  'its Bluetooth speaker.',
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const JoinScreen())),
            ),
            const SizedBox(height: 20),
            InfoBanner(
              caps.canRelay
                  ? 'This phone can also relay: once it is playing, it can share '
                      'the session on its own network so more phones can join.'
                  : caps.isIOS
                      ? 'iPhones can host or listen. Relaying the session to more '
                          'phones needs an Android phone.'
                      : 'This phone can host or listen.',
              icon: Icons.hub_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.primary = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final bg = primary ? scheme.primary : scheme.surfaceContainerHigh;
    final fg = primary ? scheme.onPrimary : scheme.onSurface;
    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: fg.withValues(alpha: 0.14),
                child: Icon(icon, color: fg, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            color: fg, fontSize: 20, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style: TextStyle(color: fg.withValues(alpha: 0.85), height: 1.35)),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: fg),
            ],
          ),
        ),
      ),
    );
  }
}
