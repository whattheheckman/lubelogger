import 'package:drift/drift.dart';
import 'package:lubelogger/core/database/app_database.dart';
import 'package:lubelogger/core/database/tables/repair_records_table.dart';

part 'repair_records_dao.g.dart';

@DriftAccessor(tables: [RepairRecords])
class RepairRecordsDao extends DatabaseAccessor<AppDatabase> with _$RepairRecordsDaoMixin {
  RepairRecordsDao(super.db);

  Stream<List<RepairRecord>> watchByVehicle(int vehicleId) =>
      (select(repairRecords)
        ..where((t) => t.vehicleId.equals(vehicleId))
        ..orderBy([(t) => OrderingTerm.desc(t.date)]))
          .watch();

  Future<List<RepairRecord>> getByVehicle(int vehicleId) =>
      (select(repairRecords)..where((t) => t.vehicleId.equals(vehicleId))).get();

  Future<RepairRecord?> getById(int id) =>
      (select(repairRecords)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertRecord(RepairRecordsCompanion r) =>
      into(repairRecords).insert(r);

  Future<bool> updateRecord(RepairRecordsCompanion r) =>
      update(repairRecords).replace(r);

  Future<int> deleteRecord(int id) =>
      (delete(repairRecords)..where((t) => t.id.equals(id))).go();

  Future<List<RepairRecord>> getPending() =>
      (select(repairRecords)..where((t) => t.syncStatus.isIn(['pending_create', 'pending_update', 'pending_delete']))).get();
}
