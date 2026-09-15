// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_records_dao.dart';

// ignore_for_file: type=lint
mixin _$PlanRecordsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PlanRecordsTable get planRecords => attachedDatabase.planRecords;
  PlanRecordsDaoManager get managers => PlanRecordsDaoManager(this);
}

class PlanRecordsDaoManager {
  final _$PlanRecordsDaoMixin _db;
  PlanRecordsDaoManager(this._db);
  $$PlanRecordsTableTableManager get planRecords =>
      $$PlanRecordsTableTableManager(_db.attachedDatabase, _db.planRecords);
}
