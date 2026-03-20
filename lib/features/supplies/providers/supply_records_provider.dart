import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/local_supply_record_repository.dart';
import '../domain/supply_record.dart';

part 'supply_records_provider.g.dart';

@riverpod
Stream<List<SupplyRecord>> supplyRecordList(
    SupplyRecordListRef ref, int vehicleId) {
  final repo = ref.watch(localSupplyRecordRepositoryProvider);
  return repo.watchByVehicle(vehicleId);
}

@riverpod
class SupplyRecordsNotifier extends _$SupplyRecordsNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> save(SupplyRecord record) async {
    final repo = ref.read(localSupplyRecordRepositoryProvider);
    if (record.id == 0) {
      await repo.create(record);
    } else {
      await repo.update(record);
    }
  }

  Future<void> delete(int id) async {
    final repo = ref.read(localSupplyRecordRepositoryProvider);
    await repo.delete(id);
  }
}
