import '../domain/gas_record.dart';

abstract interface class GasRecordRepository {
  Stream<List<GasRecord>> watchByVehicle(int vehicleId);
  Future<List<GasRecord>> getByVehicle(int vehicleId);
  Future<GasRecord?> getById(int id);
  Future<int> create(GasRecord record);
  Future<void> update(GasRecord record);
  Future<void> delete(int id);
}
