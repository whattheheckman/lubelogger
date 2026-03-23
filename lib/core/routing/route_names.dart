abstract class RouteNames {
  // ── Top-level shell branches ──────────────────────────────────────────────
  static const setup = '/setup';
  static const vehicles = '/vehicles';
  static const reminders = '/reminders';
  static const settings = '/settings';
  static const settingsConnection = '/settings/connection';

  // ── GoRouter path patterns (used by GoRoute path: declarations) ───────────
  static const vehicleAdd = '/vehicles/add';
  static const vehicleDetail = '/vehicles/:vehicleId';
  static const vehicleEdit = '/vehicles/:vehicleId/edit';
  static const vehicleService = '/vehicles/:vehicleId/service';
  static const vehicleServiceAdd = '/vehicles/:vehicleId/service/add';
  static const vehicleServiceEdit = '/vehicles/:vehicleId/service/:recordId/edit';
  static const vehicleRepairs = '/vehicles/:vehicleId/repairs';
  static const vehicleRepairAdd = '/vehicles/:vehicleId/repairs/add';
  static const vehicleRepairEdit = '/vehicles/:vehicleId/repairs/:recordId/edit';
  static const vehicleUpgrades = '/vehicles/:vehicleId/upgrades';
  static const vehicleUpgradeAdd = '/vehicles/:vehicleId/upgrades/add';
  static const vehicleUpgradeEdit = '/vehicles/:vehicleId/upgrades/:recordId/edit';
  static const vehicleFuel = '/vehicles/:vehicleId/fuel';
  static const vehicleFuelAdd = '/vehicles/:vehicleId/fuel/add';
  static const vehicleFuelEdit = '/vehicles/:vehicleId/fuel/:recordId/edit';
  static const vehicleOdometer = '/vehicles/:vehicleId/odometer';
  static const vehicleOdometerAdd = '/vehicles/:vehicleId/odometer/add';
  static const vehicleTaxes = '/vehicles/:vehicleId/taxes';
  static const vehicleTaxAdd = '/vehicles/:vehicleId/taxes/add';
  static const vehicleReminders = '/vehicles/:vehicleId/reminders';
  static const vehicleReminderAdd = '/vehicles/:vehicleId/reminders/add';
  static const vehiclePlanner = '/vehicles/:vehicleId/planner';
  static const vehicleSupplies = '/vehicles/:vehicleId/supplies';
  static const vehicleSupplyAdd = '/vehicles/:vehicleId/supplies/add';
  static const vehicleNotes = '/vehicles/:vehicleId/notes';
  static const vehicleNoteAdd = '/vehicles/:vehicleId/notes/add';
  static const vehicleNoteEdit = '/vehicles/:vehicleId/notes/:noteId/edit';
  static const vehicleReports = '/vehicles/:vehicleId/reports';

  // ── Resolved location helpers (for context.go / context.push) ────────────
  static String vehicleDetailPath(int vehicleId) => '/vehicles/$vehicleId';
  static String vehicleEditPath(int vehicleId) => '/vehicles/$vehicleId/edit';

  static String vehicleServiceListPath(int vehicleId) => '/vehicles/$vehicleId/service';
  static String vehicleServiceAddPath(int vehicleId) => '/vehicles/$vehicleId/service/add';
  static String vehicleServiceEditPath(int vehicleId, int recordId) =>
      '/vehicles/$vehicleId/service/$recordId/edit';

  static String vehicleRepairListPath(int vehicleId) => '/vehicles/$vehicleId/repairs';
  static String vehicleRepairAddPath(int vehicleId) => '/vehicles/$vehicleId/repairs/add';
  static String vehicleRepairEditPath(int vehicleId, int recordId) =>
      '/vehicles/$vehicleId/repairs/$recordId/edit';

  static String vehicleUpgradeListPath(int vehicleId) => '/vehicles/$vehicleId/upgrades';
  static String vehicleUpgradeAddPath(int vehicleId) => '/vehicles/$vehicleId/upgrades/add';
  static String vehicleUpgradeEditPath(int vehicleId, int recordId) =>
      '/vehicles/$vehicleId/upgrades/$recordId/edit';

  static String vehicleFuelListPath(int vehicleId) => '/vehicles/$vehicleId/fuel';
  static String vehicleFuelAddPath(int vehicleId) => '/vehicles/$vehicleId/fuel/add';
  static String vehicleFuelEditPath(int vehicleId, int recordId) =>
      '/vehicles/$vehicleId/fuel/$recordId/edit';

  static String vehicleOdometerListPath(int vehicleId) => '/vehicles/$vehicleId/odometer';
  static String vehicleOdometerAddPath(int vehicleId) => '/vehicles/$vehicleId/odometer/add';

  static String vehicleTaxListPath(int vehicleId) => '/vehicles/$vehicleId/taxes';
  static String vehicleTaxAddPath(int vehicleId) => '/vehicles/$vehicleId/taxes/add';

  static String vehicleReminderListPath(int vehicleId) => '/vehicles/$vehicleId/reminders';
  static String vehicleReminderAddPath(int vehicleId) => '/vehicles/$vehicleId/reminders/add';

  static String vehiclePlannerPath(int vehicleId) => '/vehicles/$vehicleId/planner';

  static String vehicleSupplyListPath(int vehicleId) => '/vehicles/$vehicleId/supplies';
  static String vehicleSupplyAddPath(int vehicleId) => '/vehicles/$vehicleId/supplies/add';

  static String vehicleNoteListPath(int vehicleId) => '/vehicles/$vehicleId/notes';
  static String vehicleNoteAddPath(int vehicleId) => '/vehicles/$vehicleId/notes/add';
  static String vehicleNoteEditPath(int vehicleId, int noteId) =>
      '/vehicles/$vehicleId/notes/$noteId/edit';

  static String vehicleReportsPath(int vehicleId) => '/vehicles/$vehicleId/reports';
}
