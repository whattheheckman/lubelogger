import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../providers/service_records_provider.dart';
import '../domain/service_record.dart';

class ServiceRecordListScreen extends ConsumerWidget {
  const ServiceRecordListScreen({super.key, required this.vehicleId});
  final int vehicleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRecords = ref.watch(serviceRecordListProvider(vehicleId));

    return Scaffold(
      appBar: AppBar(title: const Text('Service Records')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/vehicles/$vehicleId/service/add'),
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
                  Icon(Icons.build_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No service records yet.\nTap + to add one.',
                      textAlign: TextAlign.center),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async =>
                ref.invalidate(serviceRecordListProvider(vehicleId)),
            child: ListView.builder(
              itemCount: records.length,
              itemBuilder: (context, i) =>
                  _RecordCard(record: records[i], vehicleId: vehicleId, ref: ref),
            ),
          );
        },
      ),
    );
  }
}

class _RecordCard extends StatelessWidget {
  const _RecordCard(
      {required this.record, required this.vehicleId, required this.ref});
  final ServiceRecord record;
  final int vehicleId;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final fmt = DateFormat.yMMMd();
    return Dismissible(
      key: Key('service_${record.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (_) async {
        return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Delete Record'),
            content: const Text('Are you sure you want to delete this record?'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () => Navigator.pop(ctx, true),
                  child: const Text('Delete')),
            ],
          ),
        );
      },
      onDismissed: (_) =>
          ref.read(serviceRecordsNotifierProvider.notifier).delete(record.id),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.build)),
          title: Text(record.description),
          subtitle: Text(
              '${fmt.format(record.date)}  •  ${record.mileage.toStringAsFixed(0)} mi'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$${record.cost.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              if (record.syncStatus != 'synced')
                const Icon(Icons.sync, size: 14, color: Colors.orange),
            ],
          ),
          onTap: () => context
              .push('/vehicles/$vehicleId/service/${record.id}/edit'),
        ),
      ),
    );
  }
}
