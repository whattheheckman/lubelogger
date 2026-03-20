// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) {
  return _AppSettings.fromJson(json);
}

/// @nodoc
mixin _$AppSettings {
  AppMode get appMode => throw _privateConstructorUsedError;
  String get serverUrl => throw _privateConstructorUsedError;
  AuthMode get authMode => throw _privateConstructorUsedError;
  String get apiKey => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  int get syncIntervalMinutes => throw _privateConstructorUsedError;
  ConflictStrategy get conflictStrategy => throw _privateConstructorUsedError;
  bool get setupComplete => throw _privateConstructorUsedError;

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
    AppSettings value,
    $Res Function(AppSettings) then,
  ) = _$AppSettingsCopyWithImpl<$Res, AppSettings>;
  @useResult
  $Res call({
    AppMode appMode,
    String serverUrl,
    AuthMode authMode,
    String apiKey,
    String username,
    String password,
    int syncIntervalMinutes,
    ConflictStrategy conflictStrategy,
    bool setupComplete,
  });
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res, $Val extends AppSettings>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appMode = null,
    Object? serverUrl = null,
    Object? authMode = null,
    Object? apiKey = null,
    Object? username = null,
    Object? password = null,
    Object? syncIntervalMinutes = null,
    Object? conflictStrategy = null,
    Object? setupComplete = null,
  }) {
    return _then(
      _value.copyWith(
            appMode: null == appMode
                ? _value.appMode
                : appMode // ignore: cast_nullable_to_non_nullable
                      as AppMode,
            serverUrl: null == serverUrl
                ? _value.serverUrl
                : serverUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            authMode: null == authMode
                ? _value.authMode
                : authMode // ignore: cast_nullable_to_non_nullable
                      as AuthMode,
            apiKey: null == apiKey
                ? _value.apiKey
                : apiKey // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            syncIntervalMinutes: null == syncIntervalMinutes
                ? _value.syncIntervalMinutes
                : syncIntervalMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            conflictStrategy: null == conflictStrategy
                ? _value.conflictStrategy
                : conflictStrategy // ignore: cast_nullable_to_non_nullable
                      as ConflictStrategy,
            setupComplete: null == setupComplete
                ? _value.setupComplete
                : setupComplete // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppSettingsImplCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$$AppSettingsImplCopyWith(
    _$AppSettingsImpl value,
    $Res Function(_$AppSettingsImpl) then,
  ) = __$$AppSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AppMode appMode,
    String serverUrl,
    AuthMode authMode,
    String apiKey,
    String username,
    String password,
    int syncIntervalMinutes,
    ConflictStrategy conflictStrategy,
    bool setupComplete,
  });
}

/// @nodoc
class __$$AppSettingsImplCopyWithImpl<$Res>
    extends _$AppSettingsCopyWithImpl<$Res, _$AppSettingsImpl>
    implements _$$AppSettingsImplCopyWith<$Res> {
  __$$AppSettingsImplCopyWithImpl(
    _$AppSettingsImpl _value,
    $Res Function(_$AppSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appMode = null,
    Object? serverUrl = null,
    Object? authMode = null,
    Object? apiKey = null,
    Object? username = null,
    Object? password = null,
    Object? syncIntervalMinutes = null,
    Object? conflictStrategy = null,
    Object? setupComplete = null,
  }) {
    return _then(
      _$AppSettingsImpl(
        appMode: null == appMode
            ? _value.appMode
            : appMode // ignore: cast_nullable_to_non_nullable
                  as AppMode,
        serverUrl: null == serverUrl
            ? _value.serverUrl
            : serverUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        authMode: null == authMode
            ? _value.authMode
            : authMode // ignore: cast_nullable_to_non_nullable
                  as AuthMode,
        apiKey: null == apiKey
            ? _value.apiKey
            : apiKey // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        syncIntervalMinutes: null == syncIntervalMinutes
            ? _value.syncIntervalMinutes
            : syncIntervalMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        conflictStrategy: null == conflictStrategy
            ? _value.conflictStrategy
            : conflictStrategy // ignore: cast_nullable_to_non_nullable
                  as ConflictStrategy,
        setupComplete: null == setupComplete
            ? _value.setupComplete
            : setupComplete // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppSettingsImpl implements _AppSettings {
  const _$AppSettingsImpl({
    this.appMode = AppMode.local,
    this.serverUrl = '',
    this.authMode = AuthMode.none,
    this.apiKey = '',
    this.username = '',
    this.password = '',
    this.syncIntervalMinutes = 5,
    this.conflictStrategy = ConflictStrategy.lastWriteWins,
    this.setupComplete = false,
  });

  factory _$AppSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingsImplFromJson(json);

  @override
  @JsonKey()
  final AppMode appMode;
  @override
  @JsonKey()
  final String serverUrl;
  @override
  @JsonKey()
  final AuthMode authMode;
  @override
  @JsonKey()
  final String apiKey;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final int syncIntervalMinutes;
  @override
  @JsonKey()
  final ConflictStrategy conflictStrategy;
  @override
  @JsonKey()
  final bool setupComplete;

  @override
  String toString() {
    return 'AppSettings(appMode: $appMode, serverUrl: $serverUrl, authMode: $authMode, apiKey: $apiKey, username: $username, password: $password, syncIntervalMinutes: $syncIntervalMinutes, conflictStrategy: $conflictStrategy, setupComplete: $setupComplete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsImpl &&
            (identical(other.appMode, appMode) || other.appMode == appMode) &&
            (identical(other.serverUrl, serverUrl) ||
                other.serverUrl == serverUrl) &&
            (identical(other.authMode, authMode) ||
                other.authMode == authMode) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.syncIntervalMinutes, syncIntervalMinutes) ||
                other.syncIntervalMinutes == syncIntervalMinutes) &&
            (identical(other.conflictStrategy, conflictStrategy) ||
                other.conflictStrategy == conflictStrategy) &&
            (identical(other.setupComplete, setupComplete) ||
                other.setupComplete == setupComplete));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    appMode,
    serverUrl,
    authMode,
    apiKey,
    username,
    password,
    syncIntervalMinutes,
    conflictStrategy,
    setupComplete,
  );

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      __$$AppSettingsImplCopyWithImpl<_$AppSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingsImplToJson(this);
  }
}

abstract class _AppSettings implements AppSettings {
  const factory _AppSettings({
    final AppMode appMode,
    final String serverUrl,
    final AuthMode authMode,
    final String apiKey,
    final String username,
    final String password,
    final int syncIntervalMinutes,
    final ConflictStrategy conflictStrategy,
    final bool setupComplete,
  }) = _$AppSettingsImpl;

  factory _AppSettings.fromJson(Map<String, dynamic> json) =
      _$AppSettingsImpl.fromJson;

  @override
  AppMode get appMode;
  @override
  String get serverUrl;
  @override
  AuthMode get authMode;
  @override
  String get apiKey;
  @override
  String get username;
  @override
  String get password;
  @override
  int get syncIntervalMinutes;
  @override
  ConflictStrategy get conflictStrategy;
  @override
  bool get setupComplete;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
