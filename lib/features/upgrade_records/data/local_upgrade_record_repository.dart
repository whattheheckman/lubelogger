import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../../../features/vehicles/data/local_vehicle_repository.dart';
import '../domain/upgrade_record.dart' as domain;
import 'upgrade_record_repository.dart';

part 'local_upgrade_record_repository.g.dart';

class LocalUpgradeRecordRepository implements UpgradeRecordRepository {
  LocalUpgradeRecordRepository(this._db);
  final AppDatabase _db;

  domain.UpgradeRecord _fromRow(UpgradeRecord row) => domain.UpgradeRecord(
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
  Stream<List<domain.UpgradeRecord>> watchByVehicle(int vehicleId) =>
      _db.upgradeRecordsDao
          .watchByVehicle(vehicleId)
          .map((rows) => rows.map(_fromRow).toList());

  @override
  Future<List<domain.UpgradeRecord>> getByVehicle(int vehicleId) async {
    final rows = await _db.upgradeRecordsDao.getByVehicle(vehicleId);
    return rows.map(_fromRow).toList();
  }

  @override
  Future<domain.UpgradeRecord?> getById(int id) async {
    final row = await _db.upgradeRecordsDao.getById(id);
    return row == null ? null : _fromRow(row);
  }

  @override
  Future<int> create(domain.UpgradeRecord r) =>
      _db.upgradeRecordsDao.insertRecord(
        UpgradeRecordsCompanion.insert(
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
  Future<void> update(domain.UpgradeRecord r) async {
    await _db.upgradeRecordsDao.updateRecord(
      UpgradeRecordsCompanion(
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
  Future<void> delete(int id) => _db.upgradeRecordsDao.deleteRecord(id);
}

@riverpod
LocalUpgradeRecordRepository localUpgradeRecordRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return LocalUpgradeRecordRepository(db);
}
