abstract class RouteNames {
  // ── Top-level shell branches (used as GoRoute path: values) ──────────────
  static const setup = '/setup';
  static const vehicles = '/vehicles';
  static const reminders = '/reminders';
  static const settings = '/settings';

  // ── Param-free navigation targets ────────────────────────────────────────
  static const vehicleAdd = '/vehicles/add';
  static const settingsConnection = '/settings/connection';
  static const settingsTabLayout = '/settings/tab-layout';
  static const settingsNotifications = '/settings/notifications';
  static const settingsSyncLog = '/settings/sync-log';
  static const settingsExport = '/settings/export';
  static const settingsImport = '/settings/import';

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
  static String vehicleFuelQuickAddPath(int vehicleId) => '/vehicles/$vehicleId/fuel/quick-add';
  static String vehicleFuelEditPath(int vehicleId, int recordId) =>
      '/vehicles/$vehicleId/fuel/$recordId/edit';

  static String vehicleOdometerListPath(int vehicleId) => '/vehicles/$vehicleId/odometer';
  static String vehicleOdometerAddPath(int vehicleId) => '/vehicles/$vehicleId/odometer/add';
  static String vehicleOdometerEditPath(int vehicleId, int recordId) =>
      '/vehicles/$vehicleId/odometer/$recordId/edit';

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

  // ── Quick fuel (nav bar entry point) ─────────────────────────────────────
  static const quickFuel = '/quick-fuel';
}
