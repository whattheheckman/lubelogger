import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:lubelogger/core/routing/route_names.dart';
import 'package:lubelogger/core/widgets/record_stats_banner.dart';
import 'package:lubelogger/features/reminders/providers/reminders_provider.dart';
import 'package:lubelogger/features/reminders/domain/reminder_record.dart';

class RemindersScreen extends ConsumerWidget {
  const RemindersScreen(
      {super.key, required this.vehicleId, this.embedded = false});
  final int vehicleId;
  final bool embedded;

  static final _dateFmt = DateFormat.yMMMd();

  String _urgencyLabel(ReminderRecord r) {
    if (r.reminderMetric == 'date' || r.reminderMetric == 'both') {
      if (r.dateMetric != null) {
        final daysLeft = r.dateMetric!.difference(DateTime.now()).inDays;
        if (daysLeft < 0) return 'overdue';
        if (daysLeft <= 30) return 'due_soon';
      }
    }
    return 'ok';
  }

  Color _urgencyColor(String label) => switch (label) {
        'overdue' => Colors.red,
        'due_soon' => Colors.orange,
        _ => Colors.green,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncReminders = ref.watch(reminderListProvider(vehicleId));

    return Scaffold(
      appBar: embedded ? null : AppBar(title: const Text('Reminders')),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () => context.push(RouteNames.vehicleReminderAddPath(vehicleId)),
        child: const Icon(Icons.add),
      ),
      body: asyncReminders.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (reminders) {
          final sorted = [...reminders]..sort((a, b) {
              final ua = _urgencyLabel(a);
              final ub = _urgencyLabel(b);
              const order = {'overdue': 0, 'due_soon': 1, 'ok': 2};
              return (order[ua] ?? 3).compareTo(order[ub] ?? 3);
            });
          return Column(
            children: [
              RecordStatsBanner(count: reminders.length),
              const Divider(height: 1),
              Expanded(
                child: reminders.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.notifications_none,
                                size: 64, color: Colors.grey),
                            SizedBox(height: 16),
                            Text('No reminders yet.\nTap + to add one.',
                                textAlign: TextAlign.center),
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () async =>
                            ref.invalidate(reminderListProvider(vehicleId)),
                        child: ListView.builder(
                          itemCount: sorted.length,
                          itemBuilder: (context, i) {
                            final r = sorted[i];
                            final urgency = _urgencyLabel(r);
                            return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _urgencyColor(urgency),
                      child: const Icon(Icons.notifications,
                          color: Colors.white),
                    ),
                    title: Text(r.description),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (r.dateMetric != null)
                          Text('Due: ${_dateFmt.format(r.dateMetric!)}'),
                        if (r.mileageMetric != null)
                          Text(
                              'At: ${r.mileageMetric!.toStringAsFixed(0)} mi'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (r.isRecurring)
                          const Icon(Icons.repeat, size: 16),
                        IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () => ref
                              .read(remindersProvider.notifier)
                              .delete(r.id),
                        ),
                      ],
                    ),
                  ),
                            );
                          },
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
