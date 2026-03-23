import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../gas_records/providers/gas_records_provider.dart';
import '../../odometer/providers/odometer_records_provider.dart';
import '../../repair_records/providers/repair_records_provider.dart';
import '../../reports/screens/reports_screen.dart';
import '../../service_records/providers/service_records_provider.dart';
import '../../tax_records/providers/tax_records_provider.dart';
import '../../upgrade_records/providers/upgrade_records_provider.dart';
import '../providers/vehicles_provider.dart';

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
        ref.watch(odometerRecordListProvider(vehicleId)).valueOrNull ?? [];
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
        ref.watch(serviceRecordListProvider(vehicleId)).valueOrNull ?? [];
    final repair =
        ref.watch(repairRecordListProvider(vehicleId)).valueOrNull ?? [];
    final upgrade =
        ref.watch(upgradeRecordListProvider(vehicleId)).valueOrNull ?? [];
    final tax =
        ref.watch(taxRecordListProvider(vehicleId)).valueOrNull ?? [];
    final gas =
        ref.watch(gasRecordListProvider(vehicleId)).valueOrNull ?? [];

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

    final vehicle = ref.watch(vehicleByIdProvider(vehicleId)).valueOrNull;

    final body = ListView(
      padding: EdgeInsets.zero,
      children: [
        // ── Vehicle header ────────────────────────────────────
        _VehicleHeader(
          imagePath: vehicle?.imagePath,
          year: vehicle?.year ?? '',
          make: vehicle?.make ?? '',
          model: vehicle?.model ?? '',
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
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _MetricCard(
                      icon: Icons.route,
                      label: 'Distance Travelled',
                      value: distStr,
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
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _MetricCard(
                      icon: Icons.local_gas_station,
                      label: 'Avg Fuel Economy',
                      value: mpgStr,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // ── Cost breakdown ────────────────────────────────────
        const _SectionHeader('Cost Breakdown'),
        VehicleCostReport(vehicleId: vehicleId, shrinkWrapped: true),

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
  });
  final String? imagePath;
  final String year;
  final String make;
  final String model;

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
// Metric card
// ─────────────────────────────────────────────────────────────

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.icon,
    required this.label,
    required this.value,
  });
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
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
