import 'package:freezed_annotation/freezed_annotation.dart';

part 'gas_record.freezed.dart';
part 'gas_record.g.dart';

@freezed
abstract class GasRecord with _$GasRecord {
  const factory GasRecord({
    required int id,
    int? remoteId,
    required int vehicleId,
    required DateTime date,
    @Default(0.0) double mileage,
    @Default(0.0) double gallons,
    @Default(0.0) double cost,
    @Default(true) bool isFillToFull,
    @Default(false) bool missedFuelUp,
    double? mpg,
    @Default('') String notes,
    required DateTime updatedAt,
    @Default('synced') String syncStatus,
  }) = _GasRecord;

  factory GasRecord.fromJson(Map<String, dynamic> json) =>
      _$GasRecordFromJson(json);
}
