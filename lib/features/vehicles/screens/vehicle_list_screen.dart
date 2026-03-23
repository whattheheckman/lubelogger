import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routing/route_names.dart';
import '../../../core/sync/sync_status.dart';
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
            onPressed: () => context.go(RouteNames.vehicleAdd),
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
    final imagePath = vehicle.imagePath;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go(RouteNames.vehicleDetailPath(vehicle.id)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Image / placeholder ──────────────────────────────
            SizedBox(
              height: 180,
              child: imagePath != null && imagePath.isNotEmpty
                  ? Image.file(
                      File(imagePath),
                      fit: BoxFit.cover,
                      errorBuilder: (context, e, s) => _Placeholder(),
                    )
                  : _Placeholder(),
            ),
            // ── Vehicle info ─────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vehicle.year,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          vehicle.make,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          vehicle.model,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (vehicle.licensePlate.isNotEmpty)
                        _LicensePlateBadge(plate: vehicle.licensePlate),
                      if (vehicle.syncStatus != SyncStatus.synced)
                        const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Icon(Icons.sync,
                              size: 14, color: Colors.orange),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Center(
        child: Icon(Icons.directions_car, size: 72, color: Colors.grey),
      ),
    );
  }
}

class _LicensePlateBadge extends StatelessWidget {
  const _LicensePlateBadge({required this.plate});
  final String plate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(51),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.withAlpha(77)),
      ),
      child: Text(
        plate,
        style: GoogleFonts.notoSans(
          fontWeight: FontWeight.w100,
          fontSize: 13,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
