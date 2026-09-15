import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:lubelogger/core/routing/route_names.dart';
import 'package:lubelogger/core/settings/tab_layout_repository.dart';
import 'package:lubelogger/features/vehicles/providers/vehicles_provider.dart';
import 'package:lubelogger/features/gas_records/screens/gas_record_list_screen.dart';
import 'package:lubelogger/features/notes/screens/notes_screen.dart';
import 'vehicle_overview_screen.dart';
import 'package:lubelogger/features/odometer/screens/odometer_record_list_screen.dart';
import 'package:lubelogger/features/planner/screens/kanban_board_screen.dart';
import 'package:lubelogger/features/reminders/screens/reminders_screen.dart';
import 'package:lubelogger/features/repair_records/screens/repair_record_list_screen.dart';
import 'package:lubelogger/features/reports/screens/reports_screen.dart';
import 'package:lubelogger/features/service_records/screens/service_record_list_screen.dart';
import 'package:lubelogger/features/supplies/screens/supplies_screen.dart';
import 'package:lubelogger/features/tax_records/screens/tax_record_list_screen.dart';
import 'package:lubelogger/features/upgrade_records/screens/upgrade_record_list_screen.dart';

/// All possible tab builders keyed by tab ID.
Widget Function(int) _tabBuilder(String id) {
  switch (id) {
    case 'Overview':
      return (vehicleId) =>
          VehicleOverviewScreen(vehicleId: vehicleId, embedded: true);
    case 'Service':
      return (vehicleId) =>
          ServiceRecordListScreen(vehicleId: vehicleId, embedded: true);
    case 'Repairs':
      return (vehicleId) =>
          RepairRecordListScreen(vehicleId: vehicleId, embedded: true);
    case 'Upgrades':
      return (vehicleId) =>
          UpgradeRecordListScreen(vehicleId: vehicleId, embedded: true);
    case 'Fuel':
      return (vehicleId) =>
          GasRecordListScreen(vehicleId: vehicleId, embedded: true);
    case 'Odometer':
      return (vehicleId) =>
          OdometerRecordListScreen(vehicleId: vehicleId, embedded: true);
    case 'Taxes':
      return (vehicleId) =>
          TaxRecordListScreen(vehicleId: vehicleId, embedded: true);
    case 'Reminders':
      return (vehicleId) =>
          RemindersScreen(vehicleId: vehicleId, embedded: true);
    case 'Planner':
      return (vehicleId) =>
          KanbanBoardScreen(vehicleId: vehicleId, embedded: true);
    case 'Supplies':
      return (vehicleId) =>
          SuppliesScreen(vehicleId: vehicleId, embedded: true);
    case 'Notes':
      return (vehicleId) =>
          NotesScreen(vehicleId: vehicleId, embedded: true);
    case 'Reports':
      return (vehicleId) =>
          ReportsScreen(vehicleId: vehicleId, embedded: true);
    default:
      return (_) => const SizedBox.shrink();
  }
}

class VehicleDetailScreen extends ConsumerWidget {
  const VehicleDetailScreen({super.key, required this.vehicleId});
  final int vehicleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncVehicle = ref.watch(vehicleByIdProvider(vehicleId));
    final visibleTabs =
        ref.watch(tabLayoutRepositoryProvider).visibleTabs;

    final tabs = visibleTabs
        .map((c) => (c.id, _tabBuilder(c.id)))
        .toList();

    return asyncVehicle.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (vehicle) {
        if (vehicle == null) {
          return const Scaffold(
              body: Center(child: Text('Vehicle not found')));
        }
        return DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Flexible(
                    child: Text(
                      '${vehicle.year} ${vehicle.model}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  if (vehicle.licensePlate.isNotEmpty) ...[
                    const SizedBox(width: 10),
                    LicensePlateBadge(plate: vehicle.licensePlate),
                  ],
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () =>
                      context.go(RouteNames.vehicleEditPath(vehicleId)),
                ),
              ],
              bottom: TabBar(
                isScrollable: true,
                tabs: tabs.map((t) => Tab(text: t.$1)).toList(),
              ),
            ),
            body: TabBarView(
              children:
                  tabs.map((t) => t.$2(vehicleId)).toList(),
            ),
          ),
        );
      },
    );
  }
}
