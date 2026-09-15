import 'package:lubelogger/features/planner/domain/plan_record.dart';

abstract interface class PlanRecordRepository {
  Stream<List<PlanRecord>> watchByVehicle(int vehicleId);
  Future<List<PlanRecord>> getByVehicle(int vehicleId);
  Future<PlanRecord?> getById(int id);
  Future<int> create(PlanRecord record);
  Future<void> update(PlanRecord record);
  Future<void> delete(int id);
}
