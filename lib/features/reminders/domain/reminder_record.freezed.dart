// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReminderRecord {

 int get id; int? get remoteId; int get vehicleId; String get description; String get reminderMetric; DateTime? get dateMetric; double? get mileageMetric; bool get isRecurring; String get notes; DateTime get updatedAt; String get syncStatus;
/// Create a copy of ReminderRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderRecordCopyWith<ReminderRecord> get copyWith => _$ReminderRecordCopyWithImpl<ReminderRecord>(this as ReminderRecord, _$identity);

  /// Serializes this ReminderRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReminderRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.remoteId, _this.remoteId) || other.remoteId == _this.remoteId)&&(identical(other.vehicleId, _this.vehicleId) || other.vehicleId == _this.vehicleId)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.reminderMetric, _this.reminderMetric) || other.reminderMetric == _this.reminderMetric)&&(identical(other.dateMetric, _this.dateMetric) || other.dateMetric == _this.dateMetric)&&(identical(other.mileageMetric, _this.mileageMetric) || other.mileageMetric == _this.mileageMetric)&&(identical(other.isRecurring, _this.isRecurring) || other.isRecurring == _this.isRecurring)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.syncStatus, _this.syncStatus) || other.syncStatus == _this.syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReminderRecord;
  return Object.hash(runtimeType,_this.id,_this.remoteId,_this.vehicleId,_this.description,_this.reminderMetric,_this.dateMetric,_this.mileageMetric,_this.isRecurring,_this.notes,_this.updatedAt,_this.syncStatus);
}

@override
String toString() {
  final _this = this as ReminderRecord;
  return 'ReminderRecord(id: ${_this.id}, remoteId: ${_this.remoteId}, vehicleId: ${_this.vehicleId}, description: ${_this.description}, reminderMetric: ${_this.reminderMetric}, dateMetric: ${_this.dateMetric}, mileageMetric: ${_this.mileageMetric}, isRecurring: ${_this.isRecurring}, notes: ${_this.notes}, updatedAt: ${_this.updatedAt}, syncStatus: ${_this.syncStatus})';
}


}

/// @nodoc
abstract mixin class $ReminderRecordCopyWith<$Res>  {
  factory $ReminderRecordCopyWith(ReminderRecord value, $Res Function(ReminderRecord) _then) = _$ReminderRecordCopyWithImpl;
@useResult
$Res call({
 int id, int? remoteId, int vehicleId, String description, String reminderMetric, DateTime? dateMetric, double? mileageMetric, bool isRecurring, String notes, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class _$ReminderRecordCopyWithImpl<$Res>
    implements $ReminderRecordCopyWith<$Res> {
  _$ReminderRecordCopyWithImpl(this._self, this._then);

  final ReminderRecord _self;
  final $Res Function(ReminderRecord) _then;

/// Create a copy of ReminderRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? remoteId = freezed,Object? vehicleId = null,Object? description = null,Object? reminderMetric = null,Object? dateMetric = freezed,Object? mileageMetric = freezed,Object? isRecurring = null,Object? notes = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(ReminderRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,reminderMetric: null == reminderMetric ? _self.reminderMetric : reminderMetric // ignore: cast_nullable_to_non_nullable
as String,dateMetric: freezed == dateMetric ? _self.dateMetric : dateMetric // ignore: cast_nullable_to_non_nullable
as DateTime?,mileageMetric: freezed == mileageMetric ? _self.mileageMetric : mileageMetric // ignore: cast_nullable_to_non_nullable
as double?,isRecurring: null == isRecurring ? _self.isRecurring : isRecurring // ignore: cast_nullable_to_non_nullable
as bool,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReminderRecord].
extension ReminderRecordPatterns on ReminderRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderRecord value)  $default,){
final _that = this;
switch (_that) {
case _ReminderRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderRecord value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? remoteId,  int vehicleId,  String description,  String reminderMetric,  DateTime? dateMetric,  double? mileageMetric,  bool isRecurring,  String notes,  DateTime updatedAt,  String syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderRecord() when $default != null:
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.description,_that.reminderMetric,_that.dateMetric,_that.mileageMetric,_that.isRecurring,_that.notes,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? remoteId,  int vehicleId,  String description,  String reminderMetric,  DateTime? dateMetric,  double? mileageMetric,  bool isRecurring,  String notes,  DateTime updatedAt,  String syncStatus)  $default,) {final _that = this;
switch (_that) {
case _ReminderRecord():
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.description,_that.reminderMetric,_that.dateMetric,_that.mileageMetric,_that.isRecurring,_that.notes,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? remoteId,  int vehicleId,  String description,  String reminderMetric,  DateTime? dateMetric,  double? mileageMetric,  bool isRecurring,  String notes,  DateTime updatedAt,  String syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _ReminderRecord() when $default != null:
return $default(_that.id,_that.remoteId,_that.vehicleId,_that.description,_that.reminderMetric,_that.dateMetric,_that.mileageMetric,_that.isRecurring,_that.notes,_that.updatedAt,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReminderRecord implements ReminderRecord {
  const _ReminderRecord({required this.id, this.remoteId, required this.vehicleId, required this.description, this.reminderMetric = 'both', this.dateMetric, this.mileageMetric, this.isRecurring = false, this.notes = '', required this.updatedAt, this.syncStatus = 'synced'});
  factory _ReminderRecord.fromJson(Map<String, dynamic> json) => _$ReminderRecordFromJson(json);

@override final  int id;
@override final  int? remoteId;
@override final  int vehicleId;
@override final  String description;
@override@JsonKey() final  String reminderMetric;
@override final  DateTime? dateMetric;
@override final  double? mileageMetric;
@override@JsonKey() final  bool isRecurring;
@override@JsonKey() final  String notes;
@override final  DateTime updatedAt;
@override@JsonKey() final  String syncStatus;

/// Create a copy of ReminderRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderRecordCopyWith<_ReminderRecord> get copyWith => __$ReminderRecordCopyWithImpl<_ReminderRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReminderRecordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.description, description) || other.description == description)&&(identical(other.reminderMetric, reminderMetric) || other.reminderMetric == reminderMetric)&&(identical(other.dateMetric, dateMetric) || other.dateMetric == dateMetric)&&(identical(other.mileageMetric, mileageMetric) || other.mileageMetric == mileageMetric)&&(identical(other.isRecurring, isRecurring) || other.isRecurring == isRecurring)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,remoteId,vehicleId,description,reminderMetric,dateMetric,mileageMetric,isRecurring,notes,updatedAt,syncStatus);
}

@override
String toString() {
    return 'ReminderRecord(id: $id, remoteId: $remoteId, vehicleId: $vehicleId, description: $description, reminderMetric: $reminderMetric, dateMetric: $dateMetric, mileageMetric: $mileageMetric, isRecurring: $isRecurring, notes: $notes, updatedAt: $updatedAt, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$ReminderRecordCopyWith<$Res> implements $ReminderRecordCopyWith<$Res> {
  factory _$ReminderRecordCopyWith(_ReminderRecord value, $Res Function(_ReminderRecord) _then) = __$ReminderRecordCopyWithImpl;
@override @useResult
$Res call({
 int id, int? remoteId, int vehicleId, String description, String reminderMetric, DateTime? dateMetric, double? mileageMetric, bool isRecurring, String notes, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class __$ReminderRecordCopyWithImpl<$Res>
    implements _$ReminderRecordCopyWith<$Res> {
  __$ReminderRecordCopyWithImpl(this._self, this._then);

  final _ReminderRecord _self;
  final $Res Function(_ReminderRecord) _then;

/// Create a copy of ReminderRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? remoteId = freezed,Object? vehicleId = null,Object? description = null,Object? reminderMetric = null,Object? dateMetric = freezed,Object? mileageMetric = freezed,Object? isRecurring = null,Object? notes = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(_ReminderRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,reminderMetric: null == reminderMetric ? _self.reminderMetric : reminderMetric // ignore: cast_nullable_to_non_nullable
as String,dateMetric: freezed == dateMetric ? _self.dateMetric : dateMetric // ignore: cast_nullable_to_non_nullable
as DateTime?,mileageMetric: freezed == mileageMetric ? _self.mileageMetric : mileageMetric // ignore: cast_nullable_to_non_nullable
as double?,isRecurring: null == isRecurring ? _self.isRecurring : isRecurring // ignore: cast_nullable_to_non_nullable
as bool,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
