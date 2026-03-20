import 'package:freezed_annotation/freezed_annotation.dart';

part 'upgrade_record.freezed.dart';
part 'upgrade_record.g.dart';

@freezed
class UpgradeRecord with _$UpgradeRecord {
  const factory UpgradeRecord({
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
  }) = _UpgradeRecord;

  factory UpgradeRecord.fromJson(Map<String, dynamic> json) =>
      _$UpgradeRecordFromJson(json);
}
