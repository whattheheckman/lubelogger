import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:lubelogger/features/planner/data/local_plan_record_repository.dart';
import 'package:lubelogger/features/planner/domain/plan_record.dart';

part 'plan_records_provider.g.dart';

@riverpod
Stream<List<PlanRecord>> planRecordList(PlanRecordListRef ref, int vehicleId) {
  final repo = ref.watch(localPlanRecordRepositoryProvider);
  return repo.watchByVehicle(vehicleId);
}

@riverpod
class PlanRecordsNotifier extends _$PlanRecordsNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> create(PlanRecord record) async {
    final repo = ref.read(localPlanRecordRepositoryProvider);
    await repo.create(record);
  }

  Future<void> updateProgress(PlanRecord record, String newProgress) async {
    final repo = ref.read(localPlanRecordRepositoryProvider);
    await repo.update(record.copyWith(progress: newProgress));
  }

  Future<void> delete(int id) async {
    final repo = ref.read(localPlanRecordRepositoryProvider);
    await repo.delete(id);
  }
}
