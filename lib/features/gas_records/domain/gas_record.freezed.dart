// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gas_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GasRecord _$GasRecordFromJson(Map<String, dynamic> json) {
  return _GasRecord.fromJson(json);
}

/// @nodoc
mixin _$GasRecord {
  int get id => throw _privateConstructorUsedError;
  int? get remoteId => throw _privateConstructorUsedError;
  int get vehicleId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  double get mileage => throw _privateConstructorUsedError;
  double get gallons => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  bool get isFillToFull => throw _privateConstructorUsedError;
  bool get missedFuelUp => throw _privateConstructorUsedError;
  double? get mpg => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;

  /// Serializes this GasRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GasRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GasRecordCopyWith<GasRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GasRecordCopyWith<$Res> {
  factory $GasRecordCopyWith(GasRecord value, $Res Function(GasRecord) then) =
      _$GasRecordCopyWithImpl<$Res, GasRecord>;
  @useResult
  $Res call({
    int id,
    int? remoteId,
    int vehicleId,
    DateTime date,
    double mileage,
    double gallons,
    double cost,
    bool isFillToFull,
    bool missedFuelUp,
    double? mpg,
    String notes,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class _$GasRecordCopyWithImpl<$Res, $Val extends GasRecord>
    implements $GasRecordCopyWith<$Res> {
  _$GasRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GasRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? vehicleId = null,
    Object? date = null,
    Object? mileage = null,
    Object? gallons = null,
    Object? cost = null,
    Object? isFillToFull = null,
    Object? missedFuelUp = null,
    Object? mpg = freezed,
    Object? notes = null,
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
            vehicleId: null == vehicleId
                ? _value.vehicleId
                : vehicleId // ignore: cast_nullable_to_non_nullable
                      as int,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            mileage: null == mileage
                ? _value.mileage
                : mileage // ignore: cast_nullable_to_non_nullable
                      as double,
            gallons: null == gallons
                ? _value.gallons
                : gallons // ignore: cast_nullable_to_non_nullable
                      as double,
            cost: null == cost
                ? _value.cost
                : cost // ignore: cast_nullable_to_non_nullable
                      as double,
            isFillToFull: null == isFillToFull
                ? _value.isFillToFull
                : isFillToFull // ignore: cast_nullable_to_non_nullable
                      as bool,
            missedFuelUp: null == missedFuelUp
                ? _value.missedFuelUp
                : missedFuelUp // ignore: cast_nullable_to_non_nullable
                      as bool,
            mpg: freezed == mpg
                ? _value.mpg
                : mpg // ignore: cast_nullable_to_non_nullable
                      as double?,
            notes: null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$GasRecordImplCopyWith<$Res>
    implements $GasRecordCopyWith<$Res> {
  factory _$$GasRecordImplCopyWith(
    _$GasRecordImpl value,
    $Res Function(_$GasRecordImpl) then,
  ) = __$$GasRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int? remoteId,
    int vehicleId,
    DateTime date,
    double mileage,
    double gallons,
    double cost,
    bool isFillToFull,
    bool missedFuelUp,
    double? mpg,
    String notes,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class __$$GasRecordImplCopyWithImpl<$Res>
    extends _$GasRecordCopyWithImpl<$Res, _$GasRecordImpl>
    implements _$$GasRecordImplCopyWith<$Res> {
  __$$GasRecordImplCopyWithImpl(
    _$GasRecordImpl _value,
    $Res Function(_$GasRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GasRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? vehicleId = null,
    Object? date = null,
    Object? mileage = null,
    Object? gallons = null,
    Object? cost = null,
    Object? isFillToFull = null,
    Object? missedFuelUp = null,
    Object? mpg = freezed,
    Object? notes = null,
    Object? updatedAt = null,
    Object? syncStatus = null,
  }) {
    return _then(
      _$GasRecordImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        remoteId: freezed == remoteId
            ? _value.remoteId
            : remoteId // ignore: cast_nullable_to_non_nullable
                  as int?,
        vehicleId: null == vehicleId
            ? _value.vehicleId
            : vehicleId // ignore: cast_nullable_to_non_nullable
                  as int,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        mileage: null == mileage
            ? _value.mileage
            : mileage // ignore: cast_nullable_to_non_nullable
                  as double,
        gallons: null == gallons
            ? _value.gallons
            : gallons // ignore: cast_nullable_to_non_nullable
                  as double,
        cost: null == cost
            ? _value.cost
            : cost // ignore: cast_nullable_to_non_nullable
                  as double,
        isFillToFull: null == isFillToFull
            ? _value.isFillToFull
            : isFillToFull // ignore: cast_nullable_to_non_nullable
                  as bool,
        missedFuelUp: null == missedFuelUp
            ? _value.missedFuelUp
            : missedFuelUp // ignore: cast_nullable_to_non_nullable
                  as bool,
        mpg: freezed == mpg
            ? _value.mpg
            : mpg // ignore: cast_nullable_to_non_nullable
                  as double?,
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$GasRecordImpl implements _GasRecord {
  const _$GasRecordImpl({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.date,
    this.mileage = 0.0,
    this.gallons = 0.0,
    this.cost = 0.0,
    this.isFillToFull = true,
    this.missedFuelUp = false,
    this.mpg,
    this.notes = '',
    required this.updatedAt,
    this.syncStatus = 'synced',
  });

  factory _$GasRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$GasRecordImplFromJson(json);

  @override
  final int id;
  @override
  final int? remoteId;
  @override
  final int vehicleId;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final double mileage;
  @override
  @JsonKey()
  final double gallons;
  @override
  @JsonKey()
  final double cost;
  @override
  @JsonKey()
  final bool isFillToFull;
  @override
  @JsonKey()
  final bool missedFuelUp;
  @override
  final double? mpg;
  @override
  @JsonKey()
  final String notes;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final String syncStatus;

  @override
  String toString() {
    return 'GasRecord(id: $id, remoteId: $remoteId, vehicleId: $vehicleId, date: $date, mileage: $mileage, gallons: $gallons, cost: $cost, isFillToFull: $isFillToFull, missedFuelUp: $missedFuelUp, mpg: $mpg, notes: $notes, updatedAt: $updatedAt, syncStatus: $syncStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GasRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.gallons, gallons) || other.gallons == gallons) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.isFillToFull, isFillToFull) ||
                other.isFillToFull == isFillToFull) &&
            (identical(other.missedFuelUp, missedFuelUp) ||
                other.missedFuelUp == missedFuelUp) &&
            (identical(other.mpg, mpg) || other.mpg == mpg) &&
            (identical(other.notes, notes) || other.notes == notes) &&
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
    vehicleId,
    date,
    mileage,
    gallons,
    cost,
    isFillToFull,
    missedFuelUp,
    mpg,
    notes,
    updatedAt,
    syncStatus,
  );

  /// Create a copy of GasRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GasRecordImplCopyWith<_$GasRecordImpl> get copyWith =>
      __$$GasRecordImplCopyWithImpl<_$GasRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GasRecordImplToJson(this);
  }
}

abstract class _GasRecord implements GasRecord {
  const factory _GasRecord({
    required final int id,
    final int? remoteId,
    required final int vehicleId,
    required final DateTime date,
    final double mileage,
    final double gallons,
    final double cost,
    final bool isFillToFull,
    final bool missedFuelUp,
    final double? mpg,
    final String notes,
    required final DateTime updatedAt,
    final String syncStatus,
  }) = _$GasRecordImpl;

  factory _GasRecord.fromJson(Map<String, dynamic> json) =
      _$GasRecordImpl.fromJson;

  @override
  int get id;
  @override
  int? get remoteId;
  @override
  int get vehicleId;
  @override
  DateTime get date;
  @override
  double get mileage;
  @override
  double get gallons;
  @override
  double get cost;
  @override
  bool get isFillToFull;
  @override
  bool get missedFuelUp;
  @override
  double? get mpg;
  @override
  String get notes;
  @override
  DateTime get updatedAt;
  @override
  String get syncStatus;

  /// Create a copy of GasRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GasRecordImplCopyWith<_$GasRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
