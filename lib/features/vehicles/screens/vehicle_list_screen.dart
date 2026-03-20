import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../domain/vehicle.dart';
import '../providers/vehicles_provider.dart';

class VehicleListScreen extends ConsumerWidget {
  const VehicleListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncVehicles = ref.watch(vehicleListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicles'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.go('/vehicles/add'),
          ),
        ],
      ),
      body: asyncVehicles.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (vehicles) {
          if (vehicles.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.directions_car_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No vehicles yet.\nTap + to add one.', textAlign: TextAlign.center),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(vehicleListProvider),
            child: ListView.builder(
              itemCount: vehicles.length,
              itemBuilder: (context, i) => _VehicleCard(vehicle: vehicles[i]),
            ),
          );
        },
      ),
    );
  }
}

class _VehicleCard extends StatelessWidget {
  const _VehicleCard({required this.vehicle});
  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.directions_car)),
        title: Text('${vehicle.year} ${vehicle.make} ${vehicle.model}'),
        subtitle: vehicle.licensePlate.isNotEmpty
            ? Text(vehicle.licensePlate)
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (vehicle.syncStatus != 'synced')
              const Icon(Icons.sync, size: 16, color: Colors.orange),
            const Icon(Icons.chevron_right),
          ],
        ),
        onTap: () => context.go('/vehicles/${vehicle.id}'),
      ),
    );
  }
}
