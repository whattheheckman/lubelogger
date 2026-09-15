import 'package:app_badge_plus/app_badge_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:lubelogger/features/reminders/domain/reminder_record.dart';
import 'notification_settings.dart';

class NotificationService {
  static const _channelId = 'lubelogger_reminders';
  static const _channelName = 'Reminders';
  static final _dateFmt = DateFormat.yMMMd();

  final _plugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tz.initializeTimeZones();

    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    await _plugin.initialize(
      const InitializationSettings(android: androidSettings),
    );

    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
          const AndroidNotificationChannel(
            _channelId,
            _channelName,
            description: 'Vehicle maintenance reminder notifications',
            importance: Importance.high,
          ),
        );
  }

  Future<bool> requestPermissions() async {
    final granted = await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    return granted ?? false;
  }

  Future<void> scheduleAll(
    List<ReminderRecord> reminders,
    Map<int, String> vehicleNames,
    NotificationSettings settings,
  ) async {
    await _plugin.cancelAll();

    final urgentCount = reminders.where(_isUrgent).length;
    await updateBadge(urgentCount);

    if (!settings.enabled) return;

    final now = DateTime.now();

    for (final r in reminders) {
      if (r.dateMetric == null) continue;
      if (r.reminderMetric != 'date' && r.reminderMetric != 'both') continue;

      final notifyAt = DateTime(
        r.dateMetric!.year,
        r.dateMetric!.month,
        r.dateMetric!.day,
        settings.notifyHour,
        settings.notifyMinute,
      ).subtract(Duration(days: settings.daysBefore));

      if (notifyAt.isBefore(now)) continue;

      final vehicleName = vehicleNames[r.vehicleId] ?? 'Your vehicle';
      final dueStr = _dateFmt.format(r.dateMetric!);

      await _plugin.zonedSchedule(
        r.id,
        r.description,
        '$vehicleName — due $dueStr',
        tz.TZDateTime.from(notifyAt, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            _channelId,
            _channelName,
            importance: Importance.high,
            priority: Priority.high,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
  }

  Future<void> showTestNotification() async {
    await _plugin.show(
      0,
      'Test Notification',
      'LubeLogger reminders are working!',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
    );
  }

  Future<void> updateBadge(int count) async {
    try {
      await AppBadgePlus.updateBadge(count);
    } catch (_) {
      // Badge not supported on this device/launcher
    }
  }

  static bool _isUrgent(ReminderRecord r) {
    if (r.reminderMetric == 'date' || r.reminderMetric == 'both') {
      if (r.dateMetric != null) {
        return r.dateMetric!.difference(DateTime.now()).inDays <= 30;
      }
    }
    return false;
  }
}

final notificationServiceProvider = Provider<NotificationService>(
  (_) => throw UnimplementedError('Override in ProviderScope overrides'),
);
