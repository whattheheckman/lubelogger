import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_record.freezed.dart';
part 'plan_record.g.dart';

@freezed
class PlanRecord with _$PlanRecord {
  const factory PlanRecord({
    required int id,
    int? remoteId,
    required int vehicleId,
    required String description,
    @Default('normal') String priority, // 'low', 'normal', 'high', 'critical'
    @Default('Backlog') String progress, // 'Backlog', 'InProgress', 'Testing', 'Done'
    @Default('') String notes,
    required DateTime updatedAt,
    @Default('synced') String syncStatus,
  }) = _PlanRecord;

  factory PlanRecord.fromJson(Map<String, dynamic> json) =>
      _$PlanRecordFromJson(json);
}
