import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:lubelogger/features/vehicles/domain/vehicle.dart';
import 'package:lubelogger/features/vehicles/providers/vehicles_provider.dart';
import 'package:lubelogger/features/reminders/providers/reminders_provider.dart';
import 'package:lubelogger/features/reminders/domain/reminder_record.dart';

class GlobalRemindersScreen extends ConsumerWidget {
  const GlobalRemindersScreen({super.key});

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

  String _urgencyText(String label) => switch (label) {
        'overdue' => 'Overdue',
        'due_soon' => 'Due Soon',
        _ => 'OK',
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncReminders = ref.watch(allRemindersProvider);
    final vehicles = ref.watch(vehicleListProvider).valueOrNull ?? [];
    final vehicleMap = {for (final v in vehicles) v.id: v};

    String vehicleName(Vehicle? v) =>
        v != null ? '${v.year} ${v.model}' : 'Unknown Vehicle';

    return Scaffold(
      appBar: AppBar(title: const Text('Upcoming Reminders')),
      body: asyncReminders.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (reminders) {
          final upcoming = reminders
              .where((r) => _urgencyLabel(r) != 'ok')
              .toList();
          if (upcoming.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_outline, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No upcoming reminders.',
                      textAlign: TextAlign.center),
                ],
              ),
            );
          }
          final sorted = [...upcoming]..sort((a, b) {
              const order = {'overdue': 0, 'due_soon': 1, 'ok': 2};
              return (order[_urgencyLabel(a)] ?? 3)
                  .compareTo(order[_urgencyLabel(b)] ?? 3);
            });
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(allRemindersProvider),
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
                        Text(vehicleName(vehicleMap[r.vehicleId]),
                            style: const TextStyle(fontSize: 11)),
                        if (r.dateMetric != null)
                          Text('Due: ${_dateFmt.format(r.dateMetric!)}'),
                        if (r.mileageMetric != null)
                          Text(
                              'At: ${r.mileageMetric!.toStringAsFixed(0)} mi'),
                      ],
                    ),
                    trailing: Chip(
                      label: Text(_urgencyText(urgency),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 11)),
                      backgroundColor: _urgencyColor(urgency),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
