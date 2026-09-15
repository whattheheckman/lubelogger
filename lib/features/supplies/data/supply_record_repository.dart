import 'package:lubelogger/features/supplies/domain/supply_record.dart';

abstract interface class SupplyRecordRepository {
  Stream<List<SupplyRecord>> watchByVehicle(int vehicleId);
  Future<List<SupplyRecord>> getByVehicle(int vehicleId);
  Future<SupplyRecord?> getById(int id);
  Future<int> create(SupplyRecord record);
  Future<void> update(SupplyRecord record);
  Future<void> delete(int id);
}
