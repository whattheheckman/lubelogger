// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettings {

 AppMode get appMode; String get serverUrl; AuthMode get authMode; String get apiKey; String get username; String get password; int get syncIntervalMinutes; ConflictStrategy get conflictStrategy; bool get setupComplete; bool get autoAddOdometerRecords;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AppSettings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.appMode, _this.appMode) || other.appMode == _this.appMode)&&(identical(other.serverUrl, _this.serverUrl) || other.serverUrl == _this.serverUrl)&&(identical(other.authMode, _this.authMode) || other.authMode == _this.authMode)&&(identical(other.apiKey, _this.apiKey) || other.apiKey == _this.apiKey)&&(identical(other.username, _this.username) || other.username == _this.username)&&(identical(other.password, _this.password) || other.password == _this.password)&&(identical(other.syncIntervalMinutes, _this.syncIntervalMinutes) || other.syncIntervalMinutes == _this.syncIntervalMinutes)&&(identical(other.conflictStrategy, _this.conflictStrategy) || other.conflictStrategy == _this.conflictStrategy)&&(identical(other.setupComplete, _this.setupComplete) || other.setupComplete == _this.setupComplete)&&(identical(other.autoAddOdometerRecords, _this.autoAddOdometerRecords) || other.autoAddOdometerRecords == _this.autoAddOdometerRecords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AppSettings;
  return Object.hash(runtimeType,_this.appMode,_this.serverUrl,_this.authMode,_this.apiKey,_this.username,_this.password,_this.syncIntervalMinutes,_this.conflictStrategy,_this.setupComplete,_this.autoAddOdometerRecords);
}

@override
String toString() {
  final _this = this as AppSettings;
  return 'AppSettings(appMode: ${_this.appMode}, serverUrl: ${_this.serverUrl}, authMode: ${_this.authMode}, apiKey: ${_this.apiKey}, username: ${_this.username}, password: ${_this.password}, syncIntervalMinutes: ${_this.syncIntervalMinutes}, conflictStrategy: ${_this.conflictStrategy}, setupComplete: ${_this.setupComplete}, autoAddOdometerRecords: ${_this.autoAddOdometerRecords})';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 AppMode appMode, String serverUrl, AuthMode authMode, String apiKey, String username, String password, int syncIntervalMinutes, ConflictStrategy conflictStrategy, bool setupComplete, bool autoAddOdometerRecords
});




}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appMode = null,Object? serverUrl = null,Object? authMode = null,Object? apiKey = null,Object? username = null,Object? password = null,Object? syncIntervalMinutes = null,Object? conflictStrategy = null,Object? setupComplete = null,Object? autoAddOdometerRecords = null,}) {
  return _then(AppSettings(
appMode: null == appMode ? _self.appMode : appMode // ignore: cast_nullable_to_non_nullable
as AppMode,serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,authMode: null == authMode ? _self.authMode : authMode // ignore: cast_nullable_to_non_nullable
as AuthMode,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,syncIntervalMinutes: null == syncIntervalMinutes ? _self.syncIntervalMinutes : syncIntervalMinutes // ignore: cast_nullable_to_non_nullable
as int,conflictStrategy: null == conflictStrategy ? _self.conflictStrategy : conflictStrategy // ignore: cast_nullable_to_non_nullable
as ConflictStrategy,setupComplete: null == setupComplete ? _self.setupComplete : setupComplete // ignore: cast_nullable_to_non_nullable
as bool,autoAddOdometerRecords: null == autoAddOdometerRecords ? _self.autoAddOdometerRecords : autoAddOdometerRecords // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppMode appMode,  String serverUrl,  AuthMode authMode,  String apiKey,  String username,  String password,  int syncIntervalMinutes,  ConflictStrategy conflictStrategy,  bool setupComplete,  bool autoAddOdometerRecords)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.appMode,_that.serverUrl,_that.authMode,_that.apiKey,_that.username,_that.password,_that.syncIntervalMinutes,_that.conflictStrategy,_that.setupComplete,_that.autoAddOdometerRecords);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppMode appMode,  String serverUrl,  AuthMode authMode,  String apiKey,  String username,  String password,  int syncIntervalMinutes,  ConflictStrategy conflictStrategy,  bool setupComplete,  bool autoAddOdometerRecords)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.appMode,_that.serverUrl,_that.authMode,_that.apiKey,_that.username,_that.password,_that.syncIntervalMinutes,_that.conflictStrategy,_that.setupComplete,_that.autoAddOdometerRecords);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppMode appMode,  String serverUrl,  AuthMode authMode,  String apiKey,  String username,  String password,  int syncIntervalMinutes,  ConflictStrategy conflictStrategy,  bool setupComplete,  bool autoAddOdometerRecords)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.appMode,_that.serverUrl,_that.authMode,_that.apiKey,_that.username,_that.password,_that.syncIntervalMinutes,_that.conflictStrategy,_that.setupComplete,_that.autoAddOdometerRecords);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettings implements AppSettings {
  const _AppSettings({this.appMode = AppMode.local, this.serverUrl = '', this.authMode = AuthMode.none, this.apiKey = '', this.username = '', this.password = '', this.syncIntervalMinutes = 5, this.conflictStrategy = ConflictStrategy.lastWriteWins, this.setupComplete = false, this.autoAddOdometerRecords = true});
  factory _AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

@override@JsonKey() final  AppMode appMode;
@override@JsonKey() final  String serverUrl;
@override@JsonKey() final  AuthMode authMode;
@override@JsonKey() final  String apiKey;
@override@JsonKey() final  String username;
@override@JsonKey() final  String password;
@override@JsonKey() final  int syncIntervalMinutes;
@override@JsonKey() final  ConflictStrategy conflictStrategy;
@override@JsonKey() final  bool setupComplete;
@override@JsonKey() final  bool autoAddOdometerRecords;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.appMode, appMode) || other.appMode == appMode)&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.authMode, authMode) || other.authMode == authMode)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.syncIntervalMinutes, syncIntervalMinutes) || other.syncIntervalMinutes == syncIntervalMinutes)&&(identical(other.conflictStrategy, conflictStrategy) || other.conflictStrategy == conflictStrategy)&&(identical(other.setupComplete, setupComplete) || other.setupComplete == setupComplete)&&(identical(other.autoAddOdometerRecords, autoAddOdometerRecords) || other.autoAddOdometerRecords == autoAddOdometerRecords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,appMode,serverUrl,authMode,apiKey,username,password,syncIntervalMinutes,conflictStrategy,setupComplete,autoAddOdometerRecords);
}

@override
String toString() {
    return 'AppSettings(appMode: $appMode, serverUrl: $serverUrl, authMode: $authMode, apiKey: $apiKey, username: $username, password: $password, syncIntervalMinutes: $syncIntervalMinutes, conflictStrategy: $conflictStrategy, setupComplete: $setupComplete, autoAddOdometerRecords: $autoAddOdometerRecords)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 AppMode appMode, String serverUrl, AuthMode authMode, String apiKey, String username, String password, int syncIntervalMinutes, ConflictStrategy conflictStrategy, bool setupComplete, bool autoAddOdometerRecords
});




}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appMode = null,Object? serverUrl = null,Object? authMode = null,Object? apiKey = null,Object? username = null,Object? password = null,Object? syncIntervalMinutes = null,Object? conflictStrategy = null,Object? setupComplete = null,Object? autoAddOdometerRecords = null,}) {
  return _then(_AppSettings(
appMode: null == appMode ? _self.appMode : appMode // ignore: cast_nullable_to_non_nullable
as AppMode,serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,authMode: null == authMode ? _self.authMode : authMode // ignore: cast_nullable_to_non_nullable
as AuthMode,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,syncIntervalMinutes: null == syncIntervalMinutes ? _self.syncIntervalMinutes : syncIntervalMinutes // ignore: cast_nullable_to_non_nullable
as int,conflictStrategy: null == conflictStrategy ? _self.conflictStrategy : conflictStrategy // ignore: cast_nullable_to_non_nullable
as ConflictStrategy,setupComplete: null == setupComplete ? _self.setupComplete : setupComplete // ignore: cast_nullable_to_non_nullable
as bool,autoAddOdometerRecords: null == autoAddOdometerRecords ? _self.autoAddOdometerRecords : autoAddOdometerRecords // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
