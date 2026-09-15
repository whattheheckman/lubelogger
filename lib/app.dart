import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_actions/quick_actions.dart';

import 'core/notifications/notification_service.dart';
import 'core/notifications/notification_settings.dart';
import 'core/routing/app_router.dart';
import 'core/routing/route_names.dart';
import 'features/reminders/providers/reminders_provider.dart';
import 'features/vehicles/domain/vehicle.dart';
import 'features/vehicles/providers/vehicles_provider.dart';

class LubeLoggerApp extends ConsumerStatefulWidget {
  const LubeLoggerApp({super.key});

  @override
  ConsumerState<LubeLoggerApp> createState() => _LubeLoggerAppState();
}

class _LubeLoggerAppState extends ConsumerState<LubeLoggerApp> {
  final _quickActions = const QuickActions();

  @override
  void initState() {
    super.initState();
    _quickActions.initialize((shortcutType) {
      final router = ref.read(appRouterProvider);
      if (shortcutType == 'reminders') {
        router.go(RouteNames.reminders);
      } else if (shortcutType == 'quick_fuel') {
        router.go(RouteNames.quickFuel);
      } else if (shortcutType.startsWith('vehicle_')) {
        final id = int.tryParse(shortcutType.substring('vehicle_'.length));
        if (id != null) router.go(RouteNames.vehicleDetailPath(id));
      }
    });
  }

  void _updateShortcuts(List<Vehicle> vehicles) {
    final items = <ShortcutItem>[
      const ShortcutItem(type: 'reminders', localizedTitle: 'Reminders'),
      const ShortcutItem(type: 'quick_fuel', localizedTitle: 'Quick Add'),
    ];

    if (vehicles.isNotEmpty) {
      final recent = vehicles.reduce(
        (a, b) => a.updatedAt.isAfter(b.updatedAt) ? a : b,
      );
      items.add(ShortcutItem(
        type: 'vehicle_${recent.id}',
        localizedTitle: '${recent.year} ${recent.model}',
      ));
    }

    _quickActions.setShortcutItems(items);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(vehicleListProvider, (_, next) {
      next.whenData(_updateShortcuts);
    });

    ref.listen(allRemindersStreamProvider, (_, next) {
      next.whenData((reminders) {
        final vehicles = ref.read(vehicleListProvider).value ?? [];
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
