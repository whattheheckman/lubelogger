// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_records_dao.dart';

// ignore_for_file: type=lint
mixin _$UpgradeRecordsDaoMixin on DatabaseAccessor<AppDatabase> {
  $UpgradeRecordsTable get upgradeRecords => attachedDatabase.upgradeRecords;
  UpgradeRecordsDaoManager get managers => UpgradeRecordsDaoManager(this);
}

class UpgradeRecordsDaoManager {
  final _$UpgradeRecordsDaoMixin _db;
  UpgradeRecordsDaoManager(this._db);
  $$UpgradeRecordsTableTableManager get upgradeRecords =>
      $$UpgradeRecordsTableTableManager(
        _db.attachedDatabase,
        _db.upgradeRecords,
      );
}
