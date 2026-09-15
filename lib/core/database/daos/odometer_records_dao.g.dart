// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odometer_records_dao.dart';

// ignore_for_file: type=lint
mixin _$OdometerRecordsDaoMixin on DatabaseAccessor<AppDatabase> {
  $OdometerRecordsTable get odometerRecords => attachedDatabase.odometerRecords;
  OdometerRecordsDaoManager get managers => OdometerRecordsDaoManager(this);
}

class OdometerRecordsDaoManager {
  final _$OdometerRecordsDaoMixin _db;
  OdometerRecordsDaoManager(this._db);
  $$OdometerRecordsTableTableManager get odometerRecords =>
      $$OdometerRecordsTableTableManager(
        _db.attachedDatabase,
        _db.odometerRecords,
      );
}
