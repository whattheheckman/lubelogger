import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:lubelogger/features/upgrade_records/data/local_upgrade_record_repository.dart';
import 'package:lubelogger/features/upgrade_records/domain/upgrade_record.dart';

part 'upgrade_records_provider.g.dart';

@riverpod
Stream<List<UpgradeRecord>> upgradeRecordList(
    Ref ref, int vehicleId) {
  final repo = ref.watch(localUpgradeRecordRepositoryProvider);
  return repo.watchByVehicle(vehicleId);
}

@riverpod
class UpgradeRecordsNotifier extends _$UpgradeRecordsNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> save(UpgradeRecord record) async {
    final repo = ref.read(localUpgradeRecordRepositoryProvider);
    if (record.id == 0) {
      await repo.create(record);
    } else {
      await repo.update(record);
    }
  }

  Future<void> delete(int id) async {
    final repo = ref.read(localUpgradeRecordRepositoryProvider);
    await repo.delete(id);
  }
}
