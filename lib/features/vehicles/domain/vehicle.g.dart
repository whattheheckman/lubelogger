// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleImpl _$$VehicleImplFromJson(Map<String, dynamic> json) =>
    _$VehicleImpl(
      id: (json['id'] as num).toInt(),
      remoteId: (json['remoteId'] as num?)?.toInt(),
      year: json['year'] as String,
      make: json['make'] as String,
      model: json['model'] as String,
      licensePlate: json['licensePlate'] as String? ?? '',
      isElectric: json['isElectric'] as bool? ?? false,
      isDiesel: json['isDiesel'] as bool? ?? false,
      useHours: json['useHours'] as bool? ?? false,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      extraFields: json['extraFields'] as Map<String, dynamic>? ?? const {},
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      syncStatus: json['syncStatus'] as String? ?? 'synced',
    );

Map<String, dynamic> _$$VehicleImplToJson(_$VehicleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'remoteId': instance.remoteId,
      'year': instance.year,
      'make': instance.make,
      'model': instance.model,
      'licensePlate': instance.licensePlate,
      'isElectric': instance.isElectric,
      'isDiesel': instance.isDiesel,
      'useHours': instance.useHours,
      'tags': instance.tags,
      'extraFields': instance.extraFields,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'syncStatus': instance.syncStatus,
    };
