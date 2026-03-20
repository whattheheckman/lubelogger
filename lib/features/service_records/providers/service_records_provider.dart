import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/local_service_record_repository.dart';
import '../domain/service_record.dart';

part 'service_records_provider.g.dart';

@riverpod
Stream<List<ServiceRecord>> serviceRecordList(
    ServiceRecordListRef ref, int vehicleId) {
  final repo = ref.watch(localServiceRecordRepositoryProvider);
  return repo.watchByVehicle(vehicleId);
}

@riverpod
class ServiceRecordsNotifier extends _$ServiceRecordsNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> add(ServiceRecord record) async {
    final repo = ref.read(localServiceRecordRepositoryProvider);
    await repo.create(record);
  }

  Future<void> save(ServiceRecord record) async {
    final repo = ref.read(localServiceRecordRepositoryProvider);
    if (record.id == 0) {
      await repo.create(record);
    } else {
      await repo.update(record);
    }
  }

  Future<void> delete(int id) async {
    final repo = ref.read(localServiceRecordRepositoryProvider);
    await repo.delete(id);
  }
}
