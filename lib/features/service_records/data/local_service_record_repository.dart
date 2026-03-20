import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../../../features/vehicles/data/local_vehicle_repository.dart';
import '../domain/service_record.dart' as domain;
import 'service_record_repository.dart';

part 'local_service_record_repository.g.dart';

class LocalServiceRecordRepository implements ServiceRecordRepository {
  LocalServiceRecordRepository(this._db);
  final AppDatabase _db;

  domain.ServiceRecord _fromRow(ServiceRecord row) => domain.ServiceRecord(
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
  Stream<List<domain.ServiceRecord>> watchByVehicle(int vehicleId) =>
      _db.serviceRecordsDao
          .watchByVehicle(vehicleId)
          .map((rows) => rows.map(_fromRow).toList());

  @override
  Future<List<domain.ServiceRecord>> getByVehicle(int vehicleId) async {
    final rows = await _db.serviceRecordsDao.getByVehicle(vehicleId);
    return rows.map(_fromRow).toList();
  }

  @override
  Future<domain.ServiceRecord?> getById(int id) async {
    final row = await _db.serviceRecordsDao.getById(id);
    return row == null ? null : _fromRow(row);
  }

  @override
  Future<int> create(domain.ServiceRecord r) =>
      _db.serviceRecordsDao.insertRecord(
        ServiceRecordsCompanion.insert(
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

  @override
  Future<void> update(domain.ServiceRecord r) async {
    await _db.serviceRecordsDao.updateRecord(
      ServiceRecordsCompanion(
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
  }

  @override
  Future<void> delete(int id) => _db.serviceRecordsDao.deleteRecord(id);
}

@riverpod
LocalServiceRecordRepository localServiceRecordRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return LocalServiceRecordRepository(db);
}
