import '../domain/reminder_record.dart';

abstract interface class ReminderRecordRepository {
  Stream<List<ReminderRecord>> watchByVehicle(int vehicleId);
  Future<List<ReminderRecord>> getAll();
  Future<List<ReminderRecord>> getByVehicle(int vehicleId);
  Future<ReminderRecord?> getById(int id);
  Future<int> create(ReminderRecord record);
  Future<void> update(ReminderRecord record);
  Future<void> delete(int id);
}
