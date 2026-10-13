import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../core/join_info.dart';

/// Shows how to join a host or relay: an app QR (joins Wi-Fi and finds the
/// session), or a plain Wi-Fi QR the phone's camera understands.
class QrPanel extends StatefulWidget {
  const QrPanel({super.key, required this.join, required this.title});

  final JoinInfo join;
  final String title;

  @override
  State<QrPanel> createState() => _QrPanelState();
}

class _QrPanelState extends State<QrPanel> {
  bool _wifiCode = false;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final join = widget.join;
    final data = _wifiCode ? join.toWifiQr() : join.toUri();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Text(widget.title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(value: false, label: Text('App code'), icon: Icon(Icons.qr_code_2)),
                ButtonSegment(value: true, label: Text('Wi-Fi code'), icon: Icon(Icons.wifi)),
              ],
              selected: {_wifiCode},
              onSelectionChanged: (s) => setState(() => _wifiCode = s.first),
            ),
            const SizedBox(height: 16),
            if (join.ssid.isEmpty)
              const Padding(
                padding: EdgeInsets.all(24),
                child: Text('Waiting for network details…'),
              )
            else
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: QrImageView(
                  data: data,
                  size: 220,
                  backgroundColor: Colors.white,
                  eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.circle, color: Color(0xFF1B1530)),
                  dataModuleStyle: const QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.circle,
                      color: Color(0xFF1B1530)),
                ),
              ),
            const SizedBox(height: 12),
            Text(
              _wifiCode
                  ? "Scan with the phone's Camera app to join the Wi-Fi, then open "
                      "Party Sync → \"I'm already on the host's Wi-Fi\"."
                  : 'Scan in Party Sync → Join as a speaker. It joins the Wi-Fi '
                      'and finds this phone by itself.',
              textAlign: TextAlign.center,
              style: TextStyle(color: scheme.onSurfaceVariant, height: 1.35),
            ),
            const SizedBox(height: 8),
            _DetailRow(label: 'Network', value: join.ssid),
            _DetailRow(
              label: 'Password',
              value: _showPassword ? join.password : '•' * join.password.length.clamp(0, 12),
              copyValue: join.password,
              trailing: IconButton(
                tooltip: _showPassword ? 'Hide' : 'Show',
                icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _showPassword = !_showPassword),
              ),
            ),
            if (join.hosts.isNotEmpty)
              _DetailRow(label: 'Address', value: join.hosts.first),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value, this.copyValue, this.trailing});
  final String label;
  final String value;
  final String? copyValue;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    if (value.isEmpty) return const SizedBox.shrink();
    final scheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(label, style: TextStyle(color: scheme.onSurfaceVariant)),
        ),
        Expanded(
          child: SelectableText(value,
              style: const TextStyle(fontWeight: FontWeight.w600)),
        ),
        ?trailing,
        IconButton(
          tooltip: 'Copy',
          icon: const Icon(Icons.copy, size: 18),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: copyValue ?? value));
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('$label copied')));
          },
        ),
      ],
    );
  }
}
