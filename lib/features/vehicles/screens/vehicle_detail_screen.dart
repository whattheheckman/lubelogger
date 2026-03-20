import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/vehicles_provider.dart';

class VehicleDetailScreen extends ConsumerWidget {
  const VehicleDetailScreen({super.key, required this.vehicleId});
  final int vehicleId;

  static const _tabs = [
    ('Service', 'service'),
    ('Repairs', 'repairs'),
    ('Upgrades', 'upgrades'),
    ('Fuel', 'fuel'),
    ('Odometer', 'odometer'),
    ('Taxes', 'taxes'),
    ('Reminders', 'reminders'),
    ('Planner', 'planner'),
    ('Supplies', 'supplies'),
    ('Notes', 'notes'),
    ('Reports', 'reports'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncVehicle = ref.watch(vehicleListProvider).whenData(
          (list) => list.where((v) => v.id == vehicleId).firstOrNull,
        );

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
                  onPressed: () => context.go('/vehicles/$vehicleId/edit'),
                ),
              ],
              bottom: TabBar(
                isScrollable: true,
                tabs: _tabs.map((t) => Tab(text: t.$1)).toList(),
              ),
            ),
            body: TabBarView(
              children: _tabs
                  .map((t) => _TabPlaceholder(vehicleId: vehicleId, tab: t.$2))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class _TabPlaceholder extends StatelessWidget {
  const _TabPlaceholder({required this.vehicleId, required this.tab});
  final int vehicleId;
  final String tab;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => context.go('/vehicles/$vehicleId/$tab'),
        child: Text('Open $tab'),
      ),
    );
  }
}
