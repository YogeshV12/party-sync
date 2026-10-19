import 'package:flutter/material.dart';

import '../app_scope.dart';
import '../l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context);
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
                Text('Crowd Speaker',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w700)),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              l10n.homeTagline,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: scheme.onSurfaceVariant, height: 1.4),
            ),
            const SizedBox(height: 22),
            TextField(
              controller: _name,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: l10n.nameLabel,
                helperText: l10n.nameHelper,
                prefixIcon: const Icon(Icons.person_outline),
              ),
              onChanged: _saveName,
            ),
            SectionTitle(l10n.homeVibeTitle),
            _RoleCard(
              icon: Icons.mic,
              title: l10n.hostCardTitle,
              subtitle: l10n.hostCardSubtitle,
              primary: true,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const HostSetupScreen())),
            ),
            const SizedBox(height: 12),
            _RoleCard(
              icon: Icons.speaker_group,
              title: l10n.joinCardTitle,
              subtitle: l10n.joinCardSubtitle,
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const JoinScreen())),
            ),
            const SizedBox(height: 20),
            InfoBanner(
              caps.canRelay
                  ? l10n.homeTipRelay
                  : caps.isIOS
                      ? l10n.homeTipIos
                      : l10n.homeTipDefault,
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
