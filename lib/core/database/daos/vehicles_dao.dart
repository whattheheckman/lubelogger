import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/vehicles_table.dart';

part 'vehicles_dao.g.dart';

@DriftAccessor(tables: [Vehicles])
class VehiclesDao extends DatabaseAccessor<AppDatabase> with _$VehiclesDaoMixin {
  VehiclesDao(super.db);

  Stream<List<Vehicle>> watchAll() => select(vehicles).watch();

  Future<List<Vehicle>> getAll() => select(vehicles).get();

  Future<Vehicle?> getById(int id) =>
      (select(vehicles)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertVehicle(VehiclesCompanion v) =>
      into(vehicles).insert(v);

  Future<bool> updateVehicle(VehiclesCompanion v) =>
      update(vehicles).replace(v);

  Future<int> deleteVehicle(int id) =>
      (delete(vehicles)..where((t) => t.id.equals(id))).go();

  Future<List<Vehicle>> getPending() =>
      (select(vehicles)..where((t) => t.syncStatus.isIn(['pending_create', 'pending_update', 'pending_delete']))).get();

  Future<void> markSynced(int id, int remoteId) =>
      (update(vehicles)..where((t) => t.id.equals(id))).write(
        VehiclesCompanion(
          remoteId: Value(remoteId),
          syncStatus: const Value('synced'),
          updatedAt: Value(DateTime.now()),
        ),
      );
}
