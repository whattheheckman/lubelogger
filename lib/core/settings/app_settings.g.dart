// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsImpl _$$AppSettingsImplFromJson(
  Map<String, dynamic> json,
) => _$AppSettingsImpl(
  appMode:
      $enumDecodeNullable(_$AppModeEnumMap, json['appMode']) ?? AppMode.local,
  serverUrl: json['serverUrl'] as String? ?? '',
  authMode:
      $enumDecodeNullable(_$AuthModeEnumMap, json['authMode']) ?? AuthMode.none,
  apiKey: json['apiKey'] as String? ?? '',
  username: json['username'] as String? ?? '',
  password: json['password'] as String? ?? '',
  syncIntervalMinutes: (json['syncIntervalMinutes'] as num?)?.toInt() ?? 5,
  conflictStrategy:
      $enumDecodeNullable(
        _$ConflictStrategyEnumMap,
        json['conflictStrategy'],
      ) ??
      ConflictStrategy.lastWriteWins,
  setupComplete: json['setupComplete'] as bool? ?? false,
  autoAddOdometerRecords: json['autoAddOdometerRecords'] as bool? ?? true,
);

Map<String, dynamic> _$$AppSettingsImplToJson(_$AppSettingsImpl instance) =>
    <String, dynamic>{
      'appMode': _$AppModeEnumMap[instance.appMode]!,
      'serverUrl': instance.serverUrl,
      'authMode': _$AuthModeEnumMap[instance.authMode]!,
      'apiKey': instance.apiKey,
      'username': instance.username,
      'password': instance.password,
      'syncIntervalMinutes': instance.syncIntervalMinutes,
      'conflictStrategy': _$ConflictStrategyEnumMap[instance.conflictStrategy]!,
      'setupComplete': instance.setupComplete,
      'autoAddOdometerRecords': instance.autoAddOdometerRecords,
    };

const _$AppModeEnumMap = {
  AppMode.local: 'local',
  AppMode.connected: 'connected',
};

const _$AuthModeEnumMap = {
  AuthMode.none: 'none',
  AuthMode.apiKey: 'apiKey',
  AuthMode.basic: 'basic',
};

const _$ConflictStrategyEnumMap = {
  ConflictStrategy.lastWriteWins: 'lastWriteWins',
  ConflictStrategy.userPrompt: 'userPrompt',
};
