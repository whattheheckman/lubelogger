// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supply_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupplyRecord {

 int get id; int? get remoteId; int get vehicleId; String get partNumber; String get description; double get quantity; double get cost; String get notes; DateTime get updatedAt; String get syncStatus;
/// Create a copy of SupplyRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplyRecordCopyWith<SupplyRecord> get copyWith => _$SupplyRecordCopyWithImpl<SupplyRecord>(this as SupplyRecord, _$identity);

  /// Serializes this SupplyRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SupplyRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplyRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.remoteId, _this.remoteId) || other.remoteId == _this.remoteId)&&(identical(other.vehicleId, _this.vehicleId) || other.vehicleId == _this.vehicleId)&&(identical(other.partNumber, _this.partNumber) || other.partNumber == _this.partNumber)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.cost, _this.cost) || other.cost == _this.cost)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.syncStatus, _this.syncStatus) || other.syncStatus == _this.syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SupplyRecord;
  return Object.hash(runtimeType,_this.id,_this.remoteId,_this.vehicleId,_this.partNumber,_this.description,_this.quantity,_this.cost,_this.notes,_this.updatedAt,_this.syncStatus);
}

@override
String toString() {
  final _this = this as SupplyRecord;
  return 'SupplyRecord(id: ${_this.id}, remoteId: ${_this.remoteId}, vehicleId: ${_this.vehicleId}, partNumber: ${_this.partNumber}, description: ${_this.description}, quantity: ${_this.quantity}, cost: ${_this.cost}, notes: ${_this.notes}, updatedAt: ${_this.updatedAt}, syncStatus: ${_this.syncStatus})';
}


}

/// @nodoc
abstract mixin class $SupplyRecordCopyWith<$Res>  {
  factory $SupplyRecordCopyWith(SupplyRecord value, $Res Function(SupplyRecord) _then) = _$SupplyRecordCopyWithImpl;
@useResult
$Res call({
 int id, int? remoteId, int vehicleId, String partNumber, String description, double quantity, double cost, String notes, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class _$SupplyRecordCopyWithImpl<$Res>
    implements $SupplyRecordCopyWith<$Res> {
  _$SupplyRecordCopyWithImpl(this._self, this._then);

  final SupplyRecord _self;
  final $Res Function(SupplyRecord) _then;

/// Create a copy of SupplyRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? remoteId = freezed,Object? vehicleId = null,Object? partNumber = null,Object? description = null,Object? quantity = null,Object? cost = null,Object? notes = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(SupplyRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,partNumber: null == partNumber ? _self.partNumber : partNumber // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplyRecord].
extension SupplyRecordPatterns on SupplyRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplyRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplyRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplyRecord value)  $default,){
final _that = this;
switch (_that) {
case _SupplyRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplyRecord value)?  $default,){
final _that = this;
switch (_that) {
case _SupplyRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? remoteId,  int vehicleId,  String partNumber,  String description,  double quantity,  double cost,  String notes,  DateTime updatedAt,  String syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplyRecord() when $default != null:
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.partNumber,_that.description,_that.quantity,_that.cost,_that.notes,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? remoteId,  int vehicleId,  String partNumber,  String description,  double quantity,  double cost,  String notes,  DateTime updatedAt,  String syncStatus)  $default,) {final _that = this;
switch (_that) {
case _SupplyRecord():
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.partNumber,_that.description,_that.quantity,_that.cost,_that.notes,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? remoteId,  int vehicleId,  String partNumber,  String description,  double quantity,  double cost,  String notes,  DateTime updatedAt,  String syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _SupplyRecord() when $default != null:
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.partNumber,_that.description,_that.quantity,_that.cost,_that.notes,_that.updatedAt,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupplyRecord implements SupplyRecord {
  const _SupplyRecord({required this.id, this.remoteId, required this.vehicleId, this.partNumber = '', required this.description, this.quantity = 1.0, this.cost = 0.0, this.notes = '', required this.updatedAt, this.syncStatus = 'synced'});
  factory _SupplyRecord.fromJson(Map<String, dynamic> json) => _$SupplyRecordFromJson(json);

@override final  int id;
@override final  int? remoteId;
@override final  int vehicleId;
@override@JsonKey() final  String partNumber;
@override final  String description;
@override@JsonKey() final  double quantity;
@override@JsonKey() final  double cost;
@override@JsonKey() final  String notes;
@override final  DateTime updatedAt;
@override@JsonKey() final  String syncStatus;

/// Create a copy of SupplyRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplyRecordCopyWith<_SupplyRecord> get copyWith => __$SupplyRecordCopyWithImpl<_SupplyRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupplyRecordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplyRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.partNumber, partNumber) || other.partNumber == partNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,remoteId,vehicleId,partNumber,description,quantity,cost,notes,updatedAt,syncStatus);
}

@override
String toString() {
    return 'SupplyRecord(id: $id, remoteId: $remoteId, vehicleId: $vehicleId, partNumber: $partNumber, description: $description, quantity: $quantity, cost: $cost, notes: $notes, updatedAt: $updatedAt, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$SupplyRecordCopyWith<$Res> implements $SupplyRecordCopyWith<$Res> {
  factory _$SupplyRecordCopyWith(_SupplyRecord value, $Res Function(_SupplyRecord) _then) = __$SupplyRecordCopyWithImpl;
@override @useResult
$Res call({
 int id, int? remoteId, int vehicleId, String partNumber, String description, double quantity, double cost, String notes, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class __$SupplyRecordCopyWithImpl<$Res>
    implements _$SupplyRecordCopyWith<$Res> {
  __$SupplyRecordCopyWithImpl(this._self, this._then);

  final _SupplyRecord _self;
  final $Res Function(_SupplyRecord) _then;

/// Create a copy of SupplyRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? remoteId = freezed,Object? vehicleId = null,Object? partNumber = null,Object? description = null,Object? quantity = null,Object? cost = null,Object? notes = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(_SupplyRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,partNumber: null == partNumber ? _self.partNumber : partNumber // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
