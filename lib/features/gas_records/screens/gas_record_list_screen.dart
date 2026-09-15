import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:lubelogger/core/routing/route_names.dart';
import 'package:lubelogger/core/widgets/delete_confirm_dialog.dart';
import 'package:lubelogger/core/widgets/record_stats_banner.dart';
import 'package:lubelogger/features/gas_records/providers/gas_records_provider.dart';
import 'package:lubelogger/features/gas_records/domain/gas_record.dart';

class GasRecordListScreen extends ConsumerWidget {
  const GasRecordListScreen(
      {super.key, required this.vehicleId, this.embedded = false});
  final int vehicleId;
  final bool embedded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRecords = ref.watch(gasRecordListProvider(vehicleId));

    return Scaffold(
      appBar: embedded ? null : AppBar(title: const Text('Fuel Records')),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            heroTag: 'fuel_quick_add',
            onPressed: () =>
                context.push(RouteNames.vehicleFuelQuickAddPath(vehicleId)),
            tooltip: 'Quick Add',
            child: const Icon(Icons.bolt),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'fuel_add',
            onPressed: () =>
                context.push(RouteNames.vehicleFuelAddPath(vehicleId)),
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: asyncRecords.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (records) {
          final totalCost = records.fold(0.0, (s, r) => s + r.cost);
          return Column(
            children: [
              RecordStatsBanner(count: records.length, totalCost: totalCost),
              const Divider(height: 1),
              Expanded(
                child: records.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.local_gas_station,
                                size: 64, color: Colors.grey),
                            SizedBox(height: 16),
                            Text('No fuel records yet.\nTap + to add one.',
                                textAlign: TextAlign.center),
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () async =>
                            ref.invalidate(gasRecordListProvider(vehicleId)),
                        child: ListView.builder(
                          itemCount: records.length,
                          itemBuilder: (context, i) =>
                              _GasCard(record: records[i], vehicleId: vehicleId),
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _GasCard extends ConsumerWidget {
  const _GasCard({required this.record, required this.vehicleId});
  final GasRecord record;
  final int vehicleId;

  static final _dateFmt = DateFormat.yMMMd();
  static final _timeFmt = DateFormat.jm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mpgText = record.mpg != null
        ? '${record.mpg!.toStringAsFixed(1)} MPG'
        : record.isFillToFull ? '' : 'Partial fill';

    return Dismissible(
      key: Key('gas_${record.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (_) => showDeleteConfirmDialog(context),
      onDismissed: (_) =>
          ref.read(gasRecordsNotifierProvider.notifier).delete(record.id),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.local_gas_station)),
          title: Text(
              '${record.gallons.toStringAsFixed(3)} gal  •  ${record.mileage.toStringAsFixed(0)} mi'),
          subtitle: Text(
              '${_dateFmt.format(record.date)}  •  ${_timeFmt.format(record.date)}${record.missedFuelUp ? '  •  ⚠ Missed fill-up' : ''}'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$${record.cost.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(mpgText,
                  style: TextStyle(
                      fontSize: 11,
                      color: record.mpg != null
                          ? Colors.green.shade700
                          : Colors.grey)),
            ],
          ),
          onTap: () =>
              context.push(RouteNames.vehicleFuelEditPath(vehicleId, record.id)),
        ),
      ),
    );
  }
}
