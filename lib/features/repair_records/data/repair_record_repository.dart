import 'package:lubelogger/features/repair_records/domain/repair_record.dart';

abstract interface class RepairRecordRepository {
  Stream<List<RepairRecord>> watchByVehicle(int vehicleId);
  Future<List<RepairRecord>> getByVehicle(int vehicleId);
  Future<RepairRecord?> getById(int id);
  Future<int> create(RepairRecord record);
  Future<void> update(RepairRecord record);
  Future<void> delete(int id);
}
