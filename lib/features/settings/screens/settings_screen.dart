import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/route_names.dart';
import '../../../core/settings/settings_repository.dart';
import '../../../core/sync/sync_service.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _syncing = false;

  static const _intervalOptions = [1, 5, 120, 480, 1440];

  String _formatInterval(int minutes) => switch (minutes) {
        1 => '1 minute',
        5 => '5 minutes',
        120 => '2 hours',
        480 => '8 hours',
        1440 => '1 day',
        _ => '$minutes minutes',
      };

  Future<void> _syncNow() async {
    setState(() => _syncing = true);
    try {
      await ref.read(syncServiceProvider).pushPending();
    } finally {
      if (mounted) setState(() => _syncing = false);
    }
  }

  Future<void> _pickSyncInterval(int current) async {
    int selected = current;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Sync Interval'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _intervalOptions
                .map((m) => RadioListTile<int>(
                      title: Text(_formatInterval(m)),
                      value: m,
                      groupValue: selected,
                      onChanged: (v) => setState(() => selected = v!),
                    ))
                .toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
    if (confirmed == true) {
      final repo = ref.read(settingsRepositoryProvider);
      await repo.save(repo.current.copyWith(syncIntervalMinutes: selected));
      ref.invalidate(settingsRepositoryProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsRepositoryProvider).current;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.cloud_outlined),
            title: const Text('Connection Settings'),
            subtitle: Text(settings.serverUrl.isEmpty
                ? 'Not configured'
                : settings.serverUrl),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(RouteNames.settingsConnection),
          ),
          ListTile(
            leading: const Icon(Icons.tab_outlined),
            title: const Text('Tab Layout'),
            subtitle: const Text('Reorder or hide vehicle detail tabs'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(RouteNames.settingsTabLayout),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Notification Settings'),
            subtitle: const Text('Reminders and app badge'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(RouteNames.settingsNotifications),
          ),
          ListTile(
            leading: const Icon(Icons.download_outlined),
            title: const Text('Export Data'),
            subtitle: const Text('Save records as CSV files'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(RouteNames.settingsExport),
          ),
          ListTile(
            leading: const Icon(Icons.upload_outlined),
            title: const Text('Import Data'),
            subtitle: const Text('Load records from CSV files'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(RouteNames.settingsImport),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Mode'),
            subtitle: Text(settings.appMode.name),
          ),
          ListTile(
            leading: const Icon(Icons.schedule_outlined),
            title: const Text('Sync Interval'),
            subtitle: Text(_formatInterval(settings.syncIntervalMinutes)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _pickSyncInterval(settings.syncIntervalMinutes),
          ),
          ListTile(
            leading: const Icon(Icons.sync_outlined),
            title: const Text('Sync Log'),
            subtitle: const Text('View sync activity'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go(RouteNames.settingsSyncLog),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: FilledButton.icon(
              onPressed: _syncing ? null : _syncNow,
              icon: _syncing
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white),
                    )
                  : const Icon(Icons.sync),
              label: Text(_syncing ? 'Syncing…' : 'Sync Now'),
            ),
          ),
          const Divider(),
          SwitchListTile(
            secondary: const Icon(Icons.speed),
            title: const Text('Auto-add Odometer Records'),
            subtitle: const Text(
                'Automatically create an odometer entry when saving gas, service, repair, or upgrade records'),
            value: settings.autoAddOdometerRecords,
            onChanged: (v) async {
              await ref
                  .read(settingsRepositoryProvider)
                  .save(settings.copyWith(autoAddOdometerRecords: v));
              ref.invalidate(settingsRepositoryProvider);
            },
          ),
        ],
      ),
    );
  }
}
