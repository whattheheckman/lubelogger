import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../../../features/vehicles/data/local_vehicle_repository.dart';
import '../domain/odometer_record.dart' as domain;
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
  Future<int> create(domain.OdometerRecord r) =>
      _db.odometerRecordsDao.insertRecord(
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
  }

  @override
  Future<void> delete(int id) => _db.odometerRecordsDao.deleteRecord(id);
}

@riverpod
LocalOdometerRecordRepository localOdometerRecordRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return LocalOdometerRecordRepository(db);
}
