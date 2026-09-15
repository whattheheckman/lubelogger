import 'package:lubelogger/features/odometer/domain/odometer_record.dart';

abstract interface class OdometerRecordRepository {
  Stream<List<OdometerRecord>> watchByVehicle(int vehicleId);
  Future<List<OdometerRecord>> getByVehicle(int vehicleId);
  Future<OdometerRecord?> getById(int id);
  Future<int> create(OdometerRecord record);
  Future<void> update(OdometerRecord record);
  Future<void> delete(int id);
}
