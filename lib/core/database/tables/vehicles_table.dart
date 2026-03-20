import 'package:drift/drift.dart';

class Vehicles extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  TextColumn get year => text()();
  TextColumn get make => text()();
  TextColumn get model => text()();
  TextColumn get licensePlate => text().withDefault(const Constant(''))();
  BoolColumn get isElectric => boolean().withDefault(const Constant(false))();
  BoolColumn get isDiesel => boolean().withDefault(const Constant(false))();
  BoolColumn get useHours => boolean().withDefault(const Constant(false))();
  TextColumn get tags => text().withDefault(const Constant('[]'))(); // JSON array
  TextColumn get extraFields => text().withDefault(const Constant('{}'))(); // JSON object
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))(); // pending_create, pending_update, pending_delete, synced, sync_failed
}
