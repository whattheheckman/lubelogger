import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/notifications/notification_service.dart';
import 'core/notifications/notification_settings.dart';
import 'core/routing/app_router.dart';
import 'features/reminders/providers/reminders_provider.dart';
import 'features/vehicles/providers/vehicles_provider.dart';

class LubeLoggerApp extends ConsumerWidget {
  const LubeLoggerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(allRemindersStreamProvider, (_, next) {
      next.whenData((reminders) {
        final vehicles = ref.read(vehicleListProvider).valueOrNull ?? [];
        final settings =
            ref.read(notificationSettingsRepositoryProvider).settings;
        final service = ref.read(notificationServiceProvider);
        final vehicleNames = {
          for (final v in vehicles) v.id: '${v.year} ${v.model}'
        };
        service.scheduleAll(reminders, vehicleNames, settings);
      });
    });

    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'LubeLogger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0)),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.grey),
          hintStyle: TextStyle(color: Colors.grey),
          floatingLabelStyle: TextStyle(color: Color(0xFF90CAF9)),
        ),
      ),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
