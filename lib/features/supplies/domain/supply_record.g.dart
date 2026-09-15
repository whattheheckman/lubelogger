// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupplyRecord _$SupplyRecordFromJson(Map<String, dynamic> json) =>
    _SupplyRecord(
      id: (json['id'] as num).toInt(),
      remoteId: (json['remoteId'] as num?)?.toInt(),
      vehicleId: (json['vehicleId'] as num).toInt(),
      partNumber: json['partNumber'] as String? ?? '',
      description: json['description'] as String,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 1.0,
      cost: (json['cost'] as num?)?.toDouble() ?? 0.0,
      notes: json['notes'] as String? ?? '',
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      syncStatus: json['syncStatus'] as String? ?? 'synced',
    );

Map<String, dynamic> _$SupplyRecordToJson(_SupplyRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'remoteId': instance.remoteId,
      'vehicleId': instance.vehicleId,
      'partNumber': instance.partNumber,
      'description': instance.description,
      'quantity': instance.quantity,
      'cost': instance.cost,
      'notes': instance.notes,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'syncStatus': instance.syncStatus,
    };
