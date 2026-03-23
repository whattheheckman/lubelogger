import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/plan_record.dart';
import '../providers/plan_records_provider.dart';

class KanbanBoardScreen extends ConsumerWidget {
  const KanbanBoardScreen({super.key, required this.vehicleId});
  final int vehicleId;

  static const _columns = ['Backlog', 'InProgress', 'Testing', 'Done'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRecords = ref.watch(planRecordListProvider(vehicleId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Planner'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddDialog(context, ref),
          ),
        ],
      ),
      body: asyncRecords.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (records) => ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8),
          children: _columns
              .map((col) => _KanbanColumn(
                    title: col,
                    vehicleId: vehicleId,
                    cards: records
                        .where((r) => r.progress == col)
                        .toList(),
                    allColumns: _columns,
                  ))
              .toList(),
        ),
      ),
    );
  }

  Future<void> _showAddDialog(BuildContext context, WidgetRef ref) async {
    final ctrl = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Task'),
        content: TextField(
          controller: ctrl,
          decoration: const InputDecoration(labelText: 'Description'),
          autofocus: true,
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, ctrl.text.trim()),
              child: const Text('Add')),
        ],
      ),
    );
    if (result != null && result.isNotEmpty) {
      await ref.read(planRecordsNotifierProvider.notifier).create(
            PlanRecord(
              id: 0,
              vehicleId: vehicleId,
              description: result,
              updatedAt: DateTime.now(),
            ),
          );
    }
  }
}

class _KanbanColumn extends ConsumerWidget {
  const _KanbanColumn({
    required this.title,
    required this.vehicleId,
    required this.cards,
    required this.allColumns,
  });
  final String title;
  final int vehicleId;
  final List<PlanRecord> cards;
  final List<String> allColumns;

  Color _columnColor(BuildContext context) => switch (title) {
        'Backlog' => Colors.grey.shade200,
        'InProgress' => Colors.blue.shade50,
        'Testing' => Colors.orange.shade50,
        'Done' => Colors.green.shade50,
        _ => Theme.of(context).colorScheme.surface,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 240,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Row(
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                Chip(
                  label: Text('${cards.length}',
                      style: const TextStyle(fontSize: 11)),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
          Expanded(
            child: DragTarget<PlanRecord>(
              builder: (context, candidateData, _) => Container(
                decoration: BoxDecoration(
                  color: candidateData.isNotEmpty
                      ? Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.3)
                      : _columnColor(context),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(8)),
                  border: Border.all(
                      color:
                          Theme.of(context).colorScheme.outlineVariant),
                ),
                child: cards.isEmpty
                    ? const Center(
                        child: Text('Drop here',
                            style: TextStyle(color: Colors.grey)))
                    : ListView(
                        padding: const EdgeInsets.all(4),
                        children:
                            cards.map((r) => _KanbanCard(record: r, allColumns: allColumns)).toList(),
                      ),
              ),
              onAcceptWithDetails: (details) {
                final dragged = details.data;
                if (dragged.progress != title) {
                  ref
                      .read(planRecordsNotifierProvider.notifier)
                      .updateProgress(dragged, title);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _KanbanCard extends ConsumerWidget {
  const _KanbanCard({required this.record, required this.allColumns});
  final PlanRecord record;
  final List<String> allColumns;

  Color _priorityColor() => switch (record.priority) {
        'critical' => Colors.red,
        'high' => Colors.orange,
        'low' => Colors.blue,
        _ => Colors.grey,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LongPressDraggable<PlanRecord>(
      data: record,
      feedback: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 220,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(record.description),
        ),
      ),
      childWhenDragging: Opacity(opacity: 0.4, child: _buildCard(context, ref)),
      child: _buildCard(context, ref),
    );
  }

  Widget _buildCard(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _priorityColor(),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(record.description,
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                ),
                GestureDetector(
                  onTap: () =>
                      ref.read(planRecordsNotifierProvider.notifier).delete(record.id),
                  child: const Icon(Icons.close, size: 16, color: Colors.grey),
                ),
              ],
            ),
            if (record.notes.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(record.notes,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
            ],
          ],
        ),
      ),
    );
  }
}
