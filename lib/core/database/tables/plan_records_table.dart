import 'package:drift/drift.dart';

class PlanRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  IntColumn get vehicleId => integer()();
  TextColumn get description => text()();
  TextColumn get priority => text().withDefault(const Constant('normal'))(); // low, normal, high, critical
  TextColumn get progress => text().withDefault(const Constant('Backlog'))(); // Backlog, InProgress, Testing, Done
  TextColumn get notes => text().withDefault(const Constant(''))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
}
