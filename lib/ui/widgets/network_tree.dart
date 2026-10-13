import 'package:flutter/material.dart';

import '../../core/protocol.dart';
import '../theme.dart';

/// Orders nodes as a depth-first tree under [rootId]. Nodes whose parent
/// hasn't reported yet are appended at the end.
List<NodeStatus> treeOrder(Map<String, NodeStatus> nodes, String rootId) {
  final byParent = <String?, List<NodeStatus>>{};
  for (final n in nodes.values) {
    if (n.id == rootId) continue;
    byParent.putIfAbsent(n.parentId, () => []).add(n);
  }
  for (final list in byParent.values) {
    list.sort((a, b) => a.name.compareTo(b.name));
  }
  final out = <NodeStatus>[];
  final seen = <String>{};
  void visit(NodeStatus n) {
    if (!seen.add(n.id)) return;
    out.add(n);
    for (final c in byParent[n.id] ?? const <NodeStatus>[]) {
      visit(c);
    }
  }

  final root = nodes[rootId];
  if (root != null) visit(root);
  for (final n in nodes.values) {
    if (!seen.contains(n.id)) visit(n);
  }
  return out;
}

class NetworkTree extends StatelessWidget {
  const NetworkTree({super.key, required this.nodes, required this.rootId});

  final Map<String, NodeStatus> nodes;
  final String rootId;

  @override
  Widget build(BuildContext context) {
    final ordered = treeOrder(nodes, rootId);
    final scheme = Theme.of(context).colorScheme;
    if (ordered.length <= 1) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(Icons.hourglass_empty, color: scheme.onSurfaceVariant),
              const SizedBox(width: 12),
              const Expanded(
                child: Text('No speakers yet. Have the squad scan your QR code to turn up!'),
              ),
            ],
          ),
        ),
      );
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [for (final n in ordered) _NodeRow(node: n)],
        ),
      ),
    );
  }
}

class _NodeRow extends StatelessWidget {
  const _NodeRow({required this.node});
  final NodeStatus node;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final icon = switch (node.role) {
      'host' => Icons.mic,
      'relay' => Icons.wifi_tethering,
      _ => (node.route ?? '').toLowerCase().contains('bluetooth')
          ? Icons.bluetooth_audio
          : Icons.speaker,
    };
    final details = <String>[
      if (node.role == 'relay') 'Booster 📡 · ${node.children} synced',
      if (node.route != null && node.route!.isNotEmpty) node.route!,
      if (node.bufferMs != null) '${node.bufferMs!.round()} ms buffer',
      if (node.lossPct != null && node.lossPct! >= 0.5)
        '${node.lossPct!.toStringAsFixed(1)}% drops',
    ];
    final health = node.role == 'host'
        ? null
        : healthColor(scheme, bufferHealth(node.bufferMs ?? 0));
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0 + node.depth * 20.0, 6, 16, 6),
      child: Row(
        children: [
          if (node.depth > 0)
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Icon(Icons.subdirectory_arrow_right,
                  size: 16, color: scheme.outline),
            ),
          CircleAvatar(
            radius: 18,
            backgroundColor: node.role == 'host'
                ? scheme.primary
                : scheme.secondaryContainer,
            child: Icon(icon,
                size: 18,
                color: node.role == 'host'
                    ? scheme.onPrimary
                    : scheme.onSecondaryContainer),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  node.role == 'host' ? '${node.name} (you 🎤)' : node.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
                if (details.isNotEmpty)
                  Text(details.join(' · '),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant)),
              ],
            ),
          ),
          if (node.battery != null) ...[
            Icon(
              node.battery! < 20 ? Icons.battery_alert : Icons.battery_std,
              size: 16,
              color: node.battery! < 20 ? scheme.error : scheme.onSurfaceVariant,
            ),
            Text('${node.battery}%',
                style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant)),
          ],
          if (health != null) ...[
            const SizedBox(width: 10),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(color: health, shape: BoxShape.circle),
            ),
          ],
        ],
      ),
    );
  }
}
