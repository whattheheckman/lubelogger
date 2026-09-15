// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlanRecord {

 int get id; int? get remoteId; int get vehicleId; String get description; String get priority; String get progress; String get notes; DateTime get updatedAt; String get syncStatus;
/// Create a copy of PlanRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanRecordCopyWith<PlanRecord> get copyWith => _$PlanRecordCopyWithImpl<PlanRecord>(this as PlanRecord, _$identity);

  /// Serializes this PlanRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlanRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.remoteId, _this.remoteId) || other.remoteId == _this.remoteId)&&(identical(other.vehicleId, _this.vehicleId) || other.vehicleId == _this.vehicleId)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.priority, _this.priority) || other.priority == _this.priority)&&(identical(other.progress, _this.progress) || other.progress == _this.progress)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.syncStatus, _this.syncStatus) || other.syncStatus == _this.syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlanRecord;
  return Object.hash(runtimeType,_this.id,_this.remoteId,_this.vehicleId,_this.description,_this.priority,_this.progress,_this.notes,_this.updatedAt,_this.syncStatus);
}

@override
String toString() {
  final _this = this as PlanRecord;
  return 'PlanRecord(id: ${_this.id}, remoteId: ${_this.remoteId}, vehicleId: ${_this.vehicleId}, description: ${_this.description}, priority: ${_this.priority}, progress: ${_this.progress}, notes: ${_this.notes}, updatedAt: ${_this.updatedAt}, syncStatus: ${_this.syncStatus})';
}


}

/// @nodoc
abstract mixin class $PlanRecordCopyWith<$Res>  {
  factory $PlanRecordCopyWith(PlanRecord value, $Res Function(PlanRecord) _then) = _$PlanRecordCopyWithImpl;
@useResult
$Res call({
 int id, int? remoteId, int vehicleId, String description, String priority, String progress, String notes, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class _$PlanRecordCopyWithImpl<$Res>
    implements $PlanRecordCopyWith<$Res> {
  _$PlanRecordCopyWithImpl(this._self, this._then);

  final PlanRecord _self;
  final $Res Function(PlanRecord) _then;

/// Create a copy of PlanRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? remoteId = freezed,Object? vehicleId = null,Object? description = null,Object? priority = null,Object? progress = null,Object? notes = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(PlanRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanRecord].
extension PlanRecordPatterns on PlanRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanRecord value)  $default,){
final _that = this;
switch (_that) {
case _PlanRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanRecord value)?  $default,){
final _that = this;
switch (_that) {
case _PlanRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? remoteId,  int vehicleId,  String description,  String priority,  String progress,  String notes,  DateTime updatedAt,  String syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanRecord() when $default != null:
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.description,_that.priority,_that.progress,_that.notes,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? remoteId,  int vehicleId,  String description,  String priority,  String progress,  String notes,  DateTime updatedAt,  String syncStatus)  $default,) {final _that = this;
switch (_that) {
case _PlanRecord():
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.description,_that.priority,_that.progress,_that.notes,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? remoteId,  int vehicleId,  String description,  String priority,  String progress,  String notes,  DateTime updatedAt,  String syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _PlanRecord() when $default != null:
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.description,_that.priority,_that.progress,_that.notes,_that.updatedAt,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanRecord implements PlanRecord {
  const _PlanRecord({required this.id, this.remoteId, required this.vehicleId, required this.description, this.priority = 'normal', this.progress = 'Backlog', this.notes = '', required this.updatedAt, this.syncStatus = 'synced'});
  factory _PlanRecord.fromJson(Map<String, dynamic> json) => _$PlanRecordFromJson(json);

@override final  int id;
@override final  int? remoteId;
@override final  int vehicleId;
@override final  String description;
@override@JsonKey() final  String priority;
@override@JsonKey() final  String progress;
@override@JsonKey() final  String notes;
@override final  DateTime updatedAt;
@override@JsonKey() final  String syncStatus;

/// Create a copy of PlanRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanRecordCopyWith<_PlanRecord> get copyWith => __$PlanRecordCopyWithImpl<_PlanRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanRecordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.description, description) || other.description == description)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,remoteId,vehicleId,description,priority,progress,notes,updatedAt,syncStatus);
}

@override
String toString() {
    return 'PlanRecord(id: $id, remoteId: $remoteId, vehicleId: $vehicleId, description: $description, priority: $priority, progress: $progress, notes: $notes, updatedAt: $updatedAt, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$PlanRecordCopyWith<$Res> implements $PlanRecordCopyWith<$Res> {
  factory _$PlanRecordCopyWith(_PlanRecord value, $Res Function(_PlanRecord) _then) = __$PlanRecordCopyWithImpl;
@override @useResult
$Res call({
 int id, int? remoteId, int vehicleId, String description, String priority, String progress, String notes, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class __$PlanRecordCopyWithImpl<$Res>
    implements _$PlanRecordCopyWith<$Res> {
  __$PlanRecordCopyWithImpl(this._self, this._then);

  final _PlanRecord _self;
  final $Res Function(_PlanRecord) _then;

/// Create a copy of PlanRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? remoteId = freezed,Object? vehicleId = null,Object? description = null,Object? priority = null,Object? progress = null,Object? notes = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(_PlanRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
