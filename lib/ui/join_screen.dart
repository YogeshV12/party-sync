import 'dart:async';

import 'package:flutter/material.dart';

import '../app_scope.dart';
import '../core/join_info.dart';
import 'listener_screen.dart';
import 'scanner_screen.dart';
import 'widgets/common.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final _ssid = TextEditingController();
  final _password = TextEditingController();
  final _host = TextEditingController();

  @override
  void dispose() {
    _ssid.dispose();
    _password.dispose();
    _host.dispose();
    super.dispose();
  }

  void _join(JoinInfo info, {bool alreadyOnWifi = false}) {
    unawaited(AppScope.of(context)
        .engine
        .joinSession(info, alreadyOnWifi: alreadyOnWifi));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const ListenerScreen()));
  }

  Future<void> _scan() async {
    final info = await Navigator.push<JoinInfo>(
        context, MaterialPageRoute(builder: (_) => const ScannerScreen()));
    if (info != null && mounted) _join(info);
  }

  void _joinManual() {
    final ssid = _ssid.text.trim();
    final host = _host.text.trim();
    if (ssid.isEmpty && host.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Enter the network name.')));
      return;
    }
    _join(JoinInfo(
      ssid: ssid,
      password: _password.text,
      hosts: host.isEmpty ? const [] : [host],
    ));
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final caps = AppScope.of(context).engine.caps;
    return Scaffold(
      appBar: AppBar(title: const Text('Join as a speaker')),
      body: SafeArea(
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            Material(
              color: scheme.primary,
              borderRadius: BorderRadius.circular(24),
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: _scan,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
                  child: Column(
                    children: [
                      Icon(Icons.qr_code_scanner, size: 64, color: scheme.onPrimary),
                      const SizedBox(height: 12),
                      Text('Scan QR code',
                          style: TextStyle(
                              color: scheme.onPrimary,
                              fontSize: 22,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6),
                      Text(
                        'Joins the Wi-Fi and finds the host automatically',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: scheme.onPrimary.withValues(alpha: 0.85)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            OutlinedButton.icon(
              onPressed: () => _join(const JoinInfo(ssid: '', password: ''),
                  alreadyOnWifi: true),
              icon: const Icon(Icons.wifi),
              label: const Text("I'm already on the host's Wi-Fi"),
            ),
            const SizedBox(height: 8),
            Card(
              clipBehavior: Clip.antiAlias,
              child: ExpansionTile(
                leading: const Icon(Icons.keyboard_outlined),
                title: const Text('Enter details by hand'),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  TextField(
                    controller: _ssid,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(labelText: 'Network name'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _password,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _host,
                    // The iOS number pad has no return key and hides the Join button.
                    keyboardType: TextInputType.url,
                    autocorrect: false,
                    textInputAction: TextInputAction.go,
                    onSubmitted: (_) => _joinManual(),
                    decoration: const InputDecoration(
                      labelText: 'Host address (optional)',
                      helperText: 'Shown under the QR code on the host',
                    ),
                  ),
                  const SizedBox(height: 14),
                  FilledButton(onPressed: _joinManual, child: const Text('Join')),
                ],
              ),
            ),
            const SizedBox(height: 18),
            InfoBanner(
              caps.isIOS
                  ? 'iPhone asks once to join the network. Keep this app open (or '
                      'playing in the background) to keep hearing the host.'
                  : 'Android shows a "Connect to device" prompt. Pick the host\'s '
                      'network to continue.',
              icon: Icons.lightbulb_outline,
            ),
          ],
        ),
      ),
    );
  }
}
