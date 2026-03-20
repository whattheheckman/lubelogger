import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../../../features/vehicles/data/local_vehicle_repository.dart';
import '../domain/gas_record.dart' as domain;
import 'gas_record_repository.dart';

part 'local_gas_record_repository.g.dart';

class LocalGasRecordRepository implements GasRecordRepository {
  LocalGasRecordRepository(this._db);
  final AppDatabase _db;

  domain.GasRecord _fromRow(GasRecord row) => domain.GasRecord(
        id: row.id,
        remoteId: row.remoteId,
        vehicleId: row.vehicleId,
        date: row.date,
        mileage: row.mileage,
        gallons: row.gallons,
        cost: row.cost,
        isFillToFull: row.isFillToFull,
        missedFuelUp: row.missedFuelUp,
        mpg: row.mpg,
        notes: row.notes,
        updatedAt: row.updatedAt,
        syncStatus: row.syncStatus,
      );

  /// Calculates MPG for a fill-to-full event.
  /// If missedFuelUp, accumulates gallons since the previous fill-to-full.
  Future<double?> _calculateMpg(domain.GasRecord r) async {
    if (!r.isFillToFull) return null;
    final prev =
        await _db.gasRecordsDao.getPreviousFillToFull(r.vehicleId, r.mileage);
    if (prev == null) return null;
    final deltaMiles = r.mileage - prev.mileage;
    if (deltaMiles <= 0) return null;

    double totalGallons = r.gallons;
    if (r.missedFuelUp) {
      // Sum all partial fills between prev and this fill
      final partials = await _db.gasRecordsDao
          .getBetweenMileage(r.vehicleId, prev.mileage, r.mileage);
      totalGallons +=
          partials.where((p) => !p.isFillToFull).fold<double>(0.0, (s, p) => s + p.gallons);
    }
    if (totalGallons <= 0) return null;
    return deltaMiles / totalGallons;
  }

  @override
  Stream<List<domain.GasRecord>> watchByVehicle(int vehicleId) =>
      _db.gasRecordsDao
          .watchByVehicle(vehicleId)
          .map((rows) => rows.map(_fromRow).toList());

  @override
  Future<List<domain.GasRecord>> getByVehicle(int vehicleId) async {
    final rows = await _db.gasRecordsDao.getByVehicle(vehicleId);
    return rows.map(_fromRow).toList();
  }

  @override
  Future<domain.GasRecord?> getById(int id) async {
    final row = await _db.gasRecordsDao.getById(id);
    return row == null ? null : _fromRow(row);
  }

  @override
  Future<int> create(domain.GasRecord r) async {
    final mpg = await _calculateMpg(r);
    return _db.gasRecordsDao.insertRecord(
      GasRecordsCompanion.insert(
        vehicleId: r.vehicleId,
        date: r.date,
        mileage: Value(r.mileage),
        gallons: Value(r.gallons),
        cost: Value(r.cost),
        isFillToFull: Value(r.isFillToFull),
        missedFuelUp: Value(r.missedFuelUp),
        mpg: Value(mpg),
        notes: Value(r.notes),
        syncStatus: const Value('pending_create'),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> update(domain.GasRecord r) async {
    final mpg = await _calculateMpg(r);
    await _db.gasRecordsDao.updateRecord(
      GasRecordsCompanion(
        id: Value(r.id),
        vehicleId: Value(r.vehicleId),
        date: Value(r.date),
        mileage: Value(r.mileage),
        gallons: Value(r.gallons),
        cost: Value(r.cost),
        isFillToFull: Value(r.isFillToFull),
        missedFuelUp: Value(r.missedFuelUp),
        mpg: Value(mpg),
        notes: Value(r.notes),
        syncStatus: const Value('pending_update'),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> delete(int id) => _db.gasRecordsDao.deleteRecord(id);
}

@riverpod
LocalGasRecordRepository localGasRecordRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return LocalGasRecordRepository(db);
}
