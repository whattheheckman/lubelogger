import '../domain/tax_record.dart';

abstract interface class TaxRecordRepository {
  Stream<List<TaxRecord>> watchByVehicle(int vehicleId);
  Future<List<TaxRecord>> getByVehicle(int vehicleId);
  Future<TaxRecord?> getById(int id);
  Future<int> create(TaxRecord record);
  Future<void> update(TaxRecord record);
  Future<void> delete(int id);
}
