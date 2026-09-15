import 'package:drift/drift.dart';
import 'package:lubelogger/core/database/app_database.dart';
import 'package:lubelogger/core/database/tables/upgrade_records_table.dart';

part 'upgrade_records_dao.g.dart';

@DriftAccessor(tables: [UpgradeRecords])
class UpgradeRecordsDao extends DatabaseAccessor<AppDatabase> with _$UpgradeRecordsDaoMixin {
  UpgradeRecordsDao(super.db);

  Stream<List<UpgradeRecord>> watchByVehicle(int vehicleId) =>
      (select(upgradeRecords)
        ..where((t) => t.vehicleId.equals(vehicleId))
        ..orderBy([(t) => OrderingTerm.desc(t.date)]))
          .watch();

  Future<List<UpgradeRecord>> getByVehicle(int vehicleId) =>
      (select(upgradeRecords)..where((t) => t.vehicleId.equals(vehicleId))).get();

  Future<UpgradeRecord?> getById(int id) =>
      (select(upgradeRecords)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertRecord(UpgradeRecordsCompanion r) =>
      into(upgradeRecords).insert(r);

  Future<bool> updateRecord(UpgradeRecordsCompanion r) =>
      update(upgradeRecords).replace(r);

  Future<int> deleteRecord(int id) =>
      (delete(upgradeRecords)..where((t) => t.id.equals(id))).go();

  Future<List<UpgradeRecord>> getPending() =>
      (select(upgradeRecords)..where((t) => t.syncStatus.isIn(['pending_create', 'pending_update', 'pending_delete']))).get();
}
