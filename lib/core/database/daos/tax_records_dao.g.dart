// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_records_dao.dart';

// ignore_for_file: type=lint
mixin _$TaxRecordsDaoMixin on DatabaseAccessor<AppDatabase> {
  $TaxRecordsTable get taxRecords => attachedDatabase.taxRecords;
  TaxRecordsDaoManager get managers => TaxRecordsDaoManager(this);
}

class TaxRecordsDaoManager {
  final _$TaxRecordsDaoMixin _db;
  TaxRecordsDaoManager(this._db);
  $$TaxRecordsTableTableManager get taxRecords =>
      $$TaxRecordsTableTableManager(_db.attachedDatabase, _db.taxRecords);
}
