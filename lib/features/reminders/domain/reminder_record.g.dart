// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReminderRecord _$ReminderRecordFromJson(Map<String, dynamic> json) =>
    _ReminderRecord(
      id: (json['id'] as num).toInt(),
      remoteId: (json['remoteId'] as num?)?.toInt(),
      vehicleId: (json['vehicleId'] as num).toInt(),
      description: json['description'] as String,
      reminderMetric: json['reminderMetric'] as String? ?? 'both',
      dateMetric: json['dateMetric'] == null
          ? null
          : DateTime.parse(json['dateMetric'] as String),
      mileageMetric: (json['mileageMetric'] as num?)?.toDouble(),
      isRecurring: json['isRecurring'] as bool? ?? false,
      notes: json['notes'] as String? ?? '',
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      syncStatus: json['syncStatus'] as String? ?? 'synced',
    );

Map<String, dynamic> _$ReminderRecordToJson(_ReminderRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'remoteId': instance.remoteId,
      'vehicleId': instance.vehicleId,
      'description': instance.description,
      'reminderMetric': instance.reminderMetric,
      'dateMetric': instance.dateMetric?.toIso8601String(),
      'mileageMetric': instance.mileageMetric,
      'isRecurring': instance.isRecurring,
      'notes': instance.notes,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'syncStatus': instance.syncStatus,
    };
