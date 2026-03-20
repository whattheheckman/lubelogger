import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../providers/tax_records_provider.dart';
import '../domain/tax_record.dart';

class TaxRecordListScreen extends ConsumerWidget {
  const TaxRecordListScreen({super.key, required this.vehicleId});
  final int vehicleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRecords = ref.watch(taxRecordListProvider(vehicleId));

    return Scaffold(
      appBar: AppBar(title: const Text('Tax Records')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/vehicles/$vehicleId/taxes/add'),
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
                  Icon(Icons.receipt_long, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No tax records yet.\nTap + to add one.',
                      textAlign: TextAlign.center),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async =>
                ref.invalidate(taxRecordListProvider(vehicleId)),
            child: ListView.builder(
              itemCount: records.length,
              itemBuilder: (context, i) =>
                  _TaxCard(record: records[i], vehicleId: vehicleId, ref: ref),
            ),
          );
        },
      ),
    );
  }
}

class _TaxCard extends StatelessWidget {
  const _TaxCard(
      {required this.record, required this.vehicleId, required this.ref});
  final TaxRecord record;
  final int vehicleId;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final fmt = DateFormat.yMMMd();
    return Dismissible(
      key: Key('tax_${record.id}'),
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
          ref.read(taxRecordsNotifierProvider.notifier).delete(record.id),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.receipt_long)),
          title: Text(record.description),
          subtitle: Text(
            '${fmt.format(record.date)}${record.isRecurring ? '  •  Recurring' : ''}',
          ),
          trailing: Text('\$${record.cost.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
