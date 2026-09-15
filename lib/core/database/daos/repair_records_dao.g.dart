// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_records_dao.dart';

// ignore_for_file: type=lint
mixin _$RepairRecordsDaoMixin on DatabaseAccessor<AppDatabase> {
  $RepairRecordsTable get repairRecords => attachedDatabase.repairRecords;
  RepairRecordsDaoManager get managers => RepairRecordsDaoManager(this);
}

class RepairRecordsDaoManager {
  final _$RepairRecordsDaoMixin _db;
  RepairRecordsDaoManager(this._db);
  $$RepairRecordsTableTableManager get repairRecords =>
      $$RepairRecordsTableTableManager(_db.attachedDatabase, _db.repairRecords);
}
