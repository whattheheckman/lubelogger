// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaxRecordImpl _$$TaxRecordImplFromJson(Map<String, dynamic> json) =>
    _$TaxRecordImpl(
      id: (json['id'] as num).toInt(),
      remoteId: (json['remoteId'] as num?)?.toInt(),
      vehicleId: (json['vehicleId'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
      cost: (json['cost'] as num?)?.toDouble() ?? 0.0,
      isRecurring: json['isRecurring'] as bool? ?? false,
      recurringInterval: json['recurringInterval'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      syncStatus: json['syncStatus'] as String? ?? 'synced',
    );

Map<String, dynamic> _$$TaxRecordImplToJson(_$TaxRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'remoteId': instance.remoteId,
      'vehicleId': instance.vehicleId,
      'date': instance.date.toIso8601String(),
      'description': instance.description,
      'cost': instance.cost,
      'isRecurring': instance.isRecurring,
      'recurringInterval': instance.recurringInterval,
      'notes': instance.notes,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'syncStatus': instance.syncStatus,
    };
