import 'package:freezed_annotation/freezed_annotation.dart';

part 'repair_record.freezed.dart';
part 'repair_record.g.dart';

@freezed
class RepairRecord with _$RepairRecord {
  const factory RepairRecord({
    required int id,
    int? remoteId,
    required int vehicleId,
    required DateTime date,
    @Default(0.0) double mileage,
    required String description,
    @Default(0.0) double cost,
    @Default('') String notes,
    @Default([]) List<String> tags,
    required DateTime updatedAt,
    @Default('synced') String syncStatus,
  }) = _RepairRecord;

  factory RepairRecord.fromJson(Map<String, dynamic> json) =>
      _$RepairRecordFromJson(json);
}
