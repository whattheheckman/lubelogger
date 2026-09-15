import 'package:drift/drift.dart';
import 'package:lubelogger/core/database/app_database.dart';
import 'package:lubelogger/core/database/tables/service_records_table.dart';

part 'service_records_dao.g.dart';

@DriftAccessor(tables: [ServiceRecords])
class ServiceRecordsDao extends DatabaseAccessor<AppDatabase> with _$ServiceRecordsDaoMixin {
  ServiceRecordsDao(super.db);

  Stream<List<ServiceRecord>> watchByVehicle(int vehicleId) =>
      (select(serviceRecords)
        ..where((t) => t.vehicleId.equals(vehicleId))
        ..orderBy([(t) => OrderingTerm.desc(t.date)]))
          .watch();

  Future<List<ServiceRecord>> getByVehicle(int vehicleId) =>
      (select(serviceRecords)..where((t) => t.vehicleId.equals(vehicleId))).get();

  Future<ServiceRecord?> getById(int id) =>
      (select(serviceRecords)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertRecord(ServiceRecordsCompanion r) =>
      into(serviceRecords).insert(r);

  Future<bool> updateRecord(ServiceRecordsCompanion r) =>
      update(serviceRecords).replace(r);

  Future<int> deleteRecord(int id) =>
      (delete(serviceRecords)..where((t) => t.id.equals(id))).go();

  Future<List<ServiceRecord>> getPending() =>
      (select(serviceRecords)..where((t) => t.syncStatus.isIn(['pending_create', 'pending_update', 'pending_delete']))).get();

  Future<double> getTotalCostByVehicle(int vehicleId) async {
    final rows = await getByVehicle(vehicleId);
    return rows.fold<double>(0.0, (sum, r) => sum + r.cost);
  }
}
