import 'package:drift/drift.dart';

class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  IntColumn get vehicleId => integer()();
  TextColumn get title => text()();
  TextColumn get body => text().withDefault(const Constant(''))(); // Markdown
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
}
