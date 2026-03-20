import 'package:drift/drift.dart';

class GasRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  IntColumn get vehicleId => integer()();
  DateTimeColumn get date => dateTime()();
  RealColumn get mileage => real().withDefault(const Constant(0.0))();
  RealColumn get gallons => real().withDefault(const Constant(0.0))();
  RealColumn get cost => real().withDefault(const Constant(0.0))();
  BoolColumn get isFillToFull => boolean().withDefault(const Constant(true))();
  BoolColumn get missedFuelUp => boolean().withDefault(const Constant(false))();
  RealColumn get mpg => real().nullable()(); // Calculated and cached
  TextColumn get notes => text().withDefault(const Constant(''))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
}
