import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/local_reminder_record_repository.dart';
import '../domain/reminder_record.dart';

part 'reminders_provider.g.dart';

/// Reactive stream of all reminders across every vehicle (used for badge count).
final allRemindersStreamProvider = StreamProvider<List<ReminderRecord>>((ref) {
  final repo = ref.watch(localReminderRecordRepositoryProvider);
  return repo.watchAll();
});

@riverpod
Stream<List<ReminderRecord>> reminderList(ReminderListRef ref, int vehicleId) {
  final repo = ref.watch(localReminderRecordRepositoryProvider);
  return repo.watchByVehicle(vehicleId);
}

@riverpod
Future<List<ReminderRecord>> allReminders(AllRemindersRef ref) {
  final repo = ref.watch(localReminderRecordRepositoryProvider);
  return repo.getAll();
}

@riverpod
class RemindersNotifier extends _$RemindersNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> save(ReminderRecord record) async {
    final repo = ref.read(localReminderRecordRepositoryProvider);
    if (record.id == 0) {
      await repo.create(record);
    } else {
      await repo.update(record);
    }
  }

  Future<void> delete(int id) async {
    final repo = ref.read(localReminderRecordRepositoryProvider);
    await repo.delete(id);
  }
}
