import 'package:drift/drift.dart';
import 'package:lubelogger/core/database/app_database.dart';
import 'package:lubelogger/core/database/tables/gas_records_table.dart';

part 'gas_records_dao.g.dart';

@DriftAccessor(tables: [GasRecords])
class GasRecordsDao extends DatabaseAccessor<AppDatabase> with _$GasRecordsDaoMixin {
  GasRecordsDao(super.db);

  Stream<List<GasRecord>> watchByVehicle(int vehicleId) =>
      (select(gasRecords)
        ..where((t) => t.vehicleId.equals(vehicleId))
        ..orderBy([(t) => OrderingTerm.desc(t.date)]))
          .watch();

  Future<List<GasRecord>> getByVehicle(int vehicleId) =>
      (select(gasRecords)..where((t) => t.vehicleId.equals(vehicleId))).get();

  Future<GasRecord?> getById(int id) =>
      (select(gasRecords)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// Get the most recent fill-to-full record before [mileage] for MPG calc.
  Future<GasRecord?> getPreviousFillToFull(int vehicleId, double mileage) =>
      (select(gasRecords)
        ..where((t) => t.vehicleId.equals(vehicleId) & t.isFillToFull.equals(true) & t.mileage.isSmallerThan(Variable(mileage)))
        ..orderBy([(t) => OrderingTerm.desc(t.mileage)])
        ..limit(1))
          .getSingleOrNull();

  Future<int> insertRecord(GasRecordsCompanion r) =>
      into(gasRecords).insert(r);

  Future<bool> updateRecord(GasRecordsCompanion r) =>
      update(gasRecords).replace(r);

  Future<int> deleteRecord(int id) =>
      (delete(gasRecords)..where((t) => t.id.equals(id))).go();

  Future<List<GasRecord>> getPending() =>
      (select(gasRecords)..where((t) => t.syncStatus.isIn(['pending_create', 'pending_update', 'pending_delete']))).get();
}
