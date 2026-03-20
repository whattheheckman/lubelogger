abstract class RouteNames {
  static const setup = '/setup';

  static const vehicles = '/vehicles';
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

  static const reminders = '/reminders';
  static const settings = '/settings';
  static const settingsConnection = '/settings/connection';
}
