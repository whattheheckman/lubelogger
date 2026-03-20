import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../providers/odometer_records_provider.dart';
import '../domain/odometer_record.dart';

class OdometerRecordListScreen extends ConsumerWidget {
  const OdometerRecordListScreen({super.key, required this.vehicleId});
  final int vehicleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRecords = ref.watch(odometerRecordListProvider(vehicleId));

    return Scaffold(
      appBar: AppBar(title: const Text('Odometer Records')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/vehicles/$vehicleId/odometer/add'),
        child: const Icon(Icons.add),
      ),
      body: asyncRecords.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (records) {
          if (records.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.speed, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No odometer records yet.\nTap + to add one.',
                      textAlign: TextAlign.center),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async =>
                ref.invalidate(odometerRecordListProvider(vehicleId)),
            child: ListView.builder(
              itemCount: records.length,
              itemBuilder: (context, i) =>
                  _OdomCard(record: records[i], vehicleId: vehicleId, ref: ref),
            ),
          );
        },
      ),
    );
  }
}

class _OdomCard extends StatelessWidget {
  const _OdomCard(
      {required this.record, required this.vehicleId, required this.ref});
  final OdometerRecord record;
  final int vehicleId;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final fmt = DateFormat.yMMMd();
    return Dismissible(
      key: Key('odom_${record.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (_) async => await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Delete Record'),
          content: const Text('Are you sure?'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Cancel')),
            TextButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text('Delete')),
          ],
        ),
      ),
      onDismissed: (_) =>
          ref.read(odometerRecordsNotifierProvider.notifier).delete(record.id),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.speed)),
          title: Text('${record.mileage.toStringAsFixed(0)} mi'),
          subtitle: Text(fmt.format(record.date)),
          trailing: record.notes.isNotEmpty
              ? const Icon(Icons.notes, color: Colors.grey)
              : null,
        ),
      ),
    );
  }
}
