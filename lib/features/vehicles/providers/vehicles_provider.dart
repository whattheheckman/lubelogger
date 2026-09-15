import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:lubelogger/features/vehicles/data/local_vehicle_repository.dart';
import 'package:lubelogger/features/vehicles/domain/vehicle.dart';

part 'vehicles_provider.g.dart';

/// Watches a single vehicle by ID. Only rebuilds when that vehicle changes.
final vehicleByIdProvider = StreamProvider.family<Vehicle?, int>((ref, vehicleId) {
  final repo = ref.watch(localVehicleRepositoryProvider);
  return repo.watchAll().map(
    (list) => list.where((v) => v.id == vehicleId).firstOrNull,
  );
});

@riverpod
Stream<List<Vehicle>> vehicleList(Ref ref) {
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
