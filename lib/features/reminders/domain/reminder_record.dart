import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder_record.freezed.dart';
part 'reminder_record.g.dart';

@freezed
class ReminderRecord with _$ReminderRecord {
  const factory ReminderRecord({
    required int id,
    int? remoteId,
    required int vehicleId,
    required String description,
    @Default('both') String reminderMetric, // 'date', 'mileage', 'both'
    DateTime? dateMetric,
    double? mileageMetric,
    @Default(false) bool isRecurring,
    @Default('') String notes,
    required DateTime updatedAt,
    @Default('synced') String syncStatus,
  }) = _ReminderRecord;

  factory ReminderRecord.fromJson(Map<String, dynamic> json) =>
      _$ReminderRecordFromJson(json);
}
