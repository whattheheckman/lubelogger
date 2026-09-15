import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:lubelogger/features/repair_records/data/local_repair_record_repository.dart';
import 'package:lubelogger/features/repair_records/domain/repair_record.dart';

part 'repair_records_provider.g.dart';

@riverpod
Stream<List<RepairRecord>> repairRecordList(
    Ref ref, int vehicleId) {
  final repo = ref.watch(localRepairRecordRepositoryProvider);
  return repo.watchByVehicle(vehicleId);
}

@riverpod
class RepairRecordsNotifier extends _$RepairRecordsNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> save(RepairRecord record) async {
    final repo = ref.read(localRepairRecordRepositoryProvider);
    if (record.id == 0) {
      await repo.create(record);
    } else {
      await repo.update(record);
    }
  }

  Future<void> delete(int id) async {
    final repo = ref.read(localRepairRecordRepositoryProvider);
    await repo.delete(id);
  }
}
