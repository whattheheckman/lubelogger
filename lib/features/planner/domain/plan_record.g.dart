// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlanRecord _$PlanRecordFromJson(Map<String, dynamic> json) => _PlanRecord(
  id: (json['id'] as num).toInt(),
  remoteId: (json['remoteId'] as num?)?.toInt(),
  vehicleId: (json['vehicleId'] as num).toInt(),
  description: json['description'] as String,
  priority: json['priority'] as String? ?? 'normal',
  progress: json['progress'] as String? ?? 'Backlog',
  notes: json['notes'] as String? ?? '',
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  syncStatus: json['syncStatus'] as String? ?? 'synced',
);

Map<String, dynamic> _$PlanRecordToJson(_PlanRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'remoteId': instance.remoteId,
      'vehicleId': instance.vehicleId,
      'description': instance.description,
      'priority': instance.priority,
      'progress': instance.progress,
      'notes': instance.notes,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'syncStatus': instance.syncStatus,
    };
