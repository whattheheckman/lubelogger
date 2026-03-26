import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/reminders/domain/reminder_record.dart';
import '../../features/reminders/providers/reminders_provider.dart';

import '../../features/setup/screens/setup_screen.dart';
import '../../features/vehicles/screens/vehicle_list_screen.dart';
import '../../features/vehicles/screens/vehicle_detail_screen.dart';
import '../../features/vehicles/screens/vehicle_form_screen.dart';
import '../../features/service_records/screens/service_record_list_screen.dart';
import '../../features/service_records/screens/service_record_form_screen.dart';
import '../../features/repair_records/screens/repair_record_list_screen.dart';
import '../../features/repair_records/screens/repair_record_form_screen.dart';
import '../../features/upgrade_records/screens/upgrade_record_list_screen.dart';
import '../../features/upgrade_records/screens/upgrade_record_form_screen.dart';
import '../../features/gas_records/screens/gas_record_list_screen.dart';
import '../../features/gas_records/screens/gas_record_form_screen.dart';
import '../../features/gas_records/screens/quick_add_fuel_screen.dart';
import '../../features/odometer/screens/odometer_record_list_screen.dart';
import '../../features/odometer/screens/odometer_record_form_screen.dart';
import '../../features/tax_records/screens/tax_record_list_screen.dart';
import '../../features/tax_records/screens/tax_record_form_screen.dart';
import '../../features/reminders/screens/reminders_screen.dart';
import '../../features/reminders/screens/reminder_form_screen.dart';
import '../../features/reminders/screens/global_reminders_screen.dart';
import '../../features/planner/screens/kanban_board_screen.dart';
import '../../features/supplies/screens/supplies_screen.dart';
import '../../features/supplies/screens/supply_form_screen.dart';
import '../../features/notes/screens/notes_screen.dart';
import '../../features/notes/screens/note_form_screen.dart';
import '../../features/reports/screens/reports_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../features/settings/screens/connection_settings_screen.dart';
import '../../features/settings/screens/tab_layout_settings_screen.dart';
import '../../features/settings/screens/notification_settings_screen.dart';
import '../../features/settings/screens/sync_log_screen.dart';
import 'route_names.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _vehiclesShellKey = GlobalKey<NavigatorState>();
final _remindersShellKey = GlobalKey<NavigatorState>();
final _settingsShellKey = GlobalKey<NavigatorState>();
final _quickFuelShellKey = GlobalKey<NavigatorState>();

int _requireId(GoRouterState state, String key) =>
    int.parse(state.pathParameters[key]!);

int? _optionalId(GoRouterState state, String key) =>
    int.tryParse(state.pathParameters[key] ?? '');

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteNames.vehicles,
    routes: [
      GoRoute(
        path: RouteNames.setup,
        builder: (context, state) => const SetupScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => ScaffoldWithNavBar(shell: shell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _vehiclesShellKey,
            routes: [
              GoRoute(
                path: RouteNames.vehicles,
                builder: (context, state) => const VehicleListScreen(),
                routes: [
                  GoRoute(
                    path: 'add',
                    builder: (context, state) => const VehicleFormScreen(),
                  ),
                  GoRoute(
                    path: ':vehicleId',
                    builder: (context, state) => VehicleDetailScreen(
                      vehicleId: _requireId(state, 'vehicleId'),
                    ),
                    routes: [
                      GoRoute(
                        path: 'edit',
                        builder: (context, state) => VehicleFormScreen(
                          vehicleId: _optionalId(state, 'vehicleId'),
                        ),
                      ),
                      GoRoute(
                        path: 'service',
                        builder: (context, state) => ServiceRecordListScreen(
                          vehicleId: _requireId(state, 'vehicleId'),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => ServiceRecordFormScreen(
                              vehicleId: _requireId(state, 'vehicleId'),
                            ),
                          ),
                          GoRoute(
                            path: ':recordId/edit',
                            builder: (context, state) => ServiceRecordFormScreen(
                              vehicleId: _requireId(state, 'vehicleId'),
                              recordId: _optionalId(state, 'recordId'),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'repairs',
                        builder: (context, state) => RepairRecordListScreen(
                          vehicleId: _requireId(state, 'vehicleId'),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => RepairRecordFormScreen(
                              vehicleId: _requireId(state, 'vehicleId'),
                            ),
                          ),
                          GoRoute(
                            path: ':recordId/edit',
                            builder: (context, state) => RepairRecordFormScreen(
                              vehicleId: _requireId(state, 'vehicleId'),
                              recordId: _optionalId(state, 'recordId'),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'upgrades',
                        builder: (context, state) => UpgradeRecordListScreen(
                          vehicleId: _requireId(state, 'vehicleId'),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => UpgradeRecordFormScreen(
                              vehicleId: _requireId(state, 'vehicleId'),
                            ),
                          ),
                          GoRoute(
                            path: ':recordId/edit',
                            builder: (context, state) => UpgradeRecordFormScreen(
                              vehicleId: _requireId(state, 'vehicleId'),
                              recordId: _optionalId(state, 'recordId'),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'fuel',
                        builder: (context, state) => GasRecordListScreen(
                          vehicleId: _requireId(state, 'vehicleId'),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => GasRecordFormScreen(
                              vehicleId: _requireId(state, 'vehicleId'),
                            ),
                          ),
                          GoRoute(
                            path: 'quick-add',
                            builder: (context, state) => QuickAddFuelScreen(
                              vehicleId: _requireId(state, 'vehicleId'),
                            ),
                          ),
                          GoRoute(
                            path: ':recordId/edit',
                            builder: (context, state) => GasRecordFormScreen(
                              vehicleId: _requireId(state, 'vehicleId'),
                              recordId: _optionalId(state, 'recordId'),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'odometer',
                        builder: (context, state) => OdometerRecordListScreen(
                          vehicleId: _requireId(state, 'vehicleId'),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => OdometerRecordFormScreen(
                              vehicleId: _requireId(state, 'vehicleId'),
                            ),
                          ),
                          GoRoute(
                            path: ':recordId/edit',
                            builder: (context, state) => OdometerRecordFormScreen(
                              vehicleId: _requireId(state, 'vehicleId'),
                              recordId: _optionalId(state, 'recordId'),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'taxes',
                        builder: (context, state) => TaxRecordListScreen(
                          vehicleId: _requireId(state, 'vehicleId'),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => TaxRecordFormScreen(
                              vehicleId: _requireId(state, 'vehicleId'),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'reminders',
                        builder: (context, state) => RemindersScreen(
                          vehicleId: _requireId(state, 'vehicleId'),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => ReminderFormScreen(
                              vehicleId: _requireId(state, 'vehicleId'),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'planner',
                        builder: (context, state) => KanbanBoardScreen(
                          vehicleId: _requireId(state, 'vehicleId'),
                        ),
                      ),
                      GoRoute(
                        path: 'supplies',
                        builder: (context, state) => SuppliesScreen(
                          vehicleId: _requireId(state, 'vehicleId'),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => SupplyFormScreen(
                              vehicleId: _requireId(state, 'vehicleId'),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'notes',
                        builder: (context, state) => NotesScreen(
                          vehicleId: _requireId(state, 'vehicleId'),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => NoteFormScreen(
                              vehicleId: _requireId(state, 'vehicleId'),
                            ),
                          ),
                          GoRoute(
                            path: ':noteId/edit',
                            builder: (context, state) => NoteFormScreen(
                              vehicleId: _requireId(state, 'vehicleId'),
                              noteId: _optionalId(state, 'noteId'),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'reports',
                        builder: (context, state) => ReportsScreen(
                          vehicleId: _requireId(state, 'vehicleId'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _quickFuelShellKey,
            routes: [
              GoRoute(
                path: RouteNames.quickFuel,
                builder: (context, state) => const QuickAddFuelScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _remindersShellKey,
            routes: [
              GoRoute(
                path: RouteNames.reminders,
                builder: (context, state) => const GlobalRemindersScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _settingsShellKey,
            routes: [
              GoRoute(
                path: RouteNames.settings,
                builder: (context, state) => const SettingsScreen(),
                routes: [
                  GoRoute(
                    path: 'connection',
                    builder: (context, state) => const ConnectionSettingsScreen(),
                  ),
                  GoRoute(
                    path: 'tab-layout',
                    builder: (context, state) => const TabLayoutSettingsScreen(),
                  ),
                  GoRoute(
                    path: 'notifications',
                    builder: (context, state) =>
                        const NotificationSettingsScreen(),
                  ),
                  GoRoute(
                    path: 'sync-log',
                    builder: (context, state) => const SyncLogScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class ScaffoldWithNavBar extends ConsumerWidget {
  const ScaffoldWithNavBar({super.key, required this.shell});
  final StatefulNavigationShell shell;

  static bool _isUrgent(ReminderRecord r) {
    if (r.reminderMetric == 'date' || r.reminderMetric == 'both') {
      if (r.dateMetric != null) {
        return r.dateMetric!.difference(DateTime.now()).inDays <= 30;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminders =
        ref.watch(allRemindersStreamProvider).valueOrNull ?? [];
    final urgentCount = reminders.where(_isUrgent).length;

    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: (index) =>
            shell.goBranch(index, initialLocation: index == shell.currentIndex),
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.directions_car),
            label: 'Vehicles',
          ),
          const NavigationDestination(
            icon: Icon(Icons.bolt),
            label: 'Quick Fuel',
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: urgentCount > 0,
              label: Text('$urgentCount'),
              child: const Icon(Icons.notifications),
            ),
            label: 'Reminders',
          ),
          const NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
