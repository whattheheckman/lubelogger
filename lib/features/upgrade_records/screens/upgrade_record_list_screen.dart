import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:lubelogger/core/routing/route_names.dart';
import 'package:lubelogger/core/widgets/delete_confirm_dialog.dart';
import 'package:lubelogger/core/widgets/record_stats_banner.dart';
import 'package:lubelogger/features/upgrade_records/providers/upgrade_records_provider.dart';
import 'package:lubelogger/features/upgrade_records/domain/upgrade_record.dart';

class UpgradeRecordListScreen extends ConsumerWidget {
  const UpgradeRecordListScreen(
      {super.key, required this.vehicleId, this.embedded = false});
  final int vehicleId;
  final bool embedded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRecords = ref.watch(upgradeRecordListProvider(vehicleId));

    return Scaffold(
      appBar: embedded ? null : AppBar(title: const Text('Upgrade Records')),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () => context.push(RouteNames.vehicleUpgradeAddPath(vehicleId)),
        child: const Icon(Icons.add),
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
                            Icon(Icons.upgrade, size: 64, color: Colors.grey),
                            SizedBox(height: 16),
                            Text('No upgrade records yet.\nTap + to add one.',
                                textAlign: TextAlign.center),
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () async =>
                            ref.invalidate(upgradeRecordListProvider(vehicleId)),
                        child: ListView.builder(
                          itemCount: records.length,
                          itemBuilder: (context, i) =>
                              _RecordCard(record: records[i], vehicleId: vehicleId),
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

class _RecordCard extends ConsumerWidget {
  const _RecordCard({required this.record, required this.vehicleId});
  final UpgradeRecord record;
  final int vehicleId;

  static final _dateFmt = DateFormat.yMMMd();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key('upgrade_${record.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (_) => showDeleteConfirmDialog(context),
      onDismissed: (_) =>
          ref.read(upgradeRecordsProvider.notifier).delete(record.id),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.upgrade)),
          title: Text(record.description),
          subtitle: Text(
              '${_dateFmt.format(record.date)}  •  ${record.mileage.toStringAsFixed(0)} mi'),
          trailing: Text('\$${record.cost.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          onTap: () => context.push(
              RouteNames.vehicleUpgradeEditPath(vehicleId, record.id)),
        ),
      ),
    );
  }
}
