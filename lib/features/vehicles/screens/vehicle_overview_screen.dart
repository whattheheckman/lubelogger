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

class VehicleOverviewScreen extends ConsumerWidget {
  const VehicleOverviewScreen(
      {super.key, required this.vehicleId, this.embedded = false});
  final int vehicleId;
  final bool embedded;

  static final _numFmt = NumberFormat('#,###');
  static final _costFmt =
      NumberFormat.currency(symbol: '\$', decimalDigits: 0);

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

    final body = ListView(
      padding: EdgeInsets.zero,
      children: [
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
                      label: 'Last Odometer',
                      value: odomStr,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _MetricCard(
                      icon: Icons.route,
                      label: 'Distance Tracked',
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
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const Divider(height: 16),
        ],
      ),
    );
  }
}
