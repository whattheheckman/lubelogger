import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:lubelogger/core/database/app_database.dart';
import 'package:lubelogger/features/vehicles/data/local_vehicle_repository.dart';
import 'package:lubelogger/features/repair_records/domain/repair_record.dart' as domain;
import 'repair_record_repository.dart';

part 'local_repair_record_repository.g.dart';

class LocalRepairRecordRepository implements RepairRecordRepository {
  LocalRepairRecordRepository(this._db);
  final AppDatabase _db;

  domain.RepairRecord _fromRow(RepairRecord row) => domain.RepairRecord(
        id: row.id,
        remoteId: row.remoteId,
        vehicleId: row.vehicleId,
        date: row.date,
        mileage: row.mileage,
        description: row.description,
        cost: row.cost,
        notes: row.notes,
        tags: List<String>.from(jsonDecode(row.tags) as List),
        updatedAt: row.updatedAt,
        syncStatus: row.syncStatus,
      );

  @override
  Stream<List<domain.RepairRecord>> watchByVehicle(int vehicleId) =>
      _db.repairRecordsDao
          .watchByVehicle(vehicleId)
          .map((rows) => rows.map(_fromRow).toList());

  @override
  Future<List<domain.RepairRecord>> getByVehicle(int vehicleId) async {
    final rows = await _db.repairRecordsDao.getByVehicle(vehicleId);
    return rows.map(_fromRow).toList();
  }

  @override
  Future<domain.RepairRecord?> getById(int id) async {
    final row = await _db.repairRecordsDao.getById(id);
    return row == null ? null : _fromRow(row);
  }

  @override
  Future<int> create(domain.RepairRecord r) async {
    final id = await _db.repairRecordsDao.insertRecord(
      RepairRecordsCompanion.insert(
        vehicleId: r.vehicleId,
        date: r.date,
        mileage: Value(r.mileage),
        description: r.description,
        cost: Value(r.cost),
        notes: Value(r.notes),
        tags: Value(jsonEncode(r.tags)),
        syncStatus: const Value('pending_create'),
        updatedAt: Value(DateTime.now()),
      ),
    );
    await _db.syncQueueDao.enqueue(SyncQueueCompanion.insert(
      entityType: 'repair_record',
      localId: id,
      operation: 'create',
      payload: jsonEncode({
        'vehicleId': r.vehicleId,
        'date': r.date.toIso8601String(),
        'mileage': r.mileage,
        'description': r.description,
        'cost': r.cost,
        'notes': r.notes,
        'tags': r.tags,
      }),
    ));
    return id;
  }

  @override
  Future<void> update(domain.RepairRecord r) async {
    await _db.repairRecordsDao.updateRecord(
      RepairRecordsCompanion(
        id: Value(r.id),
        vehicleId: Value(r.vehicleId),
        date: Value(r.date),
        mileage: Value(r.mileage),
        description: Value(r.description),
        cost: Value(r.cost),
        notes: Value(r.notes),
        tags: Value(jsonEncode(r.tags)),
        syncStatus: const Value('pending_update'),
        updatedAt: Value(DateTime.now()),
      ),
    );
    await _db.syncQueueDao.enqueue(SyncQueueCompanion.insert(
      entityType: 'repair_record',
      localId: r.id,
      remoteId: Value(r.remoteId),
      operation: 'update',
      payload: jsonEncode({
        'id': r.remoteId,
        'vehicleId': r.vehicleId,
        'date': r.date.toIso8601String(),
        'mileage': r.mileage,
        'description': r.description,
        'cost': r.cost,
        'notes': r.notes,
        'tags': r.tags,
      }),
    ));
  }

  @override
  Future<void> delete(int id) async {
    final row = await _db.repairRecordsDao.getById(id);
    if (row != null && row.remoteId != null) {
      await _db.syncQueueDao.enqueue(SyncQueueCompanion.insert(
        entityType: 'repair_record',
        localId: id,
        remoteId: Value(row.remoteId),
        operation: 'delete',
        payload: '{}',
      ));
    }
    await _db.repairRecordsDao.deleteRecord(id);
  }
}

@riverpod
LocalRepairRecordRepository localRepairRecordRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return LocalRepairRecordRepository(db);
}
