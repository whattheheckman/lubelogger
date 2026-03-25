import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/route_names.dart';
import '../providers/vehicles_provider.dart';
import '../../gas_records/screens/gas_record_list_screen.dart';
import '../../notes/screens/notes_screen.dart';
import 'vehicle_overview_screen.dart';
import '../../odometer/screens/odometer_record_list_screen.dart';
import '../../planner/screens/kanban_board_screen.dart';
import '../../reminders/screens/reminders_screen.dart';
import '../../repair_records/screens/repair_record_list_screen.dart';
import '../../reports/screens/reports_screen.dart';
import '../../service_records/screens/service_record_list_screen.dart';
import '../../supplies/screens/supplies_screen.dart';
import '../../tax_records/screens/tax_record_list_screen.dart';
import '../../upgrade_records/screens/upgrade_record_list_screen.dart';

class VehicleDetailScreen extends ConsumerWidget {
  const VehicleDetailScreen({super.key, required this.vehicleId});
  final int vehicleId;

  static final _tabs = <(String, Widget Function(int))>[
    ('Overview', (id) => VehicleOverviewScreen(vehicleId: id, embedded: true)),
    ('Service', (id) => ServiceRecordListScreen(vehicleId: id, embedded: true)),
    ('Repairs', (id) => RepairRecordListScreen(vehicleId: id, embedded: true)),
    ('Upgrades', (id) => UpgradeRecordListScreen(vehicleId: id, embedded: true)),
    ('Fuel', (id) => GasRecordListScreen(vehicleId: id, embedded: true)),
    ('Odometer', (id) => OdometerRecordListScreen(vehicleId: id, embedded: true)),
    ('Taxes', (id) => TaxRecordListScreen(vehicleId: id, embedded: true)),
    ('Reminders', (id) => RemindersScreen(vehicleId: id, embedded: true)),
    ('Planner', (id) => KanbanBoardScreen(vehicleId: id, embedded: true)),
    ('Supplies', (id) => SuppliesScreen(vehicleId: id, embedded: true)),
    ('Notes', (id) => NotesScreen(vehicleId: id, embedded: true)),
    ('Reports', (id) => ReportsScreen(vehicleId: id, embedded: true)),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncVehicle = ref.watch(vehicleByIdProvider(vehicleId));
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
          length: _tabs.length,
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(vehicle.model),
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
                tabs: _tabs.map((t) => Tab(text: t.$1)).toList(),
              ),
            ),
            body: TabBarView(
              children: _tabs.map((t) => t.$2(vehicleId)).toList(),
            ),
          ),
        );
      },
    );
  }
}
