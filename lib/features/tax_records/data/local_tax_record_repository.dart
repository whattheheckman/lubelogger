import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../../../features/vehicles/data/local_vehicle_repository.dart';
import '../domain/tax_record.dart' as domain;
import 'tax_record_repository.dart';

part 'local_tax_record_repository.g.dart';

class LocalTaxRecordRepository implements TaxRecordRepository {
  LocalTaxRecordRepository(this._db);
  final AppDatabase _db;

  domain.TaxRecord _fromRow(TaxRecord row) => domain.TaxRecord(
        id: row.id,
        remoteId: row.remoteId,
        vehicleId: row.vehicleId,
        date: row.date,
        description: row.description,
        cost: row.cost,
        isRecurring: row.isRecurring,
        recurringInterval: row.recurringInterval,
        notes: row.notes,
        updatedAt: row.updatedAt,
        syncStatus: row.syncStatus,
      );

  @override
  Stream<List<domain.TaxRecord>> watchByVehicle(int vehicleId) =>
      _db.taxRecordsDao
          .watchByVehicle(vehicleId)
          .map((rows) => rows.map(_fromRow).toList());

  @override
  Future<List<domain.TaxRecord>> getByVehicle(int vehicleId) async {
    final rows = await _db.taxRecordsDao.getByVehicle(vehicleId);
    return rows.map(_fromRow).toList();
  }

  @override
  Future<domain.TaxRecord?> getById(int id) async {
    // TaxRecordsDao has no getById; form screens load from list
    return null;
  }

  @override
  Future<int> create(domain.TaxRecord r) =>
      _db.taxRecordsDao.insertRecord(
        TaxRecordsCompanion.insert(
          vehicleId: r.vehicleId,
          date: r.date,
          description: r.description,
          cost: Value(r.cost),
          isRecurring: Value(r.isRecurring),
          recurringInterval: Value(r.recurringInterval),
          notes: Value(r.notes),
          syncStatus: const Value('pending_create'),
          updatedAt: Value(DateTime.now()),
        ),
      );

  @override
  Future<void> update(domain.TaxRecord r) async {
    await _db.taxRecordsDao.updateRecord(
      TaxRecordsCompanion(
        id: Value(r.id),
        vehicleId: Value(r.vehicleId),
        date: Value(r.date),
        description: Value(r.description),
        cost: Value(r.cost),
        isRecurring: Value(r.isRecurring),
        recurringInterval: Value(r.recurringInterval),
        notes: Value(r.notes),
        syncStatus: const Value('pending_update'),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> delete(int id) => _db.taxRecordsDao.deleteRecord(id);
}

@riverpod
LocalTaxRecordRepository localTaxRecordRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return LocalTaxRecordRepository(db);
}
