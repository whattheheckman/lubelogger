import 'dart:math' show max;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:lubelogger/features/gas_records/providers/gas_records_provider.dart';
import 'package:lubelogger/features/odometer/providers/odometer_records_provider.dart';
import 'package:lubelogger/features/repair_records/providers/repair_records_provider.dart';
import 'package:lubelogger/features/service_records/providers/service_records_provider.dart';
import 'package:lubelogger/features/tax_records/providers/tax_records_provider.dart';
import 'package:lubelogger/features/upgrade_records/providers/upgrade_records_provider.dart';

// ─────────────────────────────────────────────────────────────
// Cost Report
// ─────────────────────────────────────────────────────────────

class VehicleCostReport extends ConsumerWidget {
  const VehicleCostReport({
    super.key,
    required this.vehicleId,
    this.shrinkWrapped = false,
    this.onTapCategory,
  });
  final int vehicleId;

  /// When true, the inner ListView uses shrinkWrap so it can be embedded
  /// inside another scrollable (e.g. the overview screen).
  final bool shrinkWrapped;

  /// Optional tap handlers keyed by category label ('Service', 'Repair', etc.).
  final Map<String, VoidCallback>? onTapCategory;

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
      return const Padding(
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
      physics: shrinkWrapped ? const NeverScrollableScrollPhysics() : null,
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
              leading: CircleAvatar(backgroundColor: c.color, radius: 8),
              title: Text(c.label),
              trailing: Text('\$${c.amount.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              onTap: onTapCategory?[c.label],
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
          return const Padding(
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
        }

        final sorted = [...withMpg]..sort((a, b) => a.date.compareTo(b.date));

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
          physics: shrinkWrapped ? const NeverScrollableScrollPhysics() : null,
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
                _ChartLegend(color: Colors.blue, label: 'MPG per fill-up'),
                SizedBox(width: 16),
                _ChartLegend(color: Colors.orange, label: 'Average'),
              ],
            ),
          ],
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Spending vs Distance chart (last 12 months)
// ─────────────────────────────────────────────────────────────

class SpendingDistanceChart extends ConsumerWidget {
  const SpendingDistanceChart({super.key, required this.vehicleId});
  final int vehicleId;

  static final _monthFmt = DateFormat.MMM();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    final odom =
        ref.watch(odometerRecordListProvider(vehicleId)).valueOrNull ?? [];

    final now = DateTime.now();
    final months = List.generate(12, (i) {
      final shifted = DateTime(now.year, now.month - 11 + i);
      return DateTime(shifted.year, shifted.month);
    });

    // Monthly spending
    final spendingData = months.map((m) {
      bool inMonth(DateTime d) => d.year == m.year && d.month == m.month;
      return [
        ...service.where((r) => inMonth(r.date)).map((r) => r.cost),
        ...repair.where((r) => inMonth(r.date)).map((r) => r.cost),
        ...upgrade.where((r) => inMonth(r.date)).map((r) => r.cost),
        ...tax.where((r) => inMonth(r.date)).map((r) => r.cost),
        ...gas.where((r) => inMonth(r.date)).map((r) => r.cost),
      ].fold(0.0, (a, b) => a + b);
    }).toList();

    // Monthly distance — delta between consecutive max odometer readings
    final sortedOdom = [...odom]..sort((a, b) => a.date.compareTo(b.date));

    final maxOdomPerMonth = <String, double>{};
    for (final r in sortedOdom) {
      final key = '${r.date.year}-${r.date.month}';
      maxOdomPerMonth[key] = max(maxOdomPerMonth[key] ?? 0, r.mileage);
    }

    // Seed prevMax with the last reading before our window
    double? prevMax;
    for (final r in sortedOdom) {
      if (r.date.isBefore(months.first)) prevMax = r.mileage;
    }

    final distanceData = <double>[];
    for (final m in months) {
      final key = '${m.year}-${m.month}';
      final thisMax = maxOdomPerMonth[key];
      final dist = (thisMax != null && prevMax != null)
          ? (thisMax - prevMax).clamp(0.0, double.infinity)
          : 0.0;
      distanceData.add(dist);
      if (thisMax != null) prevMax = thisMax;
    }

    final maxSpend = spendingData.fold(0.0, max);
    final maxDist = distanceData.fold(0.0, max);

    if (maxSpend == 0 && maxDist == 0) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text('No spending or distance data yet.',
              style: TextStyle(color: Colors.grey)),
        ),
      );
    }

    double norm(double v, double maxV) => maxV == 0 ? 0 : v / maxV * 100;

    // Spending — one bar per month
    final groups = List.generate(
      months.length,
      (i) => BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: norm(spendingData[i], maxSpend),
            color: Colors.blue,
            width: 14,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(3)),
          ),
        ],
      ),
    );

    // Distance — line chart spots at the same x positions as the bars
    final lineSpots = List.generate(
      months.length,
      (i) => FlSpot(i.toDouble(), norm(distanceData[i], maxDist)),
    );

    // Shared axis constants so both charts use identical plot-area insets
    const double leftReserved = 44;
    const double rightReserved = 44;
    const double bottomReserved = 20;

    var chartWidth = MediaQuery.of(context).size.width - 32;
    var chartHeight = 200.0;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                // ── Spending bars ────────────────────────────
                BarChart(
                  BarChartData(
                    maxY: 105,
                    barGroups: groups,
                    gridData: const FlGridData(show: true),
                    borderData: FlBorderData(show: true),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: bottomReserved,
                          getTitlesWidget: (v, _) {
                            final i = v.toInt();
                            if (i < 0 || i >= months.length) {
                              return const SizedBox.shrink();
                            }
                            return Text(
                              _monthFmt.format(months[i]),
                              style: const TextStyle(fontSize: 9),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: maxSpend > 0,
                          reservedSize: leftReserved,
                          interval: 25,
                          getTitlesWidget: (v, _) {
                            final actual = v / 100 * maxSpend;
                            return Text(
                              '\$${actual.toStringAsFixed(0)}',
                              style: const TextStyle(
                                  fontSize: 9, color: Colors.blue),
                            );
                          },
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                          reservedSize: rightReserved,
                        ),
                      ),
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                    ),
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipItem: (group, _, rod, _) {
                          final label = _monthFmt.format(months[group.x]);
                          return BarTooltipItem(
                            '$label\n\$${spendingData[group.x].toStringAsFixed(0)}',
                            const TextStyle(
                                color: Colors.white, fontSize: 11),
                          );
                        },
                      ),
                    ),
                    // barChartAlignment: BarChartAlignment.spaceAround,
                  ),
                ),

                // ── Distance line (overlaid) ─────────────────
                LineChart(
                  LineChartData(
                    minY: -10,
                    maxY: 105,
                    minX: -2,
                    backgroundColor: Colors.transparent,
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                          reservedSize: bottomReserved,
                        ),
                      ),
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                          reservedSize: leftReserved,
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: maxDist > 0,
                          reservedSize: rightReserved,
                          interval: 25,
                          getTitlesWidget: (v, _) {
                            final actual = v / 100 * maxDist;
                            return Text(
                              '${actual.toStringAsFixed(0)}mi',
                              style: const TextStyle(
                                  fontSize: 9, color: Colors.green),
                            );
                          },
                        ),
                      ),
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: lineSpots,
                        isCurved: true,
                        color: Colors.green,
                        barWidth: 2,
                        dotData: const FlDotData(show: true),
                        preventCurveOverShooting: true,
                      ),
                    ],
                    lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                        getTooltipItems: (spots) => spots
                            .map((s) => LineTooltipItem(
                                  '${_monthFmt.format(months[s.x.toInt()])}\n'
                                  '${distanceData[s.x.toInt()].toStringAsFixed(0)} mi',
                                  const TextStyle(
                                      color: Colors.white, fontSize: 11),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ChartLegend(color: Colors.blue, label: 'Spending'),
              SizedBox(width: 16),
              _ChartLegend(color: Colors.green, label: 'Distance'),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Shared helpers
// ─────────────────────────────────────────────────────────────

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

class _ChartLegend extends StatelessWidget {
  const _ChartLegend({required this.color, required this.label});
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
