// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NoteRecord {

 int get id; int? get remoteId; int get vehicleId; String get title; String get body; DateTime get updatedAt; String get syncStatus;
/// Create a copy of NoteRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteRecordCopyWith<NoteRecord> get copyWith => _$NoteRecordCopyWithImpl<NoteRecord>(this as NoteRecord, _$identity);

  /// Serializes this NoteRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NoteRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.remoteId, _this.remoteId) || other.remoteId == _this.remoteId)&&(identical(other.vehicleId, _this.vehicleId) || other.vehicleId == _this.vehicleId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.body, _this.body) || other.body == _this.body)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.syncStatus, _this.syncStatus) || other.syncStatus == _this.syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NoteRecord;
  return Object.hash(runtimeType,_this.id,_this.remoteId,_this.vehicleId,_this.title,_this.body,_this.updatedAt,_this.syncStatus);
}

@override
String toString() {
  final _this = this as NoteRecord;
  return 'NoteRecord(id: ${_this.id}, remoteId: ${_this.remoteId}, vehicleId: ${_this.vehicleId}, title: ${_this.title}, body: ${_this.body}, updatedAt: ${_this.updatedAt}, syncStatus: ${_this.syncStatus})';
}


}

/// @nodoc
abstract mixin class $NoteRecordCopyWith<$Res>  {
  factory $NoteRecordCopyWith(NoteRecord value, $Res Function(NoteRecord) _then) = _$NoteRecordCopyWithImpl;
@useResult
$Res call({
 int id, int? remoteId, int vehicleId, String title, String body, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class _$NoteRecordCopyWithImpl<$Res>
    implements $NoteRecordCopyWith<$Res> {
  _$NoteRecordCopyWithImpl(this._self, this._then);

  final NoteRecord _self;
  final $Res Function(NoteRecord) _then;

/// Create a copy of NoteRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? remoteId = freezed,Object? vehicleId = null,Object? title = null,Object? body = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(NoteRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NoteRecord].
extension NoteRecordPatterns on NoteRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoteRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoteRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoteRecord value)  $default,){
final _that = this;
switch (_that) {
case _NoteRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoteRecord value)?  $default,){
final _that = this;
switch (_that) {
case _NoteRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? remoteId,  int vehicleId,  String title,  String body,  DateTime updatedAt,  String syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoteRecord() when $default != null:
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.title,_that.body,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? remoteId,  int vehicleId,  String title,  String body,  DateTime updatedAt,  String syncStatus)  $default,) {final _that = this;
switch (_that) {
case _NoteRecord():
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.title,_that.body,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? remoteId,  int vehicleId,  String title,  String body,  DateTime updatedAt,  String syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _NoteRecord() when $default != null:
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.title,_that.body,_that.updatedAt,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NoteRecord implements NoteRecord {
  const _NoteRecord({required this.id, this.remoteId, required this.vehicleId, required this.title, this.body = '', required this.updatedAt, this.syncStatus = 'synced'});
  factory _NoteRecord.fromJson(Map<String, dynamic> json) => _$NoteRecordFromJson(json);

@override final  int id;
@override final  int? remoteId;
@override final  int vehicleId;
@override final  String title;
@override@JsonKey() final  String body;
@override final  DateTime updatedAt;
@override@JsonKey() final  String syncStatus;

/// Create a copy of NoteRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteRecordCopyWith<_NoteRecord> get copyWith => __$NoteRecordCopyWithImpl<_NoteRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NoteRecordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,remoteId,vehicleId,title,body,updatedAt,syncStatus);
}

@override
String toString() {
    return 'NoteRecord(id: $id, remoteId: $remoteId, vehicleId: $vehicleId, title: $title, body: $body, updatedAt: $updatedAt, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$NoteRecordCopyWith<$Res> implements $NoteRecordCopyWith<$Res> {
  factory _$NoteRecordCopyWith(_NoteRecord value, $Res Function(_NoteRecord) _then) = __$NoteRecordCopyWithImpl;
@override @useResult
$Res call({
 int id, int? remoteId, int vehicleId, String title, String body, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class __$NoteRecordCopyWithImpl<$Res>
    implements _$NoteRecordCopyWith<$Res> {
  __$NoteRecordCopyWithImpl(this._self, this._then);

  final _NoteRecord _self;
  final $Res Function(_NoteRecord) _then;

/// Create a copy of NoteRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? remoteId = freezed,Object? vehicleId = null,Object? title = null,Object? body = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(_NoteRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
