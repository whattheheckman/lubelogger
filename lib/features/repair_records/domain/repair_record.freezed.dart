// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepairRecord {

 int get id; int? get remoteId; int get vehicleId; DateTime get date; double get mileage; String get description; double get cost; String get notes; List<String> get tags; DateTime get updatedAt; String get syncStatus;
/// Create a copy of RepairRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RepairRecordCopyWith<RepairRecord> get copyWith => _$RepairRecordCopyWithImpl<RepairRecord>(this as RepairRecord, _$identity);

  /// Serializes this RepairRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RepairRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepairRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.remoteId, _this.remoteId) || other.remoteId == _this.remoteId)&&(identical(other.vehicleId, _this.vehicleId) || other.vehicleId == _this.vehicleId)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.mileage, _this.mileage) || other.mileage == _this.mileage)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.cost, _this.cost) || other.cost == _this.cost)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&const DeepCollectionEquality().equals(other.tags, _this.tags)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.syncStatus, _this.syncStatus) || other.syncStatus == _this.syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RepairRecord;
  return Object.hash(runtimeType,_this.id,_this.remoteId,_this.vehicleId,_this.date,_this.mileage,_this.description,_this.cost,_this.notes,const DeepCollectionEquality().hash(_this.tags),_this.updatedAt,_this.syncStatus);
}

@override
String toString() {
  final _this = this as RepairRecord;
  return 'RepairRecord(id: ${_this.id}, remoteId: ${_this.remoteId}, vehicleId: ${_this.vehicleId}, date: ${_this.date}, mileage: ${_this.mileage}, description: ${_this.description}, cost: ${_this.cost}, notes: ${_this.notes}, tags: ${_this.tags}, updatedAt: ${_this.updatedAt}, syncStatus: ${_this.syncStatus})';
}


}

/// @nodoc
abstract mixin class $RepairRecordCopyWith<$Res>  {
  factory $RepairRecordCopyWith(RepairRecord value, $Res Function(RepairRecord) _then) = _$RepairRecordCopyWithImpl;
@useResult
$Res call({
 int id, int? remoteId, int vehicleId, DateTime date, double mileage, String description, double cost, String notes, List<String> tags, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class _$RepairRecordCopyWithImpl<$Res>
    implements $RepairRecordCopyWith<$Res> {
  _$RepairRecordCopyWithImpl(this._self, this._then);

  final RepairRecord _self;
  final $Res Function(RepairRecord) _then;

/// Create a copy of RepairRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? remoteId = freezed,Object? vehicleId = null,Object? date = null,Object? mileage = null,Object? description = null,Object? cost = null,Object? notes = null,Object? tags = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(RepairRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RepairRecord].
extension RepairRecordPatterns on RepairRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RepairRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RepairRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RepairRecord value)  $default,){
final _that = this;
switch (_that) {
case _RepairRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RepairRecord value)?  $default,){
final _that = this;
switch (_that) {
case _RepairRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? remoteId,  int vehicleId,  DateTime date,  double mileage,  String description,  double cost,  String notes,  List<String> tags,  DateTime updatedAt,  String syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RepairRecord() when $default != null:
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.date,_that.mileage,_that.description,_that.cost,_that.notes,_that.tags,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? remoteId,  int vehicleId,  DateTime date,  double mileage,  String description,  double cost,  String notes,  List<String> tags,  DateTime updatedAt,  String syncStatus)  $default,) {final _that = this;
switch (_that) {
case _RepairRecord():
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.date,_that.mileage,_that.description,_that.cost,_that.notes,_that.tags,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? remoteId,  int vehicleId,  DateTime date,  double mileage,  String description,  double cost,  String notes,  List<String> tags,  DateTime updatedAt,  String syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _RepairRecord() when $default != null:
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.date,_that.mileage,_that.description,_that.cost,_that.notes,_that.tags,_that.updatedAt,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RepairRecord implements RepairRecord {
  const _RepairRecord({required this.id, this.remoteId, required this.vehicleId, required this.date, this.mileage = 0.0, required this.description, this.cost = 0.0, this.notes = '',  List<String> tags = const [], required this.updatedAt, this.syncStatus = 'synced'}): _tags = tags;
  factory _RepairRecord.fromJson(Map<String, dynamic> json) => _$RepairRecordFromJson(json);

@override final  int id;
@override final  int? remoteId;
@override final  int vehicleId;
@override final  DateTime date;
@override@JsonKey() final  double mileage;
@override final  String description;
@override@JsonKey() final  double cost;
@override@JsonKey() final  String notes;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  DateTime updatedAt;
@override@JsonKey() final  String syncStatus;

/// Create a copy of RepairRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RepairRecordCopyWith<_RepairRecord> get copyWith => __$RepairRecordCopyWithImpl<_RepairRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RepairRecordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RepairRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.date, date) || other.date == date)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.description, description) || other.description == description)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.tags, _tags)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,remoteId,vehicleId,date,mileage,description,cost,notes,const DeepCollectionEquality().hash(_tags),updatedAt,syncStatus);
}

@override
String toString() {
    return 'RepairRecord(id: $id, remoteId: $remoteId, vehicleId: $vehicleId, date: $date, mileage: $mileage, description: $description, cost: $cost, notes: $notes, tags: $tags, updatedAt: $updatedAt, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$RepairRecordCopyWith<$Res> implements $RepairRecordCopyWith<$Res> {
  factory _$RepairRecordCopyWith(_RepairRecord value, $Res Function(_RepairRecord) _then) = __$RepairRecordCopyWithImpl;
@override @useResult
$Res call({
 int id, int? remoteId, int vehicleId, DateTime date, double mileage, String description, double cost, String notes, List<String> tags, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class __$RepairRecordCopyWithImpl<$Res>
    implements _$RepairRecordCopyWith<$Res> {
  __$RepairRecordCopyWithImpl(this._self, this._then);

  final _RepairRecord _self;
  final $Res Function(_RepairRecord) _then;

/// Create a copy of RepairRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? remoteId = freezed,Object? vehicleId = null,Object? date = null,Object? mileage = null,Object? description = null,Object? cost = null,Object? notes = null,Object? tags = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(_RepairRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
