// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gas_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GasRecord {

 int get id; int? get remoteId; int get vehicleId; DateTime get date; double get mileage; double get gallons; double get cost; bool get isFillToFull; bool get missedFuelUp; double? get mpg; String get notes; DateTime get updatedAt; String get syncStatus;
/// Create a copy of GasRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GasRecordCopyWith<GasRecord> get copyWith => _$GasRecordCopyWithImpl<GasRecord>(this as GasRecord, _$identity);

  /// Serializes this GasRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GasRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GasRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.remoteId, _this.remoteId) || other.remoteId == _this.remoteId)&&(identical(other.vehicleId, _this.vehicleId) || other.vehicleId == _this.vehicleId)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.mileage, _this.mileage) || other.mileage == _this.mileage)&&(identical(other.gallons, _this.gallons) || other.gallons == _this.gallons)&&(identical(other.cost, _this.cost) || other.cost == _this.cost)&&(identical(other.isFillToFull, _this.isFillToFull) || other.isFillToFull == _this.isFillToFull)&&(identical(other.missedFuelUp, _this.missedFuelUp) || other.missedFuelUp == _this.missedFuelUp)&&(identical(other.mpg, _this.mpg) || other.mpg == _this.mpg)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.syncStatus, _this.syncStatus) || other.syncStatus == _this.syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GasRecord;
  return Object.hash(runtimeType,_this.id,_this.remoteId,_this.vehicleId,_this.date,_this.mileage,_this.gallons,_this.cost,_this.isFillToFull,_this.missedFuelUp,_this.mpg,_this.notes,_this.updatedAt,_this.syncStatus);
}

@override
String toString() {
  final _this = this as GasRecord;
  return 'GasRecord(id: ${_this.id}, remoteId: ${_this.remoteId}, vehicleId: ${_this.vehicleId}, date: ${_this.date}, mileage: ${_this.mileage}, gallons: ${_this.gallons}, cost: ${_this.cost}, isFillToFull: ${_this.isFillToFull}, missedFuelUp: ${_this.missedFuelUp}, mpg: ${_this.mpg}, notes: ${_this.notes}, updatedAt: ${_this.updatedAt}, syncStatus: ${_this.syncStatus})';
}


}

/// @nodoc
abstract mixin class $GasRecordCopyWith<$Res>  {
  factory $GasRecordCopyWith(GasRecord value, $Res Function(GasRecord) _then) = _$GasRecordCopyWithImpl;
@useResult
$Res call({
 int id, int? remoteId, int vehicleId, DateTime date, double mileage, double gallons, double cost, bool isFillToFull, bool missedFuelUp, double? mpg, String notes, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class _$GasRecordCopyWithImpl<$Res>
    implements $GasRecordCopyWith<$Res> {
  _$GasRecordCopyWithImpl(this._self, this._then);

  final GasRecord _self;
  final $Res Function(GasRecord) _then;

/// Create a copy of GasRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? remoteId = freezed,Object? vehicleId = null,Object? date = null,Object? mileage = null,Object? gallons = null,Object? cost = null,Object? isFillToFull = null,Object? missedFuelUp = null,Object? mpg = freezed,Object? notes = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(GasRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as double,gallons: null == gallons ? _self.gallons : gallons // ignore: cast_nullable_to_non_nullable
as double,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,isFillToFull: null == isFillToFull ? _self.isFillToFull : isFillToFull // ignore: cast_nullable_to_non_nullable
as bool,missedFuelUp: null == missedFuelUp ? _self.missedFuelUp : missedFuelUp // ignore: cast_nullable_to_non_nullable
as bool,mpg: freezed == mpg ? _self.mpg : mpg // ignore: cast_nullable_to_non_nullable
as double?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GasRecord].
extension GasRecordPatterns on GasRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GasRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GasRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GasRecord value)  $default,){
final _that = this;
switch (_that) {
case _GasRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GasRecord value)?  $default,){
final _that = this;
switch (_that) {
case _GasRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? remoteId,  int vehicleId,  DateTime date,  double mileage,  double gallons,  double cost,  bool isFillToFull,  bool missedFuelUp,  double? mpg,  String notes,  DateTime updatedAt,  String syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GasRecord() when $default != null:
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.date,_that.mileage,_that.gallons,_that.cost,_that.isFillToFull,_that.missedFuelUp,_that.mpg,_that.notes,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? remoteId,  int vehicleId,  DateTime date,  double mileage,  double gallons,  double cost,  bool isFillToFull,  bool missedFuelUp,  double? mpg,  String notes,  DateTime updatedAt,  String syncStatus)  $default,) {final _that = this;
switch (_that) {
case _GasRecord():
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.date,_that.mileage,_that.gallons,_that.cost,_that.isFillToFull,_that.missedFuelUp,_that.mpg,_that.notes,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? remoteId,  int vehicleId,  DateTime date,  double mileage,  double gallons,  double cost,  bool isFillToFull,  bool missedFuelUp,  double? mpg,  String notes,  DateTime updatedAt,  String syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _GasRecord() when $default != null:
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.date,_that.mileage,_that.gallons,_that.cost,_that.isFillToFull,_that.missedFuelUp,_that.mpg,_that.notes,_that.updatedAt,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GasRecord implements GasRecord {
  const _GasRecord({required this.id, this.remoteId, required this.vehicleId, required this.date, this.mileage = 0.0, this.gallons = 0.0, this.cost = 0.0, this.isFillToFull = true, this.missedFuelUp = false, this.mpg, this.notes = '', required this.updatedAt, this.syncStatus = 'synced'});
  factory _GasRecord.fromJson(Map<String, dynamic> json) => _$GasRecordFromJson(json);

@override final  int id;
@override final  int? remoteId;
@override final  int vehicleId;
@override final  DateTime date;
@override@JsonKey() final  double mileage;
@override@JsonKey() final  double gallons;
@override@JsonKey() final  double cost;
@override@JsonKey() final  bool isFillToFull;
@override@JsonKey() final  bool missedFuelUp;
@override final  double? mpg;
@override@JsonKey() final  String notes;
@override final  DateTime updatedAt;
@override@JsonKey() final  String syncStatus;

/// Create a copy of GasRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GasRecordCopyWith<_GasRecord> get copyWith => __$GasRecordCopyWithImpl<_GasRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GasRecordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GasRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.date, date) || other.date == date)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.gallons, gallons) || other.gallons == gallons)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.isFillToFull, isFillToFull) || other.isFillToFull == isFillToFull)&&(identical(other.missedFuelUp, missedFuelUp) || other.missedFuelUp == missedFuelUp)&&(identical(other.mpg, mpg) || other.mpg == mpg)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,remoteId,vehicleId,date,mileage,gallons,cost,isFillToFull,missedFuelUp,mpg,notes,updatedAt,syncStatus);
}

@override
String toString() {
    return 'GasRecord(id: $id, remoteId: $remoteId, vehicleId: $vehicleId, date: $date, mileage: $mileage, gallons: $gallons, cost: $cost, isFillToFull: $isFillToFull, missedFuelUp: $missedFuelUp, mpg: $mpg, notes: $notes, updatedAt: $updatedAt, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$GasRecordCopyWith<$Res> implements $GasRecordCopyWith<$Res> {
  factory _$GasRecordCopyWith(_GasRecord value, $Res Function(_GasRecord) _then) = __$GasRecordCopyWithImpl;
@override @useResult
$Res call({
 int id, int? remoteId, int vehicleId, DateTime date, double mileage, double gallons, double cost, bool isFillToFull, bool missedFuelUp, double? mpg, String notes, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class __$GasRecordCopyWithImpl<$Res>
    implements _$GasRecordCopyWith<$Res> {
  __$GasRecordCopyWithImpl(this._self, this._then);

  final _GasRecord _self;
  final $Res Function(_GasRecord) _then;

/// Create a copy of GasRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? remoteId = freezed,Object? vehicleId = null,Object? date = null,Object? mileage = null,Object? gallons = null,Object? cost = null,Object? isFillToFull = null,Object? missedFuelUp = null,Object? mpg = freezed,Object? notes = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(_GasRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as double,gallons: null == gallons ? _self.gallons : gallons // ignore: cast_nullable_to_non_nullable
as double,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,isFillToFull: null == isFillToFull ? _self.isFillToFull : isFillToFull // ignore: cast_nullable_to_non_nullable
as bool,missedFuelUp: null == missedFuelUp ? _self.missedFuelUp : missedFuelUp // ignore: cast_nullable_to_non_nullable
as bool,mpg: freezed == mpg ? _self.mpg : mpg // ignore: cast_nullable_to_non_nullable
as double?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
