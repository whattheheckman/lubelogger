// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'odometer_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OdometerRecord _$OdometerRecordFromJson(Map<String, dynamic> json) {
  return _OdometerRecord.fromJson(json);
}

/// @nodoc
mixin _$OdometerRecord {
  int get id => throw _privateConstructorUsedError;
  int? get remoteId => throw _privateConstructorUsedError;
  int get vehicleId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  double get mileage => throw _privateConstructorUsedError;
  double get initialMileage => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;

  /// Serializes this OdometerRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OdometerRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OdometerRecordCopyWith<OdometerRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OdometerRecordCopyWith<$Res> {
  factory $OdometerRecordCopyWith(
    OdometerRecord value,
    $Res Function(OdometerRecord) then,
  ) = _$OdometerRecordCopyWithImpl<$Res, OdometerRecord>;
  @useResult
  $Res call({
    int id,
    int? remoteId,
    int vehicleId,
    DateTime date,
    double mileage,
    double initialMileage,
    String notes,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class _$OdometerRecordCopyWithImpl<$Res, $Val extends OdometerRecord>
    implements $OdometerRecordCopyWith<$Res> {
  _$OdometerRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OdometerRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? vehicleId = null,
    Object? date = null,
    Object? mileage = null,
    Object? initialMileage = null,
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
            initialMileage: null == initialMileage
                ? _value.initialMileage
                : initialMileage // ignore: cast_nullable_to_non_nullable
                      as double,
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
abstract class _$$OdometerRecordImplCopyWith<$Res>
    implements $OdometerRecordCopyWith<$Res> {
  factory _$$OdometerRecordImplCopyWith(
    _$OdometerRecordImpl value,
    $Res Function(_$OdometerRecordImpl) then,
  ) = __$$OdometerRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int? remoteId,
    int vehicleId,
    DateTime date,
    double mileage,
    double initialMileage,
    String notes,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class __$$OdometerRecordImplCopyWithImpl<$Res>
    extends _$OdometerRecordCopyWithImpl<$Res, _$OdometerRecordImpl>
    implements _$$OdometerRecordImplCopyWith<$Res> {
  __$$OdometerRecordImplCopyWithImpl(
    _$OdometerRecordImpl _value,
    $Res Function(_$OdometerRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OdometerRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? vehicleId = null,
    Object? date = null,
    Object? mileage = null,
    Object? initialMileage = null,
    Object? notes = null,
    Object? updatedAt = null,
    Object? syncStatus = null,
  }) {
    return _then(
      _$OdometerRecordImpl(
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
        initialMileage: null == initialMileage
            ? _value.initialMileage
            : initialMileage // ignore: cast_nullable_to_non_nullable
                  as double,
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
class _$OdometerRecordImpl implements _OdometerRecord {
  const _$OdometerRecordImpl({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.date,
    this.mileage = 0.0,
    this.initialMileage = 0.0,
    this.notes = '',
    required this.updatedAt,
    this.syncStatus = 'synced',
  });

  factory _$OdometerRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$OdometerRecordImplFromJson(json);

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
  final double initialMileage;
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
    return 'OdometerRecord(id: $id, remoteId: $remoteId, vehicleId: $vehicleId, date: $date, mileage: $mileage, initialMileage: $initialMileage, notes: $notes, updatedAt: $updatedAt, syncStatus: $syncStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OdometerRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.initialMileage, initialMileage) ||
                other.initialMileage == initialMileage) &&
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
    initialMileage,
    notes,
    updatedAt,
    syncStatus,
  );

  /// Create a copy of OdometerRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OdometerRecordImplCopyWith<_$OdometerRecordImpl> get copyWith =>
      __$$OdometerRecordImplCopyWithImpl<_$OdometerRecordImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OdometerRecordImplToJson(this);
  }
}

abstract class _OdometerRecord implements OdometerRecord {
  const factory _OdometerRecord({
    required final int id,
    final int? remoteId,
    required final int vehicleId,
    required final DateTime date,
    final double mileage,
    final double initialMileage,
    final String notes,
    required final DateTime updatedAt,
    final String syncStatus,
  }) = _$OdometerRecordImpl;

  factory _OdometerRecord.fromJson(Map<String, dynamic> json) =
      _$OdometerRecordImpl.fromJson;

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
  double get initialMileage;
  @override
  String get notes;
  @override
  DateTime get updatedAt;
  @override
  String get syncStatus;

  /// Create a copy of OdometerRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OdometerRecordImplCopyWith<_$OdometerRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
