import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_record.freezed.dart';
part 'note_record.g.dart';

@freezed
class NoteRecord with _$NoteRecord {
  const factory NoteRecord({
    required int id,
    int? remoteId,
    required int vehicleId,
    required String title,
    @Default('') String body,
    required DateTime updatedAt,
    @Default('synced') String syncStatus,
  }) = _NoteRecord;

  factory NoteRecord.fromJson(Map<String, dynamic> json) =>
      _$NoteRecordFromJson(json);
}
