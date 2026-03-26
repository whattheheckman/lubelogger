import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/reminder_records_table.dart';

part 'reminder_records_dao.g.dart';

@DriftAccessor(tables: [ReminderRecords])
class ReminderRecordsDao extends DatabaseAccessor<AppDatabase> with _$ReminderRecordsDaoMixin {
  ReminderRecordsDao(super.db);

  Stream<List<ReminderRecord>> watchAll() => select(reminderRecords).watch();

  Stream<List<ReminderRecord>> watchByVehicle(int vehicleId) =>
      (select(reminderRecords)..where((t) => t.vehicleId.equals(vehicleId))).watch();

  Future<List<ReminderRecord>> getAll() => select(reminderRecords).get();

  Future<List<ReminderRecord>> getByVehicle(int vehicleId) =>
      (select(reminderRecords)..where((t) => t.vehicleId.equals(vehicleId))).get();

  Future<int> insertRecord(ReminderRecordsCompanion r) =>
      into(reminderRecords).insert(r);

  Future<bool> updateRecord(ReminderRecordsCompanion r) =>
      update(reminderRecords).replace(r);

  Future<int> deleteRecord(int id) =>
      (delete(reminderRecords)..where((t) => t.id.equals(id))).go();

  Future<List<ReminderRecord>> getPending() =>
      (select(reminderRecords)..where((t) => t.syncStatus.isIn(['pending_create', 'pending_update', 'pending_delete']))).get();
}
