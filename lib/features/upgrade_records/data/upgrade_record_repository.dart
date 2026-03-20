import '../domain/upgrade_record.dart';

abstract interface class UpgradeRecordRepository {
  Stream<List<UpgradeRecord>> watchByVehicle(int vehicleId);
  Future<List<UpgradeRecord>> getByVehicle(int vehicleId);
  Future<UpgradeRecord?> getById(int id);
  Future<int> create(UpgradeRecord record);
  Future<void> update(UpgradeRecord record);
  Future<void> delete(int id);
}
