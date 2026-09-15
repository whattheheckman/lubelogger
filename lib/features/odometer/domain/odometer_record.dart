import 'package:freezed_annotation/freezed_annotation.dart';

part 'odometer_record.freezed.dart';
part 'odometer_record.g.dart';

@freezed
abstract class OdometerRecord with _$OdometerRecord {
  const factory OdometerRecord({
    required int id,
    int? remoteId,
    required int vehicleId,
    required DateTime date,
    @Default(0.0) double mileage,
    @Default(0.0) double initialMileage,
    @Default('') String notes,
    required DateTime updatedAt,
    @Default('synced') String syncStatus,
  }) = _OdometerRecord;

  factory OdometerRecord.fromJson(Map<String, dynamic> json) =>
      _$OdometerRecordFromJson(json);
}
