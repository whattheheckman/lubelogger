import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/routing/route_names.dart';
import '../../../core/widgets/delete_confirm_dialog.dart';
import '../../../core/widgets/record_stats_banner.dart';
import '../providers/odometer_records_provider.dart';
import '../domain/odometer_record.dart';

class OdometerRecordListScreen extends ConsumerWidget {
  const OdometerRecordListScreen(
      {super.key, required this.vehicleId, this.embedded = false});
  final int vehicleId;
  final bool embedded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRecords = ref.watch(odometerRecordListProvider(vehicleId));

    return Scaffold(
      appBar: embedded ? null : AppBar(title: const Text('Odometer Records')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(RouteNames.vehicleOdometerAddPath(vehicleId)),
        child: const Icon(Icons.add),
      ),
      body: asyncRecords.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (records) {
          return Column(
            children: [
              RecordStatsBanner(count: records.length),
              const Divider(height: 1),
              Expanded(
                child: records.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.speed, size: 64, color: Colors.grey),
                            SizedBox(height: 16),
                            Text('No odometer records yet.\nTap + to add one.',
                                textAlign: TextAlign.center),
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () async =>
                            ref.invalidate(odometerRecordListProvider(vehicleId)),
                        child: ListView.builder(
                          itemCount: records.length,
                          itemBuilder: (context, i) =>
                              _OdomCard(record: records[i], vehicleId: vehicleId),
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

class _OdomCard extends ConsumerWidget {
  const _OdomCard({required this.record, required this.vehicleId});
  final OdometerRecord record;
  final int vehicleId;

  static final _dateFmt = DateFormat.yMMMd();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key('odom_${record.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (_) => showDeleteConfirmDialog(context),
      onDismissed: (_) =>
          ref.read(odometerRecordsNotifierProvider.notifier).delete(record.id),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.speed)),
          title: Text('${record.mileage.toStringAsFixed(0)} mi'),
          subtitle: Text(_dateFmt.format(record.date)),
          trailing: record.notes.isNotEmpty
              ? const Icon(Icons.notes, color: Colors.grey)
              : null,
          onTap: () => context.push(
              RouteNames.vehicleOdometerEditPath(vehicleId, record.id)),
        ),
      ),
    );
  }
}
