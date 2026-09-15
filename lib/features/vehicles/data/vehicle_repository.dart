import 'package:lubelogger/features/vehicles/domain/vehicle.dart';

abstract interface class VehicleRepository {
  Stream<List<Vehicle>> watchAll();
  Future<List<Vehicle>> getAll();
  Future<Vehicle?> getById(int id);
  Future<int> create(Vehicle vehicle);
  Future<void> update(Vehicle vehicle);
  Future<void> delete(int id);
}
