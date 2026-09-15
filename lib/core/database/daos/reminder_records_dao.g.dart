// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_records_dao.dart';

// ignore_for_file: type=lint
mixin _$ReminderRecordsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ReminderRecordsTable get reminderRecords => attachedDatabase.reminderRecords;
  ReminderRecordsDaoManager get managers => ReminderRecordsDaoManager(this);
}

class ReminderRecordsDaoManager {
  final _$ReminderRecordsDaoMixin _db;
  ReminderRecordsDaoManager(this._db);
  $$ReminderRecordsTableTableManager get reminderRecords =>
      $$ReminderRecordsTableTableManager(
        _db.attachedDatabase,
        _db.reminderRecords,
      );
}
