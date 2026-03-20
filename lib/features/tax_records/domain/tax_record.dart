import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax_record.freezed.dart';
part 'tax_record.g.dart';

@freezed
class TaxRecord with _$TaxRecord {
  const factory TaxRecord({
    required int id,
    int? remoteId,
    required int vehicleId,
    required DateTime date,
    required String description,
    @Default(0.0) double cost,
    @Default(false) bool isRecurring,
    @Default('') String recurringInterval,
    @Default('') String notes,
    required DateTime updatedAt,
    @Default('synced') String syncStatus,
  }) = _TaxRecord;

  factory TaxRecord.fromJson(Map<String, dynamic> json) =>
      _$TaxRecordFromJson(json);
}
