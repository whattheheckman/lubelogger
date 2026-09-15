import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:lubelogger/core/routing/route_names.dart';
import 'package:lubelogger/core/settings/tab_layout_repository.dart';
import 'package:lubelogger/features/gas_records/providers/gas_records_provider.dart';
import 'package:lubelogger/features/odometer/providers/odometer_records_provider.dart';
import 'package:lubelogger/features/repair_records/providers/repair_records_provider.dart';
import 'package:lubelogger/features/reports/screens/vehicle_charts.dart';
import 'package:lubelogger/features/service_records/providers/service_records_provider.dart';
import 'package:lubelogger/features/tax_records/providers/tax_records_provider.dart';
import 'package:lubelogger/features/upgrade_records/providers/upgrade_records_provider.dart';
import 'package:lubelogger/features/vehicles/providers/vehicles_provider.dart';

class VehicleOverviewScreen extends ConsumerWidget {
  const VehicleOverviewScreen(
      {super.key, required this.vehicleId, this.embedded = false});
  final int vehicleId;
  final bool embedded;

  static final _numFmt = NumberFormat('######');
  static final _costFmt =
      NumberFormat.currency(symbol: '\$', decimalDigits: 2);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ── Odometer metrics ──────────────────────────────────────
    final odomRecords =
        ref.watch(odometerRecordListProvider(vehicleId)).value ?? [];
    final mileages = odomRecords.map((r) => r.mileage).toList();
    final lastOdom =
        mileages.isEmpty ? null : mileages.reduce((a, b) => a > b ? a : b);
    final firstOdom =
        mileages.isEmpty ? null : mileages.reduce((a, b) => a < b ? a : b);
    final distance = (lastOdom != null && firstOdom != null && lastOdom > firstOdom)
        ? lastOdom - firstOdom
        : null;

    // ── Cost metrics ──────────────────────────────────────────
    final service =
        ref.watch(serviceRecordListProvider(vehicleId)).value ?? [];
    final repair =
        ref.watch(repairRecordListProvider(vehicleId)).value ?? [];
    final upgrade =
        ref.watch(upgradeRecordListProvider(vehicleId)).value ?? [];
    final tax =
        ref.watch(taxRecordListProvider(vehicleId)).value ?? [];
    final gas =
        ref.watch(gasRecordListProvider(vehicleId)).value ?? [];

    final totalCost = [
      ...service.map((r) => r.cost),
      ...repair.map((r) => r.cost),
      ...upgrade.map((r) => r.cost),
      ...tax.map((r) => r.cost),
      ...gas.map((r) => r.cost),
    ].fold(0.0, (a, b) => a + b);

    // ── MPG metric ────────────────────────────────────────────
    final mpgRecords =
        gas.where((r) => r.isFillToFull && r.mpg != null).toList();
    final avgMpg = mpgRecords.isEmpty
        ? null
        : mpgRecords.fold(0.0, (s, r) => s + r.mpg!) / mpgRecords.length;

    // ── Formatted values ──────────────────────────────────────
    final odomStr =
        lastOdom != null ? '${_numFmt.format(lastOdom)} mi' : '—';
    final distStr =
        distance != null ? '${_numFmt.format(distance)} mi' : '—';
    final costStr = _costFmt.format(totalCost);
    final mpgStr = avgMpg != null ? '${avgMpg.toStringAsFixed(1)} mpg' : '—';

    final vehicle = ref.watch(vehicleByIdProvider(vehicleId)).value;

    final visibleTabs = ref.read(tabLayoutRepositoryProvider).visibleTabs;

    void goToTab(String tabId, String route) {
      if (embedded) {
        final index = visibleTabs.indexWhere((c) => c.id == tabId);
        if (index >= 0) DefaultTabController.of(context).animateTo(index);
      } else {
        context.push(route);
      }
    }

    final body = ListView(
      padding: EdgeInsets.zero,
      children: [
        // ── Vehicle header ────────────────────────────────────
        _VehicleHeader(
          imagePath: vehicle?.imagePath,
          year: vehicle?.year ?? '',
          make: vehicle?.make ?? '',
          model: vehicle?.model ?? '',
          licensePlate: vehicle?.licensePlate ?? '',
        ),

        // ── Summary metrics ───────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Summary',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _MetricCard(
                      icon: Icons.speed,
                      label: 'Odometer',
                      value: odomStr,
                      onTap: () => goToTab('Odometer', RouteNames.vehicleOdometerListPath(vehicleId)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _MetricCard(
                      icon: Icons.route,
                      label: 'Distance Travelled',
                      value: distStr,
                      onTap: () => goToTab('Odometer', RouteNames.vehicleOdometerListPath(vehicleId)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _MetricCard(
                      icon: Icons.attach_money,
                      label: 'Total Cost',
                      value: costStr,
                      onTap: () => goToTab('Reports', RouteNames.vehicleReportsPath(vehicleId)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _MetricCard(
                      icon: Icons.local_gas_station,
                      label: 'Avg Fuel Economy',
                      value: mpgStr,
                      onTap: () => goToTab('Fuel', RouteNames.vehicleFuelListPath(vehicleId)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // ── Spending vs Distance ──────────────────────────────
        const _SectionHeader('Spending vs Distance (12 Months)'),
        SpendingDistanceChart(vehicleId: vehicleId),

        // ── Cost breakdown ────────────────────────────────────
        const _SectionHeader('Cost Breakdown'),
        VehicleCostReport(
          vehicleId: vehicleId,
          shrinkWrapped: true,
          onTapCategory: {
            'Service': () => goToTab('Service', RouteNames.vehicleServiceListPath(vehicleId)),
            'Repair': () => goToTab('Repairs', RouteNames.vehicleRepairListPath(vehicleId)),
            'Upgrade': () => goToTab('Upgrades', RouteNames.vehicleUpgradeListPath(vehicleId)),
            'Tax': () => goToTab('Taxes', RouteNames.vehicleTaxListPath(vehicleId)),
            'Fuel': () => goToTab('Fuel', RouteNames.vehicleFuelListPath(vehicleId)),
          },
        ),

        // ── Fuel economy ──────────────────────────────────────
        const _SectionHeader('Fuel Economy'),
        VehicleFuelEconomyReport(vehicleId: vehicleId, shrinkWrapped: true),

        const SizedBox(height: 24),
      ],
    );

    if (embedded) return body;

    return Scaffold(
      appBar: AppBar(title: const Text('Overview')),
      body: body,
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Vehicle header
// ─────────────────────────────────────────────────────────────

class _VehicleHeader extends StatelessWidget {
  const _VehicleHeader({
    required this.imagePath,
    required this.year,
    required this.make,
    required this.model,
    required this.licensePlate,
  });
  final String? imagePath;
  final String year;
  final String make;
  final String model;
  final String licensePlate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shadow = [
      const Shadow(blurRadius: 10, color: Colors.black87),
    ];

    Widget image;
    if (imagePath != null) {
      image = Image.file(
        File(imagePath!),
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (context, e, s) => const _Placeholder(),
      );
    } else {
      image = const _Placeholder();
    }

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        children: [
          image,
          // gradient
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black54],
                stops: [0.35, 1.0],
              ),
            ),
          ),
          // text overlay
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (year.isNotEmpty)
                        Text(
                          year,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            shadows: shadow,
                          ),
                        ),
                      Text(
                        make,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          shadows: shadow,
                        ),
                      ),
                      Text(
                        model,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          shadows: shadow,
                        ),
                      ),
                    ],
                  ),
                ),
                if (licensePlate.isNotEmpty)
                  LicensePlateBadge(plate: licensePlate),
              ],
            ),
          ),
        ],
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
      child: Center(
        child: Icon(
          Icons.directions_car,
          size: 64,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// License plate badge
// ─────────────────────────────────────────────────────────────

class LicensePlateBadge extends StatelessWidget {
  const LicensePlateBadge({super.key, required this.plate});
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

// ─────────────────────────────────────────────────────────────
// Metric card
// ─────────────────────────────────────────────────────────────

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 18, color: theme.colorScheme.primary),
              const SizedBox(height: 8),
              Text(
                value,
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Section header
// ─────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const Divider(height: 16),
        ],
      ),
    );
  }
}
