import 'package:freezed_annotation/freezed_annotation.dart';

part 'supply_record.freezed.dart';
part 'supply_record.g.dart';

@freezed
class SupplyRecord with _$SupplyRecord {
  const factory SupplyRecord({
    required int id,
    int? remoteId,
    required int vehicleId,
    @Default('') String partNumber,
    required String description,
    @Default(1.0) double quantity,
    @Default(0.0) double cost,
    @Default('') String notes,
    required DateTime updatedAt,
    @Default('synced') String syncStatus,
  }) = _SupplyRecord;

  factory SupplyRecord.fromJson(Map<String, dynamic> json) =>
      _$SupplyRecordFromJson(json);
}
