import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/local_gas_record_repository.dart';
import '../domain/gas_record.dart';

part 'gas_records_provider.g.dart';

@riverpod
Stream<List<GasRecord>> gasRecordList(GasRecordListRef ref, int vehicleId) {
  final repo = ref.watch(localGasRecordRepositoryProvider);
  return repo.watchByVehicle(vehicleId);
}

@riverpod
class GasRecordsNotifier extends _$GasRecordsNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> save(GasRecord record) async {
    final repo = ref.read(localGasRecordRepositoryProvider);
    if (record.id == 0) {
      await repo.create(record);
    } else {
      await repo.update(record);
    }
  }

  Future<void> delete(int id) async {
    final repo = ref.read(localGasRecordRepositoryProvider);
    await repo.delete(id);
  }
}
