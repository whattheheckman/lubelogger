// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tax_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaxRecord {

 int get id; int? get remoteId; int get vehicleId; DateTime get date; String get description; double get cost; bool get isRecurring; String get recurringInterval; String get notes; DateTime get updatedAt; String get syncStatus;
/// Create a copy of TaxRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaxRecordCopyWith<TaxRecord> get copyWith => _$TaxRecordCopyWithImpl<TaxRecord>(this as TaxRecord, _$identity);

  /// Serializes this TaxRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TaxRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaxRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.remoteId, _this.remoteId) || other.remoteId == _this.remoteId)&&(identical(other.vehicleId, _this.vehicleId) || other.vehicleId == _this.vehicleId)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.cost, _this.cost) || other.cost == _this.cost)&&(identical(other.isRecurring, _this.isRecurring) || other.isRecurring == _this.isRecurring)&&(identical(other.recurringInterval, _this.recurringInterval) || other.recurringInterval == _this.recurringInterval)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.syncStatus, _this.syncStatus) || other.syncStatus == _this.syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TaxRecord;
  return Object.hash(runtimeType,_this.id,_this.remoteId,_this.vehicleId,_this.date,_this.description,_this.cost,_this.isRecurring,_this.recurringInterval,_this.notes,_this.updatedAt,_this.syncStatus);
}

@override
String toString() {
  final _this = this as TaxRecord;
  return 'TaxRecord(id: ${_this.id}, remoteId: ${_this.remoteId}, vehicleId: ${_this.vehicleId}, date: ${_this.date}, description: ${_this.description}, cost: ${_this.cost}, isRecurring: ${_this.isRecurring}, recurringInterval: ${_this.recurringInterval}, notes: ${_this.notes}, updatedAt: ${_this.updatedAt}, syncStatus: ${_this.syncStatus})';
}


}

/// @nodoc
abstract mixin class $TaxRecordCopyWith<$Res>  {
  factory $TaxRecordCopyWith(TaxRecord value, $Res Function(TaxRecord) _then) = _$TaxRecordCopyWithImpl;
@useResult
$Res call({
 int id, int? remoteId, int vehicleId, DateTime date, String description, double cost, bool isRecurring, String recurringInterval, String notes, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class _$TaxRecordCopyWithImpl<$Res>
    implements $TaxRecordCopyWith<$Res> {
  _$TaxRecordCopyWithImpl(this._self, this._then);

  final TaxRecord _self;
  final $Res Function(TaxRecord) _then;

/// Create a copy of TaxRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? remoteId = freezed,Object? vehicleId = null,Object? date = null,Object? description = null,Object? cost = null,Object? isRecurring = null,Object? recurringInterval = null,Object? notes = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(TaxRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,isRecurring: null == isRecurring ? _self.isRecurring : isRecurring // ignore: cast_nullable_to_non_nullable
as bool,recurringInterval: null == recurringInterval ? _self.recurringInterval : recurringInterval // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TaxRecord].
extension TaxRecordPatterns on TaxRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaxRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaxRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaxRecord value)  $default,){
final _that = this;
switch (_that) {
case _TaxRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaxRecord value)?  $default,){
final _that = this;
switch (_that) {
case _TaxRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? remoteId,  int vehicleId,  DateTime date,  String description,  double cost,  bool isRecurring,  String recurringInterval,  String notes,  DateTime updatedAt,  String syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaxRecord() when $default != null:
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.date,_that.description,_that.cost,_that.isRecurring,_that.recurringInterval,_that.notes,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? remoteId,  int vehicleId,  DateTime date,  String description,  double cost,  bool isRecurring,  String recurringInterval,  String notes,  DateTime updatedAt,  String syncStatus)  $default,) {final _that = this;
switch (_that) {
case _TaxRecord():
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.date,_that.description,_that.cost,_that.isRecurring,_that.recurringInterval,_that.notes,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? remoteId,  int vehicleId,  DateTime date,  String description,  double cost,  bool isRecurring,  String recurringInterval,  String notes,  DateTime updatedAt,  String syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _TaxRecord() when $default != null:
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.date,_that.description,_that.cost,_that.isRecurring,_that.recurringInterval,_that.notes,_that.updatedAt,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaxRecord implements TaxRecord {
  const _TaxRecord({required this.id, this.remoteId, required this.vehicleId, required this.date, required this.description, this.cost = 0.0, this.isRecurring = false, this.recurringInterval = '', this.notes = '', required this.updatedAt, this.syncStatus = 'synced'});
  factory _TaxRecord.fromJson(Map<String, dynamic> json) => _$TaxRecordFromJson(json);

@override final  int id;
@override final  int? remoteId;
@override final  int vehicleId;
@override final  DateTime date;
@override final  String description;
@override@JsonKey() final  double cost;
@override@JsonKey() final  bool isRecurring;
@override@JsonKey() final  String recurringInterval;
@override@JsonKey() final  String notes;
@override final  DateTime updatedAt;
@override@JsonKey() final  String syncStatus;

/// Create a copy of TaxRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaxRecordCopyWith<_TaxRecord> get copyWith => __$TaxRecordCopyWithImpl<_TaxRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaxRecordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaxRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.date, date) || other.date == date)&&(identical(other.description, description) || other.description == description)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.isRecurring, isRecurring) || other.isRecurring == isRecurring)&&(identical(other.recurringInterval, recurringInterval) || other.recurringInterval == recurringInterval)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,remoteId,vehicleId,date,description,cost,isRecurring,recurringInterval,notes,updatedAt,syncStatus);
}

@override
String toString() {
    return 'TaxRecord(id: $id, remoteId: $remoteId, vehicleId: $vehicleId, date: $date, description: $description, cost: $cost, isRecurring: $isRecurring, recurringInterval: $recurringInterval, notes: $notes, updatedAt: $updatedAt, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$TaxRecordCopyWith<$Res> implements $TaxRecordCopyWith<$Res> {
  factory _$TaxRecordCopyWith(_TaxRecord value, $Res Function(_TaxRecord) _then) = __$TaxRecordCopyWithImpl;
@override @useResult
$Res call({
 int id, int? remoteId, int vehicleId, DateTime date, String description, double cost, bool isRecurring, String recurringInterval, String notes, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class __$TaxRecordCopyWithImpl<$Res>
    implements _$TaxRecordCopyWith<$Res> {
  __$TaxRecordCopyWithImpl(this._self, this._then);

  final _TaxRecord _self;
  final $Res Function(_TaxRecord) _then;

/// Create a copy of TaxRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? remoteId = freezed,Object? vehicleId = null,Object? date = null,Object? description = null,Object? cost = null,Object? isRecurring = null,Object? recurringInterval = null,Object? notes = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(_TaxRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,isRecurring: null == isRecurring ? _self.isRecurring : isRecurring // ignore: cast_nullable_to_non_nullable
as bool,recurringInterval: null == recurringInterval ? _self.recurringInterval : recurringInterval // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
