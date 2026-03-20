import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../../../features/vehicles/data/local_vehicle_repository.dart';
import '../domain/plan_record.dart' as domain;
import 'plan_record_repository.dart';

part 'local_plan_record_repository.g.dart';

class LocalPlanRecordRepository implements PlanRecordRepository {
  LocalPlanRecordRepository(this._db);
  final AppDatabase _db;

  domain.PlanRecord _fromRow(PlanRecord row) => domain.PlanRecord(
        id: row.id,
        remoteId: row.remoteId,
        vehicleId: row.vehicleId,
        description: row.description,
        priority: row.priority,
        progress: row.progress,
        notes: row.notes,
        updatedAt: row.updatedAt,
        syncStatus: row.syncStatus,
      );

  @override
  Stream<List<domain.PlanRecord>> watchByVehicle(int vehicleId) =>
      _db.planRecordsDao
          .watchByVehicle(vehicleId)
          .map((rows) => rows.map(_fromRow).toList());

  @override
  Future<List<domain.PlanRecord>> getByVehicle(int vehicleId) async {
    final rows = await _db.planRecordsDao.getByVehicle(vehicleId);
    return rows.map(_fromRow).toList();
  }

  @override
  Future<domain.PlanRecord?> getById(int id) async {
    // PlanRecordsDao has no getById — returns null; forms load from list
    return null;
  }

  @override
  Future<int> create(domain.PlanRecord r) =>
      _db.planRecordsDao.insertRecord(
        PlanRecordsCompanion.insert(
          vehicleId: r.vehicleId,
          description: r.description,
          priority: Value(r.priority),
          progress: Value(r.progress),
          notes: Value(r.notes),
          syncStatus: const Value('pending_create'),
          updatedAt: Value(DateTime.now()),
        ),
      );

  @override
  Future<void> update(domain.PlanRecord r) async {
    await _db.planRecordsDao.updateRecord(
      PlanRecordsCompanion(
        id: Value(r.id),
        vehicleId: Value(r.vehicleId),
        description: Value(r.description),
        priority: Value(r.priority),
        progress: Value(r.progress),
        notes: Value(r.notes),
        syncStatus: const Value('pending_update'),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> delete(int id) => _db.planRecordsDao.deleteRecord(id);
}

@riverpod
LocalPlanRecordRepository localPlanRecordRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return LocalPlanRecordRepository(db);
}
