import 'package:drift/drift.dart';
import 'package:lubelogger/core/database/app_database.dart';
import 'package:lubelogger/core/database/tables/odometer_records_table.dart';

part 'odometer_records_dao.g.dart';

@DriftAccessor(tables: [OdometerRecords])
class OdometerRecordsDao extends DatabaseAccessor<AppDatabase> with _$OdometerRecordsDaoMixin {
  OdometerRecordsDao(super.db);

  Stream<List<OdometerRecord>> watchByVehicle(int vehicleId) =>
      (select(odometerRecords)
        ..where((t) => t.vehicleId.equals(vehicleId))
        ..orderBy([(t) => OrderingTerm.desc(t.date)]))
          .watch();

  Future<List<OdometerRecord>> getByVehicle(int vehicleId) =>
      (select(odometerRecords)..where((t) => t.vehicleId.equals(vehicleId))).get();

  Future<OdometerRecord?> getLatest(int vehicleId) =>
      (select(odometerRecords)
        ..where((t) => t.vehicleId.equals(vehicleId))
        ..orderBy([(t) => OrderingTerm.desc(t.mileage)])
        ..limit(1))
          .getSingleOrNull();

  Future<OdometerRecord?> getById(int id) =>
      (select(odometerRecords)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertRecord(OdometerRecordsCompanion r) =>
      into(odometerRecords).insert(r);

  Future<bool> updateRecord(OdometerRecordsCompanion r) =>
      update(odometerRecords).replace(r);

  Future<int> deleteRecord(int id) =>
      (delete(odometerRecords)..where((t) => t.id.equals(id))).go();

  Future<List<OdometerRecord>> getPending() =>
      (select(odometerRecords)..where((t) => t.syncStatus.isIn(['pending_create', 'pending_update', 'pending_delete']))).get();
}
