import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:lubelogger/core/database/app_database.dart';
import 'package:lubelogger/features/vehicles/data/local_vehicle_repository.dart';
import 'package:lubelogger/features/supplies/domain/supply_record.dart' as domain;
import 'supply_record_repository.dart';

part 'local_supply_record_repository.g.dart';

class LocalSupplyRecordRepository implements SupplyRecordRepository {
  LocalSupplyRecordRepository(this._db);
  final AppDatabase _db;

  domain.SupplyRecord _fromRow(SupplyRecord row) => domain.SupplyRecord(
        id: row.id,
        remoteId: row.remoteId,
        vehicleId: row.vehicleId,
        partNumber: row.partNumber,
        description: row.description,
        quantity: row.quantity,
        cost: row.cost,
        notes: row.notes,
        updatedAt: row.updatedAt,
        syncStatus: row.syncStatus,
      );

  @override
  Stream<List<domain.SupplyRecord>> watchByVehicle(int vehicleId) =>
      _db.supplyRecordsDao
          .watchByVehicle(vehicleId)
          .map((rows) => rows.map(_fromRow).toList());

  @override
  Future<List<domain.SupplyRecord>> getByVehicle(int vehicleId) async {
    final rows = await _db.supplyRecordsDao.getByVehicle(vehicleId);
    return rows.map(_fromRow).toList();
  }

  @override
  Future<domain.SupplyRecord?> getById(int id) async {
    // SupplyRecordsDao has no getById; returns null — forms load from list
    return null;
  }

  @override
  Future<int> create(domain.SupplyRecord r) async {
    final id = await _db.supplyRecordsDao.insertRecord(
      SupplyRecordsCompanion.insert(
        vehicleId: r.vehicleId,
        description: r.description,
        partNumber: Value(r.partNumber),
        quantity: Value(r.quantity),
        cost: Value(r.cost),
        notes: Value(r.notes),
        syncStatus: const Value('pending_create'),
        updatedAt: Value(DateTime.now()),
      ),
    );
    await _db.syncQueueDao.enqueue(SyncQueueCompanion.insert(
      entityType: 'supply',
      localId: id,
      operation: 'create',
      payload: jsonEncode({
        'vehicleId': r.vehicleId,
        'description': r.description,
        'partNumber': r.partNumber,
        'quantity': r.quantity,
        'cost': r.cost,
        'notes': r.notes,
      }),
    ));
    return id;
  }

  @override
  Future<void> update(domain.SupplyRecord r) async {
    await _db.supplyRecordsDao.updateRecord(
      SupplyRecordsCompanion(
        id: Value(r.id),
        vehicleId: Value(r.vehicleId),
        description: Value(r.description),
        partNumber: Value(r.partNumber),
        quantity: Value(r.quantity),
        cost: Value(r.cost),
        notes: Value(r.notes),
        syncStatus: const Value('pending_update'),
        updatedAt: Value(DateTime.now()),
      ),
    );
    await _db.syncQueueDao.enqueue(SyncQueueCompanion.insert(
      entityType: 'supply',
      localId: r.id,
      remoteId: Value(r.remoteId),
      operation: 'update',
      payload: jsonEncode({
        'id': r.remoteId,
        'vehicleId': r.vehicleId,
        'description': r.description,
        'partNumber': r.partNumber,
        'quantity': r.quantity,
        'cost': r.cost,
        'notes': r.notes,
      }),
    ));
  }

  @override
  Future<void> delete(int id) async {
    final row = await (_db.select(_db.supplyRecords)..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row != null && row.remoteId != null) {
      await _db.syncQueueDao.enqueue(SyncQueueCompanion.insert(
        entityType: 'supply',
        localId: id,
        remoteId: Value(row.remoteId),
        operation: 'delete',
        payload: '{}',
      ));
    }
    await _db.supplyRecordsDao.deleteRecord(id);
  }
}

@riverpod
LocalSupplyRecordRepository localSupplyRecordRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return LocalSupplyRecordRepository(db);
}
