import 'package:drift/drift.dart';

class ReminderRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  IntColumn get vehicleId => integer()();
  TextColumn get description => text()();
  TextColumn get reminderMetric => text().withDefault(const Constant('both'))(); // date, mileage, both
  DateTimeColumn get dateMetric => dateTime().nullable()();
  RealColumn get mileageMetric => real().nullable()();
  BoolColumn get isRecurring => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
}
