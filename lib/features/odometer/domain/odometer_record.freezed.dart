// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'odometer_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OdometerRecord {

 int get id; int? get remoteId; int get vehicleId; DateTime get date; double get mileage; double get initialMileage; String get notes; DateTime get updatedAt; String get syncStatus;
/// Create a copy of OdometerRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OdometerRecordCopyWith<OdometerRecord> get copyWith => _$OdometerRecordCopyWithImpl<OdometerRecord>(this as OdometerRecord, _$identity);

  /// Serializes this OdometerRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OdometerRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OdometerRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.remoteId, _this.remoteId) || other.remoteId == _this.remoteId)&&(identical(other.vehicleId, _this.vehicleId) || other.vehicleId == _this.vehicleId)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.mileage, _this.mileage) || other.mileage == _this.mileage)&&(identical(other.initialMileage, _this.initialMileage) || other.initialMileage == _this.initialMileage)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.syncStatus, _this.syncStatus) || other.syncStatus == _this.syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OdometerRecord;
  return Object.hash(runtimeType,_this.id,_this.remoteId,_this.vehicleId,_this.date,_this.mileage,_this.initialMileage,_this.notes,_this.updatedAt,_this.syncStatus);
}

@override
String toString() {
  final _this = this as OdometerRecord;
  return 'OdometerRecord(id: ${_this.id}, remoteId: ${_this.remoteId}, vehicleId: ${_this.vehicleId}, date: ${_this.date}, mileage: ${_this.mileage}, initialMileage: ${_this.initialMileage}, notes: ${_this.notes}, updatedAt: ${_this.updatedAt}, syncStatus: ${_this.syncStatus})';
}


}

/// @nodoc
abstract mixin class $OdometerRecordCopyWith<$Res>  {
  factory $OdometerRecordCopyWith(OdometerRecord value, $Res Function(OdometerRecord) _then) = _$OdometerRecordCopyWithImpl;
@useResult
$Res call({
 int id, int? remoteId, int vehicleId, DateTime date, double mileage, double initialMileage, String notes, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class _$OdometerRecordCopyWithImpl<$Res>
    implements $OdometerRecordCopyWith<$Res> {
  _$OdometerRecordCopyWithImpl(this._self, this._then);

  final OdometerRecord _self;
  final $Res Function(OdometerRecord) _then;

/// Create a copy of OdometerRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? remoteId = freezed,Object? vehicleId = null,Object? date = null,Object? mileage = null,Object? initialMileage = null,Object? notes = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(OdometerRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as double,initialMileage: null == initialMileage ? _self.initialMileage : initialMileage // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OdometerRecord].
extension OdometerRecordPatterns on OdometerRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OdometerRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OdometerRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OdometerRecord value)  $default,){
final _that = this;
switch (_that) {
case _OdometerRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OdometerRecord value)?  $default,){
final _that = this;
switch (_that) {
case _OdometerRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? remoteId,  int vehicleId,  DateTime date,  double mileage,  double initialMileage,  String notes,  DateTime updatedAt,  String syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OdometerRecord() when $default != null:
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.date,_that.mileage,_that.initialMileage,_that.notes,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? remoteId,  int vehicleId,  DateTime date,  double mileage,  double initialMileage,  String notes,  DateTime updatedAt,  String syncStatus)  $default,) {final _that = this;
switch (_that) {
case _OdometerRecord():
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.date,_that.mileage,_that.initialMileage,_that.notes,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? remoteId,  int vehicleId,  DateTime date,  double mileage,  double initialMileage,  String notes,  DateTime updatedAt,  String syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _OdometerRecord() when $default != null:
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.date,_that.mileage,_that.initialMileage,_that.notes,_that.updatedAt,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OdometerRecord implements OdometerRecord {
  const _OdometerRecord({required this.id, this.remoteId, required this.vehicleId, required this.date, this.mileage = 0.0, this.initialMileage = 0.0, this.notes = '', required this.updatedAt, this.syncStatus = 'synced'});
  factory _OdometerRecord.fromJson(Map<String, dynamic> json) => _$OdometerRecordFromJson(json);

@override final  int id;
@override final  int? remoteId;
@override final  int vehicleId;
@override final  DateTime date;
@override@JsonKey() final  double mileage;
@override@JsonKey() final  double initialMileage;
@override@JsonKey() final  String notes;
@override final  DateTime updatedAt;
@override@JsonKey() final  String syncStatus;

/// Create a copy of OdometerRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OdometerRecordCopyWith<_OdometerRecord> get copyWith => __$OdometerRecordCopyWithImpl<_OdometerRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OdometerRecordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OdometerRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.date, date) || other.date == date)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.initialMileage, initialMileage) || other.initialMileage == initialMileage)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,remoteId,vehicleId,date,mileage,initialMileage,notes,updatedAt,syncStatus);
}

@override
String toString() {
    return 'OdometerRecord(id: $id, remoteId: $remoteId, vehicleId: $vehicleId, date: $date, mileage: $mileage, initialMileage: $initialMileage, notes: $notes, updatedAt: $updatedAt, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$OdometerRecordCopyWith<$Res> implements $OdometerRecordCopyWith<$Res> {
  factory _$OdometerRecordCopyWith(_OdometerRecord value, $Res Function(_OdometerRecord) _then) = __$OdometerRecordCopyWithImpl;
@override @useResult
$Res call({
 int id, int? remoteId, int vehicleId, DateTime date, double mileage, double initialMileage, String notes, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class __$OdometerRecordCopyWithImpl<$Res>
    implements _$OdometerRecordCopyWith<$Res> {
  __$OdometerRecordCopyWithImpl(this._self, this._then);

  final _OdometerRecord _self;
  final $Res Function(_OdometerRecord) _then;

/// Create a copy of OdometerRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? remoteId = freezed,Object? vehicleId = null,Object? date = null,Object? mileage = null,Object? initialMileage = null,Object? notes = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(_OdometerRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as double,initialMileage: null == initialMileage ? _self.initialMileage : initialMileage // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
