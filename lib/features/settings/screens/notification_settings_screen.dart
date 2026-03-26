import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/notifications/notification_service.dart';
import '../../../core/notifications/notification_settings.dart';

class NotificationSettingsScreen extends ConsumerStatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  ConsumerState<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends ConsumerState<NotificationSettingsScreen> {
  late NotificationSettings _settings;

  @override
  void initState() {
    super.initState();
    _settings = ref.read(notificationSettingsRepositoryProvider).settings;
  }

  Future<void> _save(NotificationSettings updated) async {
    await ref.read(notificationSettingsRepositoryProvider).save(updated);
    setState(() => _settings = updated);
    // Trigger reschedule
    _reschedule(updated);
  }

  void _reschedule(NotificationSettings settings) {
    // The app-level listener in app.dart handles rescheduling on reminder
    // changes. For settings changes, force a reschedule immediately.
    ref.invalidate(notificationServiceProvider);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: _settings.notifyHour, minute: _settings.notifyMinute),
    );
    if (picked != null) {
      await _save(_settings.copyWith(
          notifyHour: picked.hour, notifyMinute: picked.minute));
    }
  }

  String _formatTime() {
    final h = _settings.notifyHour;
    final m = _settings.notifyMinute;
    final period = h >= 12 ? 'PM' : 'AM';
    final displayH = h % 12 == 0 ? 12 : h % 12;
    final displayM = m.toString().padLeft(2, '0');
    return '$displayH:$displayM $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            secondary: const Icon(Icons.notifications_outlined),
            title: const Text('Enable Reminders'),
            subtitle: const Text('Receive notifications for upcoming service'),
            value: _settings.enabled,
            onChanged: (v) => _save(_settings.copyWith(enabled: v)),
          ),
          const Divider(),
          ListTile(
            enabled: _settings.enabled,
            leading: const Icon(Icons.calendar_today_outlined),
            title: const Text('Days Before Due Date'),
            subtitle: Text('Notify ${_settings.daysBefore} day${_settings.daysBefore == 1 ? '' : 's'} before'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _settings.enabled && _settings.daysBefore > 1
                      ? () => _save(
                          _settings.copyWith(daysBefore: _settings.daysBefore - 1))
                      : null,
                ),
                SizedBox(
                  width: 32,
                  child: Text(
                    '${_settings.daysBefore}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _settings.enabled && _settings.daysBefore < 30
                      ? () => _save(
                          _settings.copyWith(daysBefore: _settings.daysBefore + 1))
                      : null,
                ),
              ],
            ),
          ),
          ListTile(
            enabled: _settings.enabled,
            leading: const Icon(Icons.access_time_outlined),
            title: const Text('Notification Time'),
            subtitle: Text(_formatTime()),
            trailing: const Icon(Icons.chevron_right),
            onTap: _settings.enabled ? _pickTime : null,
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: OutlinedButton.icon(
              onPressed: _settings.enabled
                  ? () async {
                      await ref
                          .read(notificationServiceProvider)
                          .showTestNotification();
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Test notification sent')),
                        );
                      }
                    }
                  : null,
              icon: const Icon(Icons.send_outlined),
              label: const Text('Send Test Notification'),
            ),
          ),
        ],
      ),
    );
  }
}
