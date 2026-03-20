import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/supply_records_table.dart';

part 'supply_records_dao.g.dart';

@DriftAccessor(tables: [SupplyRecords])
class SupplyRecordsDao extends DatabaseAccessor<AppDatabase> with _$SupplyRecordsDaoMixin {
  SupplyRecordsDao(super.db);

  Stream<List<SupplyRecord>> watchByVehicle(int vehicleId) =>
      (select(supplyRecords)..where((t) => t.vehicleId.equals(vehicleId))).watch();

  Future<List<SupplyRecord>> getByVehicle(int vehicleId) =>
      (select(supplyRecords)..where((t) => t.vehicleId.equals(vehicleId))).get();

  Future<int> insertRecord(SupplyRecordsCompanion r) =>
      into(supplyRecords).insert(r);

  Future<bool> updateRecord(SupplyRecordsCompanion r) =>
      update(supplyRecords).replace(r);

  Future<int> deleteRecord(int id) =>
      (delete(supplyRecords)..where((t) => t.id.equals(id))).go();

  Future<List<SupplyRecord>> getPending() =>
      (select(supplyRecords)..where((t) => t.syncStatus.isIn(['pending_create', 'pending_update', 'pending_delete']))).get();
}
