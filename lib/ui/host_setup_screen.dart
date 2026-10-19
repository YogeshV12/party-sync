import 'dart:async';

import 'package:flutter/material.dart';

import '../app_scope.dart';
import '../core/util.dart';
import '../engine/session_engine.dart';
import '../l10n/app_localizations.dart';
import 'host_live_screen.dart';
import 'widgets/common.dart';

class HostSetupScreen extends StatefulWidget {
  const HostSetupScreen({super.key});

  @override
  State<HostSetupScreen> createState() => _HostSetupScreenState();
}

class _HostSetupScreenState extends State<HostSetupScreen> {
  late final TextEditingController _sessionName;
  late final TextEditingController _ssid;
  late final TextEditingController _password;
  late HostNetworkMode _mode;
  late bool _voiceProcessing;
  bool _showPassword = false;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    _initialized = true;
    final scope = AppScope.of(context);
    _sessionName =
        TextEditingController(
            text: AppLocalizations.of(context).partyNameDefault(scope.engine.displayName));
    _ssid = TextEditingController(text: scope.prefs.hotspotSsid);
    _password = TextEditingController(text: scope.prefs.hotspotPassword);
    _mode = scope.engine.caps.canCreateNetwork
        ? HostNetworkMode.appNetwork
        : HostNetworkMode.phoneHotspot;
    _voiceProcessing = scope.prefs.voiceProcessing;
  }

  @override
  void dispose() {
    _sessionName.dispose();
    _ssid.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _openHotspotSettings() async {
    final opened = await AppScope.of(context).engine.net.openHotspotSettings();
    if (!opened && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).hotspotSettingsHint),
      ));
    }
  }

  void _goLive() {
    final scope = AppScope.of(context);
    final l10n = AppLocalizations.of(context);
    final hotspot = _mode == HostNetworkMode.phoneHotspot;
    if (hotspot && _ssid.text.trim().isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l10n.enterHotspotName)));
      return;
    }
    if (hotspot && !isValidWifiPassword(_password.text)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l10n.invalidWifiPassword)));
      return;
    }
    scope.prefs
      ..hotspotSsid = _ssid.text.trim()
      ..hotspotPassword = _password.text
      ..voiceProcessing = _voiceProcessing;
    final name = _sessionName.text.trim().isEmpty
        ? l10n.defaultPartyName
        : _sessionName.text.trim();
    unawaited(scope.engine.startHost(
      name: name,
      mode: _mode,
      ssid: hotspot ? _ssid.text.trim() : '',
      password: hotspot ? _password.text : '',
      voiceProcessing: _voiceProcessing,
    ));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const HostLiveScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final caps = AppScope.of(context).engine.caps;
    final l10n = AppLocalizations.of(context);
    final hotspot = _mode == HostNetworkMode.phoneHotspot;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.hostSetupTitle)),
      body: SafeArea(
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            TextField(
              controller: _sessionName,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: l10n.partyNameLabel,
                helperText: l10n.partyNameHelper,
                prefixIcon: const Icon(Icons.celebration_outlined),
              ),
            ),
            SectionTitle(l10n.connectQuestion),
            if (caps.canCreateNetwork) ...[
              OptionCard(
                icon: Icons.wifi_tethering,
                title: l10n.instantNetworkTitle,
                badge: l10n.badgeEasiest,
                subtitle: l10n.instantNetworkSubtitle,
                selected: _mode == HostNetworkMode.appNetwork,
                onTap: () => setState(() => _mode = HostNetworkMode.appNetwork),
              ),
              const SizedBox(height: 10),
            ],
            OptionCard(
              icon: Icons.router_outlined,
              title: caps.isIOS ? l10n.usePersonalHotspot : l10n.useMyHotspot,
              subtitle: l10n.hotspotSubtitle,
              selected: hotspot,
              onTap: () => setState(() => _mode = HostNetworkMode.phoneHotspot),
            ),
            if (hotspot) ...[
              const SizedBox(height: 14),
              InfoBanner(
                caps.isIOS ? l10n.hotspotInfoIos : l10n.hotspotInfoAndroid,
                icon: Icons.lightbulb_outline,
              ),
              const SizedBox(height: 10),
              if (caps.isAndroid)
                OutlinedButton.icon(
                  onPressed: _openHotspotSettings,
                  icon: const Icon(Icons.settings),
                  label: Text(l10n.openHotspotSettings),
                ),
              const SizedBox(height: 12),
              TextField(
                controller: _ssid,
                decoration: InputDecoration(
                  labelText: l10n.hotspotWifiNameLabel,
                  prefixIcon: const Icon(Icons.wifi),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _password,
                obscureText: !_showPassword,
                decoration: InputDecoration(
                  labelText: l10n.hotspotPasswordLabel,
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _showPassword = !_showPassword),
                  ),
                ),
              ),
            ],
            SectionTitle(l10n.audioTuning),
            Card(
              child: SwitchListTile(
                value: _voiceProcessing,
                onChanged: (v) => setState(() => _voiceProcessing = v),
                title: Text(l10n.filterNoiseTitle),
                subtitle: Text(l10n.filterNoiseSubtitle),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(height: 28),
            FilledButton.icon(
              onPressed: _goLive,
              icon: const Icon(Icons.podcasts),
              label: Text(l10n.startParty),
            ),
          ],
        ),
      ),
    );
  }
}
