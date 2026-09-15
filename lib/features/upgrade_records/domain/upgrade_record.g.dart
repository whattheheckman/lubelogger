// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpgradeRecord _$UpgradeRecordFromJson(Map<String, dynamic> json) =>
    _UpgradeRecord(
      id: (json['id'] as num).toInt(),
      remoteId: (json['remoteId'] as num?)?.toInt(),
      vehicleId: (json['vehicleId'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      mileage: (json['mileage'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String,
      cost: (json['cost'] as num?)?.toDouble() ?? 0.0,
      notes: json['notes'] as String? ?? '',
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      syncStatus: json['syncStatus'] as String? ?? 'synced',
    );

Map<String, dynamic> _$UpgradeRecordToJson(_UpgradeRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'remoteId': instance.remoteId,
      'vehicleId': instance.vehicleId,
      'date': instance.date.toIso8601String(),
      'mileage': instance.mileage,
      'description': instance.description,
      'cost': instance.cost,
      'notes': instance.notes,
      'tags': instance.tags,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'syncStatus': instance.syncStatus,
    };
