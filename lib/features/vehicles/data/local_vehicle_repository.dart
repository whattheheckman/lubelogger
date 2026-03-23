import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../domain/vehicle.dart' as domain;
import 'vehicle_repository.dart';

part 'local_vehicle_repository.g.dart';

@riverpod
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}

class LocalVehicleRepository implements VehicleRepository {
  LocalVehicleRepository(this._db);
  final AppDatabase _db;

  domain.Vehicle _fromRow(Vehicle row) => domain.Vehicle(
        id: row.id,
        remoteId: row.remoteId,
        year: row.year,
        make: row.make,
        model: row.model,
        licensePlate: row.licensePlate,
        imagePath: row.imagePath,
        isElectric: row.isElectric,
        isDiesel: row.isDiesel,
        useHours: row.useHours,
        tags: List<String>.from(jsonDecode(row.tags) as List),
        extraFields: Map<String, dynamic>.from(jsonDecode(row.extraFields) as Map),
        updatedAt: row.updatedAt,
        syncStatus: row.syncStatus,
      );

  @override
  Stream<List<domain.Vehicle>> watchAll() =>
      _db.vehiclesDao.watchAll().map((rows) => rows.map(_fromRow).toList());

  @override
  Future<List<domain.Vehicle>> getAll() async {
    final rows = await _db.vehiclesDao.getAll();
    return rows.map(_fromRow).toList();
  }

  @override
  Future<domain.Vehicle?> getById(int id) async {
    final row = await _db.vehiclesDao.getById(id);
    return row == null ? null : _fromRow(row);
  }

  @override
  Future<int> create(domain.Vehicle v) {
    return _db.vehiclesDao.insertVehicle(
      VehiclesCompanion.insert(
        year: v.year,
        make: v.make,
        model: v.model,
        licensePlate: Value(v.licensePlate),
        imagePath: Value(v.imagePath),
        isElectric: Value(v.isElectric),
        isDiesel: Value(v.isDiesel),
        useHours: Value(v.useHours),
        tags: Value(jsonEncode(v.tags)),
        extraFields: Value(jsonEncode(v.extraFields)),
        syncStatus: const Value('pending_create'),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> update(domain.Vehicle v) async {
    await _db.vehiclesDao.updateVehicle(
      VehiclesCompanion(
        id: Value(v.id),
        year: Value(v.year),
        make: Value(v.make),
        model: Value(v.model),
        licensePlate: Value(v.licensePlate),
        imagePath: Value(v.imagePath),
        isElectric: Value(v.isElectric),
        isDiesel: Value(v.isDiesel),
        useHours: Value(v.useHours),
        tags: Value(jsonEncode(v.tags)),
        extraFields: Value(jsonEncode(v.extraFields)),
        syncStatus: const Value('pending_update'),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> delete(int id) => _db.vehiclesDao.deleteVehicle(id);
}

@riverpod
LocalVehicleRepository localVehicleRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return LocalVehicleRepository(db);
}
