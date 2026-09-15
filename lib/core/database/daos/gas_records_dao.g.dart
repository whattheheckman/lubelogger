// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gas_records_dao.dart';

// ignore_for_file: type=lint
mixin _$GasRecordsDaoMixin on DatabaseAccessor<AppDatabase> {
  $GasRecordsTable get gasRecords => attachedDatabase.gasRecords;
  GasRecordsDaoManager get managers => GasRecordsDaoManager(this);
}

class GasRecordsDaoManager {
  final _$GasRecordsDaoMixin _db;
  GasRecordsDaoManager(this._db);
  $$GasRecordsTableTableManager get gasRecords =>
      $$GasRecordsTableTableManager(_db.attachedDatabase, _db.gasRecords);
}
