// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odometer_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OdometerRecordImpl _$$OdometerRecordImplFromJson(Map<String, dynamic> json) =>
    _$OdometerRecordImpl(
      id: (json['id'] as num).toInt(),
      remoteId: (json['remoteId'] as num?)?.toInt(),
      vehicleId: (json['vehicleId'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      mileage: (json['mileage'] as num?)?.toDouble() ?? 0.0,
      initialMileage: (json['initialMileage'] as num?)?.toDouble() ?? 0.0,
      notes: json['notes'] as String? ?? '',
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      syncStatus: json['syncStatus'] as String? ?? 'synced',
    );

Map<String, dynamic> _$$OdometerRecordImplToJson(
  _$OdometerRecordImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'remoteId': instance.remoteId,
  'vehicleId': instance.vehicleId,
  'date': instance.date.toIso8601String(),
  'mileage': instance.mileage,
  'initialMileage': instance.initialMileage,
  'notes': instance.notes,
  'updatedAt': instance.updatedAt.toIso8601String(),
  'syncStatus': instance.syncStatus,
};
