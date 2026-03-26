import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/routing/route_names.dart';
import '../../../core/widgets/delete_confirm_dialog.dart';
import '../../../core/widgets/record_stats_banner.dart';
import '../providers/tax_records_provider.dart';
import '../domain/tax_record.dart';

class TaxRecordListScreen extends ConsumerWidget {
  const TaxRecordListScreen(
      {super.key, required this.vehicleId, this.embedded = false});
  final int vehicleId;
  final bool embedded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRecords = ref.watch(taxRecordListProvider(vehicleId));

    return Scaffold(
      appBar: embedded ? null : AppBar(title: const Text('Tax Records')),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () => context.push(RouteNames.vehicleTaxAddPath(vehicleId)),
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
                            Icon(Icons.receipt_long,
                                size: 64, color: Colors.grey),
                            SizedBox(height: 16),
                            Text('No tax records yet.\nTap + to add one.',
                                textAlign: TextAlign.center),
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () async =>
                            ref.invalidate(taxRecordListProvider(vehicleId)),
                        child: ListView.builder(
                          itemCount: records.length,
                          itemBuilder: (context, i) =>
                              _TaxCard(record: records[i]),
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

class _TaxCard extends ConsumerWidget {
  const _TaxCard({required this.record});
  final TaxRecord record;

  static final _dateFmt = DateFormat.yMMMd();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key('tax_${record.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (_) => showDeleteConfirmDialog(context),
      onDismissed: (_) =>
          ref.read(taxRecordsNotifierProvider.notifier).delete(record.id),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.receipt_long)),
          title: Text(record.description),
          subtitle: Text(
            '${_dateFmt.format(record.date)}${record.isRecurring ? '  •  Recurring' : ''}',
          ),
          trailing: Text('\$${record.cost.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
