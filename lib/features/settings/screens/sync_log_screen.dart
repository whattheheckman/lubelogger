import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/sync/sync_logger.dart';

class SyncLogScreen extends ConsumerWidget {
  const SyncLogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logger = ref.watch(syncLoggerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sync Log'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Clear log',
            onPressed: () => logger.clear(),
          ),
        ],
      ),
      body: StreamBuilder<List<SyncLogEntry>>(
        stream: logger.stream,
        initialData: logger.entries,
        builder: (context, snapshot) {
          final entries = snapshot.data ?? [];

          if (entries.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sync_disabled, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No sync activity yet.'),
                ],
              ),
            );
          }

          return ListView.builder(
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: entries.length,
            itemBuilder: (context, i) {
              // reverse: true means index 0 is the last entry
              final entry = entries[entries.length - 1 - i];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  entry.toString(),
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: _entryColor(entry.message, context),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Color _entryColor(String message, BuildContext context) {
    if (message.startsWith('Failed') || message.startsWith('Sync failed')) {
      return Colors.red;
    }
    if (message.startsWith('Retrying')) {
      return Colors.orange;
    }
    if (message == 'Fully synced' || message == 'Nothing to sync') {
      return Colors.green;
    }
    return Theme.of(context).colorScheme.onSurface;
  }
}
