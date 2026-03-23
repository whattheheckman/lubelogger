// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return _Vehicle.fromJson(json);
}

/// @nodoc
mixin _$Vehicle {
  int get id => throw _privateConstructorUsedError;
  int? get remoteId => throw _privateConstructorUsedError;
  String get year => throw _privateConstructorUsedError;
  String get make => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  String get licensePlate => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  bool get isElectric => throw _privateConstructorUsedError;
  bool get isDiesel => throw _privateConstructorUsedError;
  bool get useHours => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  Map<String, dynamic> get extraFields => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;

  /// Serializes this Vehicle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleCopyWith<Vehicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCopyWith<$Res> {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) then) =
      _$VehicleCopyWithImpl<$Res, Vehicle>;
  @useResult
  $Res call({
    int id,
    int? remoteId,
    String year,
    String make,
    String model,
    String licensePlate,
    String? imagePath,
    bool isElectric,
    bool isDiesel,
    bool useHours,
    List<String> tags,
    Map<String, dynamic> extraFields,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class _$VehicleCopyWithImpl<$Res, $Val extends Vehicle>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? year = null,
    Object? make = null,
    Object? model = null,
    Object? licensePlate = null,
    Object? imagePath = freezed,
    Object? isElectric = null,
    Object? isDiesel = null,
    Object? useHours = null,
    Object? tags = null,
    Object? extraFields = null,
    Object? updatedAt = null,
    Object? syncStatus = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            remoteId: freezed == remoteId
                ? _value.remoteId
                : remoteId // ignore: cast_nullable_to_non_nullable
                      as int?,
            year: null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as String,
            make: null == make
                ? _value.make
                : make // ignore: cast_nullable_to_non_nullable
                      as String,
            model: null == model
                ? _value.model
                : model // ignore: cast_nullable_to_non_nullable
                      as String,
            licensePlate: null == licensePlate
                ? _value.licensePlate
                : licensePlate // ignore: cast_nullable_to_non_nullable
                      as String,
            imagePath: freezed == imagePath
                ? _value.imagePath
                : imagePath // ignore: cast_nullable_to_non_nullable
                      as String?,
            isElectric: null == isElectric
                ? _value.isElectric
                : isElectric // ignore: cast_nullable_to_non_nullable
                      as bool,
            isDiesel: null == isDiesel
                ? _value.isDiesel
                : isDiesel // ignore: cast_nullable_to_non_nullable
                      as bool,
            useHours: null == useHours
                ? _value.useHours
                : useHours // ignore: cast_nullable_to_non_nullable
                      as bool,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            extraFields: null == extraFields
                ? _value.extraFields
                : extraFields // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            syncStatus: null == syncStatus
                ? _value.syncStatus
                : syncStatus // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VehicleImplCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$$VehicleImplCopyWith(
    _$VehicleImpl value,
    $Res Function(_$VehicleImpl) then,
  ) = __$$VehicleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int? remoteId,
    String year,
    String make,
    String model,
    String licensePlate,
    String? imagePath,
    bool isElectric,
    bool isDiesel,
    bool useHours,
    List<String> tags,
    Map<String, dynamic> extraFields,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class __$$VehicleImplCopyWithImpl<$Res>
    extends _$VehicleCopyWithImpl<$Res, _$VehicleImpl>
    implements _$$VehicleImplCopyWith<$Res> {
  __$$VehicleImplCopyWithImpl(
    _$VehicleImpl _value,
    $Res Function(_$VehicleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? year = null,
    Object? make = null,
    Object? model = null,
    Object? licensePlate = null,
    Object? imagePath = freezed,
    Object? isElectric = null,
    Object? isDiesel = null,
    Object? useHours = null,
    Object? tags = null,
    Object? extraFields = null,
    Object? updatedAt = null,
    Object? syncStatus = null,
  }) {
    return _then(
      _$VehicleImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        remoteId: freezed == remoteId
            ? _value.remoteId
            : remoteId // ignore: cast_nullable_to_non_nullable
                  as int?,
        year: null == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as String,
        make: null == make
            ? _value.make
            : make // ignore: cast_nullable_to_non_nullable
                  as String,
        model: null == model
            ? _value.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String,
        licensePlate: null == licensePlate
            ? _value.licensePlate
            : licensePlate // ignore: cast_nullable_to_non_nullable
                  as String,
        imagePath: freezed == imagePath
            ? _value.imagePath
            : imagePath // ignore: cast_nullable_to_non_nullable
                  as String?,
        isElectric: null == isElectric
            ? _value.isElectric
            : isElectric // ignore: cast_nullable_to_non_nullable
                  as bool,
        isDiesel: null == isDiesel
            ? _value.isDiesel
            : isDiesel // ignore: cast_nullable_to_non_nullable
                  as bool,
        useHours: null == useHours
            ? _value.useHours
            : useHours // ignore: cast_nullable_to_non_nullable
                  as bool,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        extraFields: null == extraFields
            ? _value._extraFields
            : extraFields // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        syncStatus: null == syncStatus
            ? _value.syncStatus
            : syncStatus // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleImpl implements _Vehicle {
  const _$VehicleImpl({
    required this.id,
    this.remoteId,
    required this.year,
    required this.make,
    required this.model,
    this.licensePlate = '',
    this.imagePath,
    this.isElectric = false,
    this.isDiesel = false,
    this.useHours = false,
    final List<String> tags = const [],
    final Map<String, dynamic> extraFields = const {},
    required this.updatedAt,
    this.syncStatus = 'synced',
  }) : _tags = tags,
       _extraFields = extraFields;

  factory _$VehicleImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleImplFromJson(json);

  @override
  final int id;
  @override
  final int? remoteId;
  @override
  final String year;
  @override
  final String make;
  @override
  final String model;
  @override
  @JsonKey()
  final String licensePlate;
  @override
  final String? imagePath;
  @override
  @JsonKey()
  final bool isElectric;
  @override
  @JsonKey()
  final bool isDiesel;
  @override
  @JsonKey()
  final bool useHours;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final Map<String, dynamic> _extraFields;
  @override
  @JsonKey()
  Map<String, dynamic> get extraFields {
    if (_extraFields is EqualUnmodifiableMapView) return _extraFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_extraFields);
  }

  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final String syncStatus;

  @override
  String toString() {
    return 'Vehicle(id: $id, remoteId: $remoteId, year: $year, make: $make, model: $model, licensePlate: $licensePlate, imagePath: $imagePath, isElectric: $isElectric, isDiesel: $isDiesel, useHours: $useHours, tags: $tags, extraFields: $extraFields, updatedAt: $updatedAt, syncStatus: $syncStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.make, make) || other.make == make) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.licensePlate, licensePlate) ||
                other.licensePlate == licensePlate) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.isElectric, isElectric) ||
                other.isElectric == isElectric) &&
            (identical(other.isDiesel, isDiesel) ||
                other.isDiesel == isDiesel) &&
            (identical(other.useHours, useHours) ||
                other.useHours == useHours) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(
              other._extraFields,
              _extraFields,
            ) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    remoteId,
    year,
    make,
    model,
    licensePlate,
    imagePath,
    isElectric,
    isDiesel,
    useHours,
    const DeepCollectionEquality().hash(_tags),
    const DeepCollectionEquality().hash(_extraFields),
    updatedAt,
    syncStatus,
  );

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      __$$VehicleImplCopyWithImpl<_$VehicleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleImplToJson(this);
  }
}

abstract class _Vehicle implements Vehicle {
  const factory _Vehicle({
    required final int id,
    final int? remoteId,
    required final String year,
    required final String make,
    required final String model,
    final String licensePlate,
    final String? imagePath,
    final bool isElectric,
    final bool isDiesel,
    final bool useHours,
    final List<String> tags,
    final Map<String, dynamic> extraFields,
    required final DateTime updatedAt,
    final String syncStatus,
  }) = _$VehicleImpl;

  factory _Vehicle.fromJson(Map<String, dynamic> json) = _$VehicleImpl.fromJson;

  @override
  int get id;
  @override
  int? get remoteId;
  @override
  String get year;
  @override
  String get make;
  @override
  String get model;
  @override
  String get licensePlate;
  @override
  String? get imagePath;
  @override
  bool get isElectric;
  @override
  bool get isDiesel;
  @override
  bool get useHours;
  @override
  List<String> get tags;
  @override
  Map<String, dynamic> get extraFields;
  @override
  DateTime get updatedAt;
  @override
  String get syncStatus;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
