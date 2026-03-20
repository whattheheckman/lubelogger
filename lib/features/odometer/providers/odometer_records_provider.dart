import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/local_odometer_record_repository.dart';
import '../domain/odometer_record.dart';

part 'odometer_records_provider.g.dart';

@riverpod
Stream<List<OdometerRecord>> odometerRecordList(
    OdometerRecordListRef ref, int vehicleId) {
  final repo = ref.watch(localOdometerRecordRepositoryProvider);
  return repo.watchByVehicle(vehicleId);
}

@riverpod
class OdometerRecordsNotifier extends _$OdometerRecordsNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> save(OdometerRecord record) async {
    final repo = ref.read(localOdometerRecordRepositoryProvider);
    if (record.id == 0) {
      await repo.create(record);
    } else {
      await repo.update(record);
    }
  }

  Future<void> delete(int id) async {
    final repo = ref.read(localOdometerRecordRepositoryProvider);
    await repo.delete(id);
  }
}
