import 'package:lubelogger/features/service_records/domain/service_record.dart';

abstract interface class ServiceRecordRepository {
  Stream<List<ServiceRecord>> watchByVehicle(int vehicleId);
  Future<List<ServiceRecord>> getByVehicle(int vehicleId);
  Future<ServiceRecord?> getById(int id);
  Future<int> create(ServiceRecord record);
  Future<void> update(ServiceRecord record);
  Future<void> delete(int id);
}
