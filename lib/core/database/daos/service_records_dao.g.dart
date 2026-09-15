// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_records_dao.dart';

// ignore_for_file: type=lint
mixin _$ServiceRecordsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ServiceRecordsTable get serviceRecords => attachedDatabase.serviceRecords;
  ServiceRecordsDaoManager get managers => ServiceRecordsDaoManager(this);
}

class ServiceRecordsDaoManager {
  final _$ServiceRecordsDaoMixin _db;
  ServiceRecordsDaoManager(this._db);
  $$ServiceRecordsTableTableManager get serviceRecords =>
      $$ServiceRecordsTableTableManager(
        _db.attachedDatabase,
        _db.serviceRecords,
      );
}
