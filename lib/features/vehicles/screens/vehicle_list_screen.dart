import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../core/routing/route_names.dart';
import '../../../core/sync/sync_status.dart';
import '../../odometer/providers/odometer_records_provider.dart';
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
                  Icon(Icons.directions_car_outlined,
                      size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No vehicles yet.\nTap + to add one.',
                      textAlign: TextAlign.center),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(vehicleListProvider),
            child: ListView.builder(
              itemCount: vehicles.length,
              itemBuilder: (context, i) =>
                  _VehicleCard(vehicle: vehicles[i]),
            ),
          );
        },
      ),
    );
  }
}

class _VehicleCard extends ConsumerWidget {
  const _VehicleCard({required this.vehicle});
  final Vehicle vehicle;

  static final _odomFmt = NumberFormat('#,###');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePath = vehicle.imagePath;
    final latestMileage =
        ref.watch(latestOdometerProvider(vehicle.id)).valueOrNull;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go(RouteNames.vehicleDetailPath(vehicle.id)),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // ── Layer 1: image / placeholder ─────────────────────
              imagePath != null && imagePath.isNotEmpty
                  ? Image.file(
                      File(imagePath),
                      fit: BoxFit.cover,
                      errorBuilder: (ctx, e, s) => const _Placeholder(),
                    )
                  : const _Placeholder(),

              // ── Layer 2: dark gradient fade ───────────────────────
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black54],
                    stops: [0.25, 1.0],
                  ),
                ),
              ),

              // ── Layer 3: text overlay ─────────────────────────────
              Positioned(
                left: 16,
                right: 16,
                bottom: 14,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Year / Make / Model / Odometer
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            vehicle.year,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              shadows: [Shadow(blurRadius: 10, color: Colors.black87)],
                            ),
                          ),
                          Text(
                            vehicle.make,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              shadows: [Shadow(blurRadius: 10, color: Colors.black87)],

                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                vehicle.model,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  shadows: [Shadow(blurRadius: 10, color: Colors.black87)],

                                ),
                              ),
                              if (vehicle.syncStatus != SyncStatus.synced) ...[
                                const SizedBox(width: 6),
                                const Icon(Icons.sync,
                                    size: 14, color: Colors.orange),
                              ],
                            ],
                          ),
                          if (latestMileage != null)
                            Text(
                              '${_odomFmt.format(latestMileage)} mi',
                              style: const TextStyle(
                                color: Colors.white60,
                                fontSize: 13,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                        ],
                      ),
                    ),
                    // License plate badge
                    if (vehicle.licensePlate.isNotEmpty)
                      _LicensePlateBadge(plate: vehicle.licensePlate),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder();

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
        color: Colors.black38,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white24),
      ),
      child: Text(
        plate,
        style: GoogleFonts.notoSans(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 13,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
