import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;

import 'app.dart';
import 'core/notifications/notification_service.dart';
import 'core/notifications/notification_settings.dart';
import 'core/settings/settings_repository.dart';
import 'core/settings/tab_layout_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  final prefs = await SharedPreferences.getInstance();
  final settingsRepo = SettingsRepository(prefs);
  final tabLayoutRepo = TabLayoutRepository(prefs);
  final notifSettingsRepo = NotificationSettingsRepository(prefs);
  final notifService = NotificationService();
  await notifService.init();
  await notifService.requestPermissions();

  runApp(
    ProviderScope(
      overrides: [
        settingsRepositoryProvider.overrideWithValue(settingsRepo),
        tabLayoutRepositoryProvider.overrideWithValue(tabLayoutRepo),
        notificationSettingsRepositoryProvider
            .overrideWithValue(notifSettingsRepo),
        notificationServiceProvider.overrideWithValue(notifService),
      ],
      child: const LubeLoggerApp(),
    ),
  );
}
