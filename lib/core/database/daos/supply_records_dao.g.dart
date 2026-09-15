// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply_records_dao.dart';

// ignore_for_file: type=lint
mixin _$SupplyRecordsDaoMixin on DatabaseAccessor<AppDatabase> {
  $SupplyRecordsTable get supplyRecords => attachedDatabase.supplyRecords;
  SupplyRecordsDaoManager get managers => SupplyRecordsDaoManager(this);
}

class SupplyRecordsDaoManager {
  final _$SupplyRecordsDaoMixin _db;
  SupplyRecordsDaoManager(this._db);
  $$SupplyRecordsTableTableManager get supplyRecords =>
      $$SupplyRecordsTableTableManager(_db.attachedDatabase, _db.supplyRecords);
}
