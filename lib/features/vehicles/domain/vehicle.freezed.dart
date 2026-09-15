// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Vehicle {

 int get id; int? get remoteId; String get year; String get make; String get model; String get licensePlate; String? get imagePath; bool get isElectric; bool get isDiesel; bool get useHours; List<String> get tags; Map<String, dynamic> get extraFields; DateTime get updatedAt; String get syncStatus;
/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleCopyWith<Vehicle> get copyWith => _$VehicleCopyWithImpl<Vehicle>(this as Vehicle, _$identity);

  /// Serializes this Vehicle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Vehicle;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Vehicle&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.remoteId, _this.remoteId) || other.remoteId == _this.remoteId)&&(identical(other.year, _this.year) || other.year == _this.year)&&(identical(other.make, _this.make) || other.make == _this.make)&&(identical(other.model, _this.model) || other.model == _this.model)&&(identical(other.licensePlate, _this.licensePlate) || other.licensePlate == _this.licensePlate)&&(identical(other.imagePath, _this.imagePath) || other.imagePath == _this.imagePath)&&(identical(other.isElectric, _this.isElectric) || other.isElectric == _this.isElectric)&&(identical(other.isDiesel, _this.isDiesel) || other.isDiesel == _this.isDiesel)&&(identical(other.useHours, _this.useHours) || other.useHours == _this.useHours)&&const DeepCollectionEquality().equals(other.tags, _this.tags)&&const DeepCollectionEquality().equals(other.extraFields, _this.extraFields)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.syncStatus, _this.syncStatus) || other.syncStatus == _this.syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Vehicle;
  return Object.hash(runtimeType,_this.id,_this.remoteId,_this.year,_this.make,_this.model,_this.licensePlate,_this.imagePath,_this.isElectric,_this.isDiesel,_this.useHours,const DeepCollectionEquality().hash(_this.tags),const DeepCollectionEquality().hash(_this.extraFields),_this.updatedAt,_this.syncStatus);
}

@override
String toString() {
  final _this = this as Vehicle;
  return 'Vehicle(id: ${_this.id}, remoteId: ${_this.remoteId}, year: ${_this.year}, make: ${_this.make}, model: ${_this.model}, licensePlate: ${_this.licensePlate}, imagePath: ${_this.imagePath}, isElectric: ${_this.isElectric}, isDiesel: ${_this.isDiesel}, useHours: ${_this.useHours}, tags: ${_this.tags}, extraFields: ${_this.extraFields}, updatedAt: ${_this.updatedAt}, syncStatus: ${_this.syncStatus})';
}


}

/// @nodoc
abstract mixin class $VehicleCopyWith<$Res>  {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) _then) = _$VehicleCopyWithImpl;
@useResult
$Res call({
 int id, int? remoteId, String year, String make, String model, String licensePlate, String? imagePath, bool isElectric, bool isDiesel, bool useHours, List<String> tags, Map<String, dynamic> extraFields, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class _$VehicleCopyWithImpl<$Res>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._self, this._then);

  final Vehicle _self;
  final $Res Function(Vehicle) _then;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? remoteId = freezed,Object? year = null,Object? make = null,Object? model = null,Object? licensePlate = null,Object? imagePath = freezed,Object? isElectric = null,Object? isDiesel = null,Object? useHours = null,Object? tags = null,Object? extraFields = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(Vehicle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,licensePlate: null == licensePlate ? _self.licensePlate : licensePlate // ignore: cast_nullable_to_non_nullable
as String,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,isElectric: null == isElectric ? _self.isElectric : isElectric // ignore: cast_nullable_to_non_nullable
as bool,isDiesel: null == isDiesel ? _self.isDiesel : isDiesel // ignore: cast_nullable_to_non_nullable
as bool,useHours: null == useHours ? _self.useHours : useHours // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,extraFields: null == extraFields ? _self.extraFields : extraFields // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Vehicle].
extension VehiclePatterns on Vehicle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Vehicle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Vehicle value)  $default,){
final _that = this;
switch (_that) {
case _Vehicle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Vehicle value)?  $default,){
final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? remoteId,  String year,  String make,  String model,  String licensePlate,  String? imagePath,  bool isElectric,  bool isDiesel,  bool useHours,  List<String> tags,  Map<String, dynamic> extraFields,  DateTime updatedAt,  String syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that.id,_that.remoteId,_that.year,_that.make,_that.model,_that.licensePlate,_that.imagePath,_that.isElectric,_that.isDiesel,_that.useHours,_that.tags,_that.extraFields,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? remoteId,  String year,  String make,  String model,  String licensePlate,  String? imagePath,  bool isElectric,  bool isDiesel,  bool useHours,  List<String> tags,  Map<String, dynamic> extraFields,  DateTime updatedAt,  String syncStatus)  $default,) {final _that = this;
switch (_that) {
case _Vehicle():
return $default(_that.id,_that.remoteId,_that.year,_that.make,_that.model,_that.licensePlate,_that.imagePath,_that.isElectric,_that.isDiesel,_that.useHours,_that.tags,_that.extraFields,_that.updatedAt,_that.syncStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? remoteId,  String year,  String make,  String model,  String licensePlate,  String? imagePath,  bool isElectric,  bool isDiesel,  bool useHours,  List<String> tags,  Map<String, dynamic> extraFields,  DateTime updatedAt,  String syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that.id,_that.remoteId,_that.year,_that.make,_that.model,_that.licensePlate,_that.imagePath,_that.isElectric,_that.isDiesel,_that.useHours,_that.tags,_that.extraFields,_that.updatedAt,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Vehicle implements Vehicle {
  const _Vehicle({required this.id, this.remoteId, required this.year, required this.make, required this.model, this.licensePlate = '', this.imagePath, this.isElectric = false, this.isDiesel = false, this.useHours = false,  List<String> tags = const [],  Map<String, dynamic> extraFields = const {}, required this.updatedAt, this.syncStatus = 'synced'}): _tags = tags,_extraFields = extraFields;
  factory _Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);

@override final  int id;
@override final  int? remoteId;
@override final  String year;
@override final  String make;
@override final  String model;
@override@JsonKey() final  String licensePlate;
@override final  String? imagePath;
@override@JsonKey() final  bool isElectric;
@override@JsonKey() final  bool isDiesel;
@override@JsonKey() final  bool useHours;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  Map<String, dynamic> _extraFields;
@override@JsonKey() Map<String, dynamic> get extraFields {
  if (_extraFields is EqualUnmodifiableMapView) return _extraFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_extraFields);
}

@override final  DateTime updatedAt;
@override@JsonKey() final  String syncStatus;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleCopyWith<_Vehicle> get copyWith => __$VehicleCopyWithImpl<_Vehicle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vehicle&&(identical(other.id, id) || other.id == id)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.year, year) || other.year == year)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.licensePlate, licensePlate) || other.licensePlate == licensePlate)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.isElectric, isElectric) || other.isElectric == isElectric)&&(identical(other.isDiesel, isDiesel) || other.isDiesel == isDiesel)&&(identical(other.useHours, useHours) || other.useHours == useHours)&&const DeepCollectionEquality().equals(other.tags, _tags)&&const DeepCollectionEquality().equals(other.extraFields, _extraFields)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,remoteId,year,make,model,licensePlate,imagePath,isElectric,isDiesel,useHours,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_extraFields),updatedAt,syncStatus);
}

@override
String toString() {
    return 'Vehicle(id: $id, remoteId: $remoteId, year: $year, make: $make, model: $model, licensePlate: $licensePlate, imagePath: $imagePath, isElectric: $isElectric, isDiesel: $isDiesel, useHours: $useHours, tags: $tags, extraFields: $extraFields, updatedAt: $updatedAt, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$VehicleCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$VehicleCopyWith(_Vehicle value, $Res Function(_Vehicle) _then) = __$VehicleCopyWithImpl;
@override @useResult
$Res call({
 int id, int? remoteId, String year, String make, String model, String licensePlate, String? imagePath, bool isElectric, bool isDiesel, bool useHours, List<String> tags, Map<String, dynamic> extraFields, DateTime updatedAt, String syncStatus
});




}
/// @nodoc
class __$VehicleCopyWithImpl<$Res>
    implements _$VehicleCopyWith<$Res> {
  __$VehicleCopyWithImpl(this._self, this._then);

  final _Vehicle _self;
  final $Res Function(_Vehicle) _then;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? remoteId = freezed,Object? year = null,Object? make = null,Object? model = null,Object? licensePlate = null,Object? imagePath = freezed,Object? isElectric = null,Object? isDiesel = null,Object? useHours = null,Object? tags = null,Object? extraFields = null,Object? updatedAt = null,Object? syncStatus = null,}) {
  return _then(_Vehicle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as int?,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,make: null == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,licensePlate: null == licensePlate ? _self.licensePlate : licensePlate // ignore: cast_nullable_to_non_nullable
as String,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,isElectric: null == isElectric ? _self.isElectric : isElectric // ignore: cast_nullable_to_non_nullable
as bool,isDiesel: null == isDiesel ? _self.isDiesel : isDiesel // ignore: cast_nullable_to_non_nullable
as bool,useHours: null == useHours ? _self.useHours : useHours // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,extraFields: null == extraFields ? _self._extraFields : extraFields // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
