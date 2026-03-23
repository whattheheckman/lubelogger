import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/route_names.dart';
import '../providers/vehicles_provider.dart';

class VehicleDetailScreen extends ConsumerWidget {
  const VehicleDetailScreen({super.key, required this.vehicleId});
  final int vehicleId;

  // Tabs: display label + resolver function tied to RouteNames.
  // Not const because function references aren't const literals.
  static final _tabs = <(String, String Function(int))>[
    ('Service', RouteNames.vehicleServiceListPath),
    ('Repairs', RouteNames.vehicleRepairListPath),
    ('Upgrades', RouteNames.vehicleUpgradeListPath),
    ('Fuel', RouteNames.vehicleFuelListPath),
    ('Odometer', RouteNames.vehicleOdometerListPath),
    ('Taxes', RouteNames.vehicleTaxListPath),
    ('Reminders', RouteNames.vehicleReminderListPath),
    ('Planner', RouteNames.vehiclePlannerPath),
    ('Supplies', RouteNames.vehicleSupplyListPath),
    ('Notes', RouteNames.vehicleNoteListPath),
    ('Reports', RouteNames.vehicleReportsPath),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncVehicle = ref.watch(vehicleByIdProvider(vehicleId));

    return asyncVehicle.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (vehicle) {
        if (vehicle == null) {
          return const Scaffold(body: Center(child: Text('Vehicle not found')));
        }
        return DefaultTabController(
          length: _tabs.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text('${vehicle.year} ${vehicle.make} ${vehicle.model}'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => context.go(RouteNames.vehicleEditPath(vehicleId)),
                ),
              ],
              bottom: TabBar(
                isScrollable: true,
                tabs: _tabs.map((t) => Tab(text: t.$1)).toList(),
              ),
            ),
            body: TabBarView(
              children: _tabs
                  .map((t) => _TabPlaceholder(
                        vehicleId: vehicleId,
                        label: t.$1,
                        route: t.$2,
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class _TabPlaceholder extends StatelessWidget {
  const _TabPlaceholder({
    required this.vehicleId,
    required this.label,
    required this.route,
  });
  final int vehicleId;
  final String label;
  final String Function(int) route;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => context.go(route(vehicleId)),
        child: Text('Open $label'),
      ),
    );
  }
}
