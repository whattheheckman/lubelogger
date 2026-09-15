// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gas_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GasRecord _$GasRecordFromJson(Map<String, dynamic> json) => _GasRecord(
  id: (json['id'] as num).toInt(),
  remoteId: (json['remoteId'] as num?)?.toInt(),
  vehicleId: (json['vehicleId'] as num).toInt(),
  date: DateTime.parse(json['date'] as String),
  mileage: (json['mileage'] as num?)?.toDouble() ?? 0.0,
  gallons: (json['gallons'] as num?)?.toDouble() ?? 0.0,
  cost: (json['cost'] as num?)?.toDouble() ?? 0.0,
  isFillToFull: json['isFillToFull'] as bool? ?? true,
  missedFuelUp: json['missedFuelUp'] as bool? ?? false,
  mpg: (json['mpg'] as num?)?.toDouble(),
  notes: json['notes'] as String? ?? '',
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  syncStatus: json['syncStatus'] as String? ?? 'synced',
);

Map<String, dynamic> _$GasRecordToJson(_GasRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'remoteId': instance.remoteId,
      'vehicleId': instance.vehicleId,
      'date': instance.date.toIso8601String(),
      'mileage': instance.mileage,
      'gallons': instance.gallons,
      'cost': instance.cost,
      'isFillToFull': instance.isFillToFull,
      'missedFuelUp': instance.missedFuelUp,
      'mpg': instance.mpg,
      'notes': instance.notes,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'syncStatus': instance.syncStatus,
    };
