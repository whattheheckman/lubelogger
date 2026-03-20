import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/local_vehicle_repository.dart';
import '../domain/vehicle.dart';

part 'vehicles_provider.g.dart';

@riverpod
Stream<List<Vehicle>> vehicleList(VehicleListRef ref) {
  final repo = ref.watch(localVehicleRepositoryProvider);
  return repo.watchAll();
}

@riverpod
class VehiclesNotifier extends _$VehiclesNotifier {
  @override
  FutureOr<void> build() {}

  Future<int> addVehicle(Vehicle vehicle) async {
    final repo = ref.read(localVehicleRepositoryProvider);
    return repo.create(vehicle);
  }

  Future<void> updateVehicle(Vehicle vehicle) async {
    final repo = ref.read(localVehicleRepositoryProvider);
    await repo.update(vehicle);
  }

  Future<void> deleteVehicle(int id) async {
    final repo = ref.read(localVehicleRepositoryProvider);
    await repo.delete(id);
  }
}
