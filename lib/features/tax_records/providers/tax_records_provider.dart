import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:lubelogger/features/tax_records/data/local_tax_record_repository.dart';
import 'package:lubelogger/features/tax_records/domain/tax_record.dart';

part 'tax_records_provider.g.dart';

@riverpod
Stream<List<TaxRecord>> taxRecordList(Ref ref, int vehicleId) {
  final repo = ref.watch(localTaxRecordRepositoryProvider);
  return repo.watchByVehicle(vehicleId);
}

@riverpod
class TaxRecordsNotifier extends _$TaxRecordsNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> save(TaxRecord record) async {
    final repo = ref.read(localTaxRecordRepositoryProvider);
    if (record.id == 0) {
      await repo.create(record);
    } else {
      await repo.update(record);
    }
  }

  Future<void> delete(int id) async {
    final repo = ref.read(localTaxRecordRepositoryProvider);
    await repo.delete(id);
  }
}
