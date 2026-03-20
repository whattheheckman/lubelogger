import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../gas_records/providers/gas_records_provider.dart';
import '../../repair_records/providers/repair_records_provider.dart';
import '../../service_records/providers/service_records_provider.dart';
import '../../tax_records/providers/tax_records_provider.dart';
import '../../upgrade_records/providers/upgrade_records_provider.dart';


class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key, required this.vehicleId});
  final int vehicleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reports'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Cost'),
              Tab(text: 'Fuel Economy'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _CostReport(vehicleId: vehicleId),
            _FuelEconomyReport(vehicleId: vehicleId),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Cost Report
// ─────────────────────────────────────────────────────────────

class _CostReport extends ConsumerWidget {
  const _CostReport({required this.vehicleId});
  final int vehicleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncService = ref.watch(serviceRecordListProvider(vehicleId));
    final asyncRepair = ref.watch(repairRecordListProvider(vehicleId));
    final asyncUpgrade = ref.watch(upgradeRecordListProvider(vehicleId));
    final asyncTax = ref.watch(taxRecordListProvider(vehicleId));
    final asyncGas = ref.watch(gasRecordListProvider(vehicleId));

    if (asyncService.isLoading ||
        asyncRepair.isLoading ||
        asyncUpgrade.isLoading ||
        asyncTax.isLoading ||
        asyncGas.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final service = asyncService.valueOrNull ?? [];
    final repair = asyncRepair.valueOrNull ?? [];
    final upgrade = asyncUpgrade.valueOrNull ?? [];
    final tax = asyncTax.valueOrNull ?? [];
    final gas = asyncGas.valueOrNull ?? [];

    double totalService =
        service.fold(0.0, (s, r) => s + r.cost);
    double totalRepair = repair.fold(0.0, (s, r) => s + r.cost);
    double totalUpgrade = upgrade.fold(0.0, (s, r) => s + r.cost);
    double totalTax = tax.fold(0.0, (s, r) => s + r.cost);
    double totalGas = gas.fold(0.0, (s, r) => s + r.cost);
    double grandTotal = totalService + totalRepair + totalUpgrade + totalTax + totalGas;

    if (grandTotal == 0) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bar_chart, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('Add records with costs to see the report.'),
          ],
        ),
      );
    }

    final data = [
      _CostCategory('Service', totalService, Colors.blue),
      _CostCategory('Repair', totalRepair, Colors.red),
      _CostCategory('Upgrade', totalUpgrade, Colors.purple),
      _CostCategory('Tax', totalTax, Colors.orange),
      _CostCategory('Fuel', totalGas, Colors.green),
    ].where((c) => c.amount > 0).toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Total Spend: \$${grandTotal.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 24),
        SizedBox(
          height: 220,
          child: PieChart(
            PieChartData(
              sections: data
                  .map((c) => PieChartSectionData(
                        value: c.amount,
                        color: c.color,
                        title:
                            '${(c.amount / grandTotal * 100).toStringAsFixed(0)}%',
                        titleStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ))
                  .toList(),
              sectionsSpace: 2,
              centerSpaceRadius: 40,
            ),
          ),
        ),
        const SizedBox(height: 24),
        ...data.map((c) => ListTile(
              leading: CircleAvatar(
                  backgroundColor: c.color, radius: 8),
              title: Text(c.label),
              trailing: Text('\$${c.amount.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            )),
      ],
    );
  }
}

class _CostCategory {
  _CostCategory(this.label, this.amount, this.color);
  final String label;
  final double amount;
  final Color color;
}

// ─────────────────────────────────────────────────────────────
// Fuel Economy Report
// ─────────────────────────────────────────────────────────────

class _FuelEconomyReport extends ConsumerWidget {
  const _FuelEconomyReport({required this.vehicleId});
  final int vehicleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncGas = ref.watch(gasRecordListProvider(vehicleId));

    return asyncGas.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (records) {
        final withMpg =
            records.where((r) => r.mpg != null && r.isFillToFull).toList();

        if (withMpg.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_gas_station, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                    'Need at least 2 fill-to-full fuel records\nto calculate MPG.',
                    textAlign: TextAlign.center),
              ],
            ),
          );
        }

        final sorted = [...withMpg]
          ..sort((a, b) => a.date.compareTo(b.date));

        final spots = sorted
            .asMap()
            .entries
            .map((e) => FlSpot(e.key.toDouble(), e.value.mpg!))
            .toList();

        final avgMpg =
            withMpg.fold(0.0, (s, r) => s + r.mpg!) / withMpg.length;
        final maxMpg = withMpg.map((r) => r.mpg!).reduce((a, b) => a > b ? a : b);
        final minMpg = withMpg.map((r) => r.mpg!).reduce((a, b) => a < b ? a : b);
        final fmt = DateFormat.MMMd();

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatChip('Avg MPG', avgMpg.toStringAsFixed(1)),
                _StatChip('Best', maxMpg.toStringAsFixed(1)),
                _StatChip('Worst', minMpg.toStringAsFixed(1)),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 220,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: (sorted.length / 4).ceilToDouble(),
                        getTitlesWidget: (value, _) {
                          final idx = value.toInt();
                          if (idx < 0 || idx >= sorted.length) {
                            return const SizedBox.shrink();
                          }
                          return Text(
                            fmt.format(sorted[idx].date),
                            style: const TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (v, _) => Text(
                          v.toStringAsFixed(0),
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    // MPG line
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 2,
                      dotData: const FlDotData(show: false),
                    ),
                    // Average line
                    LineChartBarData(
                      spots: [
                        FlSpot(0, avgMpg),
                        FlSpot(spots.length - 1.0, avgMpg),
                      ],
                      isCurved: false,
                      color: Colors.orange,
                      barWidth: 1,
                      dashArray: [5, 5],
                      dotData: const FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                _LegendDot(color: Colors.blue, label: 'MPG per fill-up'),
                SizedBox(width: 16),
                _LegendDot(color: Colors.orange, label: 'Average'),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 12, height: 12, color: color),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
