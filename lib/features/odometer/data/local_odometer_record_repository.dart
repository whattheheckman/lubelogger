import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:lubelogger/core/database/app_database.dart';
import 'package:lubelogger/features/vehicles/data/local_vehicle_repository.dart';
import 'package:lubelogger/features/odometer/domain/odometer_record.dart' as domain;
import 'odometer_record_repository.dart';

part 'local_odometer_record_repository.g.dart';

class LocalOdometerRecordRepository implements OdometerRecordRepository {
  LocalOdometerRecordRepository(this._db);
  final AppDatabase _db;

  domain.OdometerRecord _fromRow(OdometerRecord row) => domain.OdometerRecord(
        id: row.id,
        remoteId: row.remoteId,
        vehicleId: row.vehicleId,
        date: row.date,
        mileage: row.mileage,
        initialMileage: row.initialMileage,
        notes: row.notes,
        updatedAt: row.updatedAt,
        syncStatus: row.syncStatus,
      );

  @override
  Stream<List<domain.OdometerRecord>> watchByVehicle(int vehicleId) =>
      _db.odometerRecordsDao
          .watchByVehicle(vehicleId)
          .map((rows) => rows.map(_fromRow).toList());

  @override
  Future<List<domain.OdometerRecord>> getByVehicle(int vehicleId) async {
    final rows = await _db.odometerRecordsDao.getByVehicle(vehicleId);
    return rows.map(_fromRow).toList();
  }

  @override
  Future<domain.OdometerRecord?> getById(int id) async {
    final row = await _db.odometerRecordsDao.getById(id);
    return row == null ? null : _fromRow(row);
  }

  @override
  Future<int> create(domain.OdometerRecord r) async {
    final id = await _db.odometerRecordsDao.insertRecord(
      OdometerRecordsCompanion.insert(
        vehicleId: r.vehicleId,
        date: r.date,
        mileage: Value(r.mileage),
        initialMileage: Value(r.initialMileage),
        notes: Value(r.notes),
        syncStatus: const Value('pending_create'),
        updatedAt: Value(DateTime.now()),
      ),
    );
    await _db.syncQueueDao.enqueue(SyncQueueCompanion.insert(
      entityType: 'odometer_record',
      localId: id,
      operation: 'create',
      payload: jsonEncode({
        'vehicleId': r.vehicleId,
        'date': r.date.toIso8601String(),
        'mileage': r.mileage,
        'initialMileage': r.initialMileage,
        'notes': r.notes,
      }),
    ));
    return id;
  }

  @override
  Future<void> update(domain.OdometerRecord r) async {
    await _db.odometerRecordsDao.updateRecord(
      OdometerRecordsCompanion(
        id: Value(r.id),
        vehicleId: Value(r.vehicleId),
        date: Value(r.date),
        mileage: Value(r.mileage),
        initialMileage: Value(r.initialMileage),
        notes: Value(r.notes),
        syncStatus: const Value('pending_update'),
        updatedAt: Value(DateTime.now()),
      ),
    );
    await _db.syncQueueDao.enqueue(SyncQueueCompanion.insert(
      entityType: 'odometer_record',
      localId: r.id,
      remoteId: Value(r.remoteId),
      operation: 'update',
      payload: jsonEncode({
        'id': r.remoteId,
        'vehicleId': r.vehicleId,
        'date': r.date.toIso8601String(),
        'mileage': r.mileage,
        'initialMileage': r.initialMileage,
        'notes': r.notes,
      }),
    ));
  }

  @override
  Future<void> delete(int id) async {
    final row = await _db.odometerRecordsDao.getById(id);
    if (row != null && row.remoteId != null) {
      await _db.syncQueueDao.enqueue(SyncQueueCompanion.insert(
        entityType: 'odometer_record',
        localId: id,
        remoteId: Value(row.remoteId),
        operation: 'delete',
        payload: '{}',
      ));
    }
    await _db.odometerRecordsDao.deleteRecord(id);
  }
}

@riverpod
LocalOdometerRecordRepository localOdometerRecordRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return LocalOdometerRecordRepository(db);
}
