import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_record.freezed.dart';
part 'service_record.g.dart';

@freezed
abstract class ServiceRecord with _$ServiceRecord {
  const factory ServiceRecord({
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
  }) = _ServiceRecord;

  factory ServiceRecord.fromJson(Map<String, dynamic> json) =>
      _$ServiceRecordFromJson(json);
}
