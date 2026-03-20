import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/tax_records_table.dart';

part 'tax_records_dao.g.dart';

@DriftAccessor(tables: [TaxRecords])
class TaxRecordsDao extends DatabaseAccessor<AppDatabase> with _$TaxRecordsDaoMixin {
  TaxRecordsDao(super.db);

  Stream<List<TaxRecord>> watchByVehicle(int vehicleId) =>
      (select(taxRecords)
        ..where((t) => t.vehicleId.equals(vehicleId))
        ..orderBy([(t) => OrderingTerm.desc(t.date)]))
          .watch();

  Future<List<TaxRecord>> getByVehicle(int vehicleId) =>
      (select(taxRecords)..where((t) => t.vehicleId.equals(vehicleId))).get();

  Future<int> insertRecord(TaxRecordsCompanion r) =>
      into(taxRecords).insert(r);

  Future<bool> updateRecord(TaxRecordsCompanion r) =>
      update(taxRecords).replace(r);

  Future<int> deleteRecord(int id) =>
      (delete(taxRecords)..where((t) => t.id.equals(id))).go();

  Future<List<TaxRecord>> getPending() =>
      (select(taxRecords)..where((t) => t.syncStatus.isIn(['pending_create', 'pending_update', 'pending_delete']))).get();
}
