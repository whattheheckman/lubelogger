import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../../../features/vehicles/data/local_vehicle_repository.dart';
import '../domain/reminder_record.dart' as domain;
import 'reminder_record_repository.dart';

part 'local_reminder_record_repository.g.dart';

class LocalReminderRecordRepository implements ReminderRecordRepository {
  LocalReminderRecordRepository(this._db);
  final AppDatabase _db;

  domain.ReminderRecord _fromRow(ReminderRecord row) => domain.ReminderRecord(
        id: row.id,
        remoteId: row.remoteId,
        vehicleId: row.vehicleId,
        description: row.description,
        reminderMetric: row.reminderMetric,
        dateMetric: row.dateMetric,
        mileageMetric: row.mileageMetric,
        isRecurring: row.isRecurring,
        notes: row.notes,
        updatedAt: row.updatedAt,
        syncStatus: row.syncStatus,
      );

  @override
  Stream<List<domain.ReminderRecord>> watchByVehicle(int vehicleId) =>
      _db.reminderRecordsDao
          .watchByVehicle(vehicleId)
          .map((rows) => rows.map(_fromRow).toList());

  @override
  Future<List<domain.ReminderRecord>> getAll() async {
    final rows = await _db.reminderRecordsDao.getAll();
    return rows.map(_fromRow).toList();
  }

  @override
  Future<List<domain.ReminderRecord>> getByVehicle(int vehicleId) async {
    final rows = await _db.reminderRecordsDao.getByVehicle(vehicleId);
    return rows.map(_fromRow).toList();
  }

  @override
  Future<domain.ReminderRecord?> getById(int id) async {
    final rows = await _db.reminderRecordsDao.getAll();
    final row = rows.where((r) => r.id == id).firstOrNull;
    return row == null ? null : _fromRow(row);
  }

  @override
  Future<int> create(domain.ReminderRecord r) =>
      _db.reminderRecordsDao.insertRecord(
        ReminderRecordsCompanion.insert(
          vehicleId: r.vehicleId,
          description: r.description,
          reminderMetric: Value(r.reminderMetric),
          dateMetric: Value(r.dateMetric),
          mileageMetric: Value(r.mileageMetric),
          isRecurring: Value(r.isRecurring),
          notes: Value(r.notes),
          syncStatus: const Value('pending_create'),
          updatedAt: Value(DateTime.now()),
        ),
      );

  @override
  Future<void> update(domain.ReminderRecord r) async {
    await _db.reminderRecordsDao.updateRecord(
      ReminderRecordsCompanion(
        id: Value(r.id),
        vehicleId: Value(r.vehicleId),
        description: Value(r.description),
        reminderMetric: Value(r.reminderMetric),
        dateMetric: Value(r.dateMetric),
        mileageMetric: Value(r.mileageMetric),
        isRecurring: Value(r.isRecurring),
        notes: Value(r.notes),
        syncStatus: const Value('pending_update'),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> delete(int id) => _db.reminderRecordsDao.deleteRecord(id);
}

@riverpod
LocalReminderRecordRepository localReminderRecordRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return LocalReminderRecordRepository(db);
}
