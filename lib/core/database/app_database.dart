import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/vehicles_table.dart';
import 'tables/service_records_table.dart';
import 'tables/repair_records_table.dart';
import 'tables/upgrade_records_table.dart';
import 'tables/gas_records_table.dart';
import 'tables/odometer_records_table.dart';
import 'tables/tax_records_table.dart';
import 'tables/reminder_records_table.dart';
import 'tables/plan_records_table.dart';
import 'tables/supply_records_table.dart';
import 'tables/notes_table.dart';
import 'tables/sync_queue_table.dart';

import 'daos/vehicles_dao.dart';
import 'daos/service_records_dao.dart';
import 'daos/repair_records_dao.dart';
import 'daos/upgrade_records_dao.dart';
import 'daos/gas_records_dao.dart';
import 'daos/odometer_records_dao.dart';
import 'daos/tax_records_dao.dart';
import 'daos/reminder_records_dao.dart';
import 'daos/plan_records_dao.dart';
import 'daos/supply_records_dao.dart';
import 'daos/notes_dao.dart';
import 'daos/sync_queue_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Vehicles,
    ServiceRecords,
    RepairRecords,
    UpgradeRecords,
    GasRecords,
    OdometerRecords,
    TaxRecords,
    ReminderRecords,
    PlanRecords,
    SupplyRecords,
    Notes,
    SyncQueue,
  ],
  daos: [
    VehiclesDao,
    ServiceRecordsDao,
    RepairRecordsDao,
    UpgradeRecordsDao,
    GasRecordsDao,
    OdometerRecordsDao,
    TaxRecordsDao,
    ReminderRecordsDao,
    PlanRecordsDao,
    SupplyRecordsDao,
    NotesDao,
    SyncQueueDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.addColumn(vehicles, vehicles.imagePath);
          }
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'lubelogger_db');
  }
}
