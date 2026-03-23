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
  const ReportsScreen(
      {super.key, required this.vehicleId, this.embedded = false});
  final int vehicleId;
  final bool embedded;

  static const _tabs = [Tab(text: 'Cost'), Tab(text: 'Fuel Economy')];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabBarView = TabBarView(
      children: [
        VehicleCostReport(vehicleId: vehicleId),
        VehicleFuelEconomyReport(vehicleId: vehicleId),
      ],
    );

    if (embedded) {
      return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(tabs: _tabs),
            Expanded(child: tabBarView),
          ],
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reports'),
          bottom: const TabBar(tabs: _tabs),
        ),
        body: tabBarView,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Cost Report
// ─────────────────────────────────────────────────────────────

class VehicleCostReport extends ConsumerWidget {
  const VehicleCostReport(
      {super.key, required this.vehicleId, this.shrinkWrapped = false});
  final int vehicleId;

  /// When true, the inner ListView uses shrinkWrap so it can be embedded
  /// inside another scrollable (e.g. the overview screen).
  final bool shrinkWrapped;

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
      final indicator = const Center(child: CircularProgressIndicator());
      return shrinkWrapped
          ? SizedBox(height: 120, child: indicator)
          : indicator;
    }

    final service = asyncService.valueOrNull ?? [];
    final repair = asyncRepair.valueOrNull ?? [];
    final upgrade = asyncUpgrade.valueOrNull ?? [];
    final tax = asyncTax.valueOrNull ?? [];
    final gas = asyncGas.valueOrNull ?? [];

    final totalService = service.fold(0.0, (s, r) => s + r.cost);
    final totalRepair = repair.fold(0.0, (s, r) => s + r.cost);
    final totalUpgrade = upgrade.fold(0.0, (s, r) => s + r.cost);
    final totalTax = tax.fold(0.0, (s, r) => s + r.cost);
    final totalGas = gas.fold(0.0, (s, r) => s + r.cost);
    final grandTotal =
        totalService + totalRepair + totalUpgrade + totalTax + totalGas;

    if (grandTotal == 0) {
      const empty = Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.bar_chart, size: 48, color: Colors.grey),
              SizedBox(height: 12),
              Text('Add records with costs to see the report.',
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      );
      return empty;
    }

    final data = [
      _CostCategory('Service', totalService, Colors.blue),
      _CostCategory('Repair', totalRepair, Colors.red),
      _CostCategory('Upgrade', totalUpgrade, Colors.purple),
      _CostCategory('Tax', totalTax, Colors.orange),
      _CostCategory('Fuel', totalGas, Colors.green),
    ].where((c) => c.amount > 0).toList();

    return ListView(
      shrinkWrap: shrinkWrapped,
      physics:
          shrinkWrapped ? const NeverScrollableScrollPhysics() : null,
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

class VehicleFuelEconomyReport extends ConsumerWidget {
  const VehicleFuelEconomyReport(
      {super.key, required this.vehicleId, this.shrinkWrapped = false});
  final int vehicleId;
  final bool shrinkWrapped;

  static final _dateFmt = DateFormat.MMMd();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncGas = ref.watch(gasRecordListProvider(vehicleId));

    Widget bounded(Widget w) =>
        shrinkWrapped ? SizedBox(height: 120, child: w) : w;

    return asyncGas.when(
      loading: () => bounded(const Center(child: CircularProgressIndicator())),
      error: (e, _) => bounded(Center(child: Text('Error: $e'))),
      data: (records) {
        final withMpg =
            records.where((r) => r.mpg != null && r.isFillToFull).toList();

        if (withMpg.isEmpty) {
          const empty = Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.local_gas_station, size: 48, color: Colors.grey),
                  SizedBox(height: 12),
                  Text(
                      'Need at least 2 fill-to-full fuel records\nto calculate MPG.',
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          );
          return empty;
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
        final maxMpg =
            withMpg.map((r) => r.mpg!).reduce((a, b) => a > b ? a : b);
        final minMpg =
            withMpg.map((r) => r.mpg!).reduce((a, b) => a < b ? a : b);

        return ListView(
          shrinkWrap: shrinkWrapped,
          physics:
              shrinkWrapped ? const NeverScrollableScrollPhysics() : null,
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
                            _dateFmt.format(sorted[idx].date),
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
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 2,
                      dotData: const FlDotData(show: false),
                    ),
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
        Container(width: 12, height: 12, color: color),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
