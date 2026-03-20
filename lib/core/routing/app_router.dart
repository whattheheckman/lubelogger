import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
import 'route_names.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _vehiclesShellKey = GlobalKey<NavigatorState>();
final _remindersShellKey = GlobalKey<NavigatorState>();
final _settingsShellKey = GlobalKey<NavigatorState>();

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
                      vehicleId: int.parse(state.pathParameters['vehicleId']!),
                    ),
                    routes: [
                      GoRoute(
                        path: 'edit',
                        builder: (context, state) => VehicleFormScreen(
                          vehicleId: int.tryParse(state.pathParameters['vehicleId'] ?? ''),
                        ),
                      ),
                      GoRoute(
                        path: 'service',
                        builder: (context, state) => ServiceRecordListScreen(
                          vehicleId: int.parse(state.pathParameters['vehicleId']!),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => ServiceRecordFormScreen(
                              vehicleId: int.parse(state.pathParameters['vehicleId']!),
                            ),
                          ),
                          GoRoute(
                            path: ':recordId/edit',
                            builder: (context, state) => ServiceRecordFormScreen(
                              vehicleId: int.parse(state.pathParameters['vehicleId']!),
                              recordId: int.tryParse(state.pathParameters['recordId'] ?? ''),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'repairs',
                        builder: (context, state) => RepairRecordListScreen(
                          vehicleId: int.parse(state.pathParameters['vehicleId']!),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => RepairRecordFormScreen(
                              vehicleId: int.parse(state.pathParameters['vehicleId']!),
                            ),
                          ),
                          GoRoute(
                            path: ':recordId/edit',
                            builder: (context, state) => RepairRecordFormScreen(
                              vehicleId: int.parse(state.pathParameters['vehicleId']!),
                              recordId: int.tryParse(state.pathParameters['recordId'] ?? ''),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'upgrades',
                        builder: (context, state) => UpgradeRecordListScreen(
                          vehicleId: int.parse(state.pathParameters['vehicleId']!),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => UpgradeRecordFormScreen(
                              vehicleId: int.parse(state.pathParameters['vehicleId']!),
                            ),
                          ),
                          GoRoute(
                            path: ':recordId/edit',
                            builder: (context, state) => UpgradeRecordFormScreen(
                              vehicleId: int.parse(state.pathParameters['vehicleId']!),
                              recordId: int.tryParse(state.pathParameters['recordId'] ?? ''),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'fuel',
                        builder: (context, state) => GasRecordListScreen(
                          vehicleId: int.parse(state.pathParameters['vehicleId']!),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => GasRecordFormScreen(
                              vehicleId: int.parse(state.pathParameters['vehicleId']!),
                            ),
                          ),
                          GoRoute(
                            path: ':recordId/edit',
                            builder: (context, state) => GasRecordFormScreen(
                              vehicleId: int.parse(state.pathParameters['vehicleId']!),
                              recordId: int.tryParse(state.pathParameters['recordId'] ?? ''),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'odometer',
                        builder: (context, state) => OdometerRecordListScreen(
                          vehicleId: int.parse(state.pathParameters['vehicleId']!),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => OdometerRecordFormScreen(
                              vehicleId: int.parse(state.pathParameters['vehicleId']!),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'taxes',
                        builder: (context, state) => TaxRecordListScreen(
                          vehicleId: int.parse(state.pathParameters['vehicleId']!),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => TaxRecordFormScreen(
                              vehicleId: int.parse(state.pathParameters['vehicleId']!),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'reminders',
                        builder: (context, state) => RemindersScreen(
                          vehicleId: int.parse(state.pathParameters['vehicleId']!),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => ReminderFormScreen(
                              vehicleId: int.parse(state.pathParameters['vehicleId']!),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'planner',
                        builder: (context, state) => KanbanBoardScreen(
                          vehicleId: int.parse(state.pathParameters['vehicleId']!),
                        ),
                      ),
                      GoRoute(
                        path: 'supplies',
                        builder: (context, state) => SuppliesScreen(
                          vehicleId: int.parse(state.pathParameters['vehicleId']!),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => SupplyFormScreen(
                              vehicleId: int.parse(state.pathParameters['vehicleId']!),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'notes',
                        builder: (context, state) => NotesScreen(
                          vehicleId: int.parse(state.pathParameters['vehicleId']!),
                        ),
                        routes: [
                          GoRoute(
                            path: 'add',
                            builder: (context, state) => NoteFormScreen(
                              vehicleId: int.parse(state.pathParameters['vehicleId']!),
                            ),
                          ),
                          GoRoute(
                            path: ':noteId/edit',
                            builder: (context, state) => NoteFormScreen(
                              vehicleId: int.parse(state.pathParameters['vehicleId']!),
                              noteId: int.tryParse(state.pathParameters['noteId'] ?? ''),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'reports',
                        builder: (context, state) => ReportsScreen(
                          vehicleId: int.parse(state.pathParameters['vehicleId']!),
                        ),
                      ),
                    ],
                  ),
                ],
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
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({super.key, required this.shell});
  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: (index) =>
            shell.goBranch(index, initialLocation: index == shell.currentIndex),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.directions_car), label: 'Vehicles'),
          NavigationDestination(icon: Icon(Icons.notifications), label: 'Reminders'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
