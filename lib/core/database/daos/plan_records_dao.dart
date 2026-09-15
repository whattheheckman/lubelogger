import 'package:drift/drift.dart';
import 'package:lubelogger/core/database/app_database.dart';
import 'package:lubelogger/core/database/tables/plan_records_table.dart';

part 'plan_records_dao.g.dart';

@DriftAccessor(tables: [PlanRecords])
class PlanRecordsDao extends DatabaseAccessor<AppDatabase> with _$PlanRecordsDaoMixin {
  PlanRecordsDao(super.db);

  Stream<List<PlanRecord>> watchByVehicle(int vehicleId) =>
      (select(planRecords)..where((t) => t.vehicleId.equals(vehicleId))).watch();

  Future<List<PlanRecord>> getByVehicle(int vehicleId) =>
      (select(planRecords)..where((t) => t.vehicleId.equals(vehicleId))).get();

  Future<int> insertRecord(PlanRecordsCompanion r) =>
      into(planRecords).insert(r);

  Future<bool> updateRecord(PlanRecordsCompanion r) =>
      update(planRecords).replace(r);

  Future<int> deleteRecord(int id) =>
      (delete(planRecords)..where((t) => t.id.equals(id))).go();

  Future<List<PlanRecord>> getPending() =>
      (select(planRecords)..where((t) => t.syncStatus.isIn(['pending_create', 'pending_update', 'pending_delete']))).get();
}
