// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteRecordImpl _$$NoteRecordImplFromJson(Map<String, dynamic> json) =>
    _$NoteRecordImpl(
      id: (json['id'] as num).toInt(),
      remoteId: (json['remoteId'] as num?)?.toInt(),
      vehicleId: (json['vehicleId'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String? ?? '',
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      syncStatus: json['syncStatus'] as String? ?? 'synced',
    );

Map<String, dynamic> _$$NoteRecordImplToJson(_$NoteRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'remoteId': instance.remoteId,
      'vehicleId': instance.vehicleId,
      'title': instance.title,
      'body': instance.body,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'syncStatus': instance.syncStatus,
    };
