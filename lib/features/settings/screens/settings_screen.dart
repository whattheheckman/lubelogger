import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/settings/settings_repository.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsRepositoryProvider).current;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.cloud_outlined),
            title: const Text('Connection Settings'),
            subtitle: Text(settings.serverUrl.isEmpty ? 'Not configured' : settings.serverUrl),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/settings/connection'),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Mode'),
            subtitle: Text(settings.appMode.name),
          ),
          ListTile(
            leading: const Icon(Icons.sync),
            title: const Text('Sync Interval'),
            subtitle: Text('${settings.syncIntervalMinutes} minutes'),
          ),
        ],
      ),
    );
  }
}
