import 'dart:async';

import 'package:flutter/material.dart';

import '../app_scope.dart';
import '../core/util.dart';
import '../engine/session_engine.dart';
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
        TextEditingController(text: "${scope.engine.displayName}'s party");
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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Open Settings → Personal Hotspot and turn on '
            '"Allow Others to Join".'),
      ));
    }
  }

  void _goLive() {
    final scope = AppScope.of(context);
    final hotspot = _mode == HostNetworkMode.phoneHotspot;
    if (hotspot && _ssid.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Enter your hotspot name so friends can join.')));
      return;
    }
    if (hotspot && !isValidWifiPassword(_password.text)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Wi-Fi passwords must be 8–63 characters. Check your hotspot settings and try again!')));
      return;
    }
    scope.prefs
      ..hotspotSsid = _ssid.text.trim()
      ..hotspotPassword = _password.text
      ..voiceProcessing = _voiceProcessing;
    final name = _sessionName.text.trim().isEmpty ? 'Party' : _sessionName.text.trim();
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
    final hotspot = _mode == HostNetworkMode.phoneHotspot;
    return Scaffold(
      appBar: AppBar(title: const Text('Host the Party 🎤')),
      body: SafeArea(
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            TextField(
              controller: _sessionName,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Party name',
                helperText: 'What friends will see when they join',
                prefixIcon: Icon(Icons.celebration_outlined),
              ),
            ),
            const SectionTitle('How should friends connect?'),
            if (caps.canCreateNetwork) ...[
              OptionCard(
                icon: Icons.wifi_tethering,
                title: 'Instant Party Network',
                badge: 'Easiest',
                subtitle: 'Zero setup needed. Creates an instant local bubble for everyone to tap in. (No internet needed).',
                selected: _mode == HostNetworkMode.appNetwork,
                onTap: () => setState(() => _mode = HostNetworkMode.appNetwork),
              ),
              const SizedBox(height: 10),
            ],
            OptionCard(
              icon: Icons.router_outlined,
              title: caps.isIOS ? 'Use Personal Hotspot' : 'Use my phone hotspot',
              subtitle: "Turn on your phone's hotspot manually. Also lets friends share your mobile internet.",
              selected: hotspot,
              onTap: () => setState(() => _mode = HostNetworkMode.phoneHotspot),
            ),
            if (hotspot) ...[
              const SizedBox(height: 14),
              InfoBanner(
                caps.isIOS
                    ? 'Turn on Personal Hotspot in Settings ("Allow Others to Join"), '
                        'then enter your iPhone name & hotspot password below so friends can join.'
                    : 'Turn on your hotspot in Settings, then enter your Wi-Fi name and '
                        'password below so friends can join.',
                icon: Icons.lightbulb_outline,
              ),
              const SizedBox(height: 10),
              if (caps.isAndroid)
                OutlinedButton.icon(
                  onPressed: _openHotspotSettings,
                  icon: const Icon(Icons.settings),
                  label: const Text('Open hotspot settings'),
                ),
              const SizedBox(height: 12),
              TextField(
                controller: _ssid,
                decoration: const InputDecoration(
                  labelText: 'Hotspot Wi-Fi name',
                  prefixIcon: Icon(Icons.wifi),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _password,
                obscureText: !_showPassword,
                decoration: InputDecoration(
                  labelText: 'Hotspot password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _showPassword = !_showPassword),
                  ),
                ),
              ),
            ],
            const SectionTitle('Audio Tuning'),
            Card(
              child: SwitchListTile(
                value: _voiceProcessing,
                onChanged: (v) => setState(() => _voiceProcessing = v),
                title: const Text('Filter background noise'),
                subtitle: const Text(
                    "Keeps voices crisp. Toggle off if you are blasting music or using DJ gear."),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(height: 28),
            FilledButton.icon(
              onPressed: _goLive,
              icon: const Icon(Icons.podcasts),
              label: const Text('Start the Party 🔥'),
            ),
          ],
        ),
      ),
    );
  }
}
