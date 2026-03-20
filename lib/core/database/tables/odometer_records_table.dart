import 'package:drift/drift.dart';

class OdometerRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  IntColumn get vehicleId => integer()();
  DateTimeColumn get date => dateTime()();
  RealColumn get mileage => real().withDefault(const Constant(0.0))();
  RealColumn get initialMileage => real().withDefault(const Constant(0.0))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
}
