import 'package:drift/drift.dart';

class TaxRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  IntColumn get vehicleId => integer()();
  DateTimeColumn get date => dateTime()();
  TextColumn get description => text()();
  RealColumn get cost => real().withDefault(const Constant(0.0))();
  BoolColumn get isRecurring => boolean().withDefault(const Constant(false))();
  TextColumn get recurringInterval => text().withDefault(const Constant(''))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
}
