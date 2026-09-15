import 'package:drift/drift.dart';
import 'package:lubelogger/core/database/app_database.dart';
import 'package:lubelogger/core/database/tables/sync_queue_table.dart';

part 'sync_queue_dao.g.dart';

@DriftAccessor(tables: [SyncQueue])
class SyncQueueDao extends DatabaseAccessor<AppDatabase> with _$SyncQueueDaoMixin {
  SyncQueueDao(super.db);

  Stream<List<SyncQueueData>> watchPending() =>
      (select(syncQueue)..where((t) => t.status.equals('pending'))).watch();

  Future<List<SyncQueueData>> getPending() =>
      (select(syncQueue)..where((t) => t.status.equals('pending') & t.nextRetryAt.isSmallerThanValue(DateTime.now()))).get();

  Future<int> enqueue(SyncQueueCompanion entry) =>
      into(syncQueue).insert(entry);

  Future<void> markProcessing(int id) =>
      (update(syncQueue)..where((t) => t.id.equals(id))).write(
        const SyncQueueCompanion(status: Value('processing')),
      );

  Future<void> markDone(int id) =>
      (delete(syncQueue)..where((t) => t.id.equals(id))).go();

  Future<void> markFailed(int id, int retryCount, DateTime nextRetry) =>
      (update(syncQueue)..where((t) => t.id.equals(id))).write(
        SyncQueueCompanion(
          status: const Value('pending'),
          retryCount: Value(retryCount),
          nextRetryAt: Value(nextRetry),
        ),
      );

  Future<void> markPermanentlyFailed(int id) =>
      (update(syncQueue)..where((t) => t.id.equals(id))).write(
        const SyncQueueCompanion(status: Value('failed')),
      );
}
