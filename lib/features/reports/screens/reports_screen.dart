import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'vehicle_charts.dart';

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
