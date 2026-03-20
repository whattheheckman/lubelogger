// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReminderRecord _$ReminderRecordFromJson(Map<String, dynamic> json) {
  return _ReminderRecord.fromJson(json);
}

/// @nodoc
mixin _$ReminderRecord {
  int get id => throw _privateConstructorUsedError;
  int? get remoteId => throw _privateConstructorUsedError;
  int get vehicleId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get reminderMetric =>
      throw _privateConstructorUsedError; // 'date', 'mileage', 'both'
  DateTime? get dateMetric => throw _privateConstructorUsedError;
  double? get mileageMetric => throw _privateConstructorUsedError;
  bool get isRecurring => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;

  /// Serializes this ReminderRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReminderRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderRecordCopyWith<ReminderRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderRecordCopyWith<$Res> {
  factory $ReminderRecordCopyWith(
    ReminderRecord value,
    $Res Function(ReminderRecord) then,
  ) = _$ReminderRecordCopyWithImpl<$Res, ReminderRecord>;
  @useResult
  $Res call({
    int id,
    int? remoteId,
    int vehicleId,
    String description,
    String reminderMetric,
    DateTime? dateMetric,
    double? mileageMetric,
    bool isRecurring,
    String notes,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class _$ReminderRecordCopyWithImpl<$Res, $Val extends ReminderRecord>
    implements $ReminderRecordCopyWith<$Res> {
  _$ReminderRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReminderRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? vehicleId = null,
    Object? description = null,
    Object? reminderMetric = null,
    Object? dateMetric = freezed,
    Object? mileageMetric = freezed,
    Object? isRecurring = null,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            reminderMetric: null == reminderMetric
                ? _value.reminderMetric
                : reminderMetric // ignore: cast_nullable_to_non_nullable
                      as String,
            dateMetric: freezed == dateMetric
                ? _value.dateMetric
                : dateMetric // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            mileageMetric: freezed == mileageMetric
                ? _value.mileageMetric
                : mileageMetric // ignore: cast_nullable_to_non_nullable
                      as double?,
            isRecurring: null == isRecurring
                ? _value.isRecurring
                : isRecurring // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$ReminderRecordImplCopyWith<$Res>
    implements $ReminderRecordCopyWith<$Res> {
  factory _$$ReminderRecordImplCopyWith(
    _$ReminderRecordImpl value,
    $Res Function(_$ReminderRecordImpl) then,
  ) = __$$ReminderRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int? remoteId,
    int vehicleId,
    String description,
    String reminderMetric,
    DateTime? dateMetric,
    double? mileageMetric,
    bool isRecurring,
    String notes,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class __$$ReminderRecordImplCopyWithImpl<$Res>
    extends _$ReminderRecordCopyWithImpl<$Res, _$ReminderRecordImpl>
    implements _$$ReminderRecordImplCopyWith<$Res> {
  __$$ReminderRecordImplCopyWithImpl(
    _$ReminderRecordImpl _value,
    $Res Function(_$ReminderRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReminderRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? vehicleId = null,
    Object? description = null,
    Object? reminderMetric = null,
    Object? dateMetric = freezed,
    Object? mileageMetric = freezed,
    Object? isRecurring = null,
    Object? notes = null,
    Object? updatedAt = null,
    Object? syncStatus = null,
  }) {
    return _then(
      _$ReminderRecordImpl(
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
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        reminderMetric: null == reminderMetric
            ? _value.reminderMetric
            : reminderMetric // ignore: cast_nullable_to_non_nullable
                  as String,
        dateMetric: freezed == dateMetric
            ? _value.dateMetric
            : dateMetric // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        mileageMetric: freezed == mileageMetric
            ? _value.mileageMetric
            : mileageMetric // ignore: cast_nullable_to_non_nullable
                  as double?,
        isRecurring: null == isRecurring
            ? _value.isRecurring
            : isRecurring // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$ReminderRecordImpl implements _ReminderRecord {
  const _$ReminderRecordImpl({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.description,
    this.reminderMetric = 'both',
    this.dateMetric,
    this.mileageMetric,
    this.isRecurring = false,
    this.notes = '',
    required this.updatedAt,
    this.syncStatus = 'synced',
  });

  factory _$ReminderRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderRecordImplFromJson(json);

  @override
  final int id;
  @override
  final int? remoteId;
  @override
  final int vehicleId;
  @override
  final String description;
  @override
  @JsonKey()
  final String reminderMetric;
  // 'date', 'mileage', 'both'
  @override
  final DateTime? dateMetric;
  @override
  final double? mileageMetric;
  @override
  @JsonKey()
  final bool isRecurring;
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
    return 'ReminderRecord(id: $id, remoteId: $remoteId, vehicleId: $vehicleId, description: $description, reminderMetric: $reminderMetric, dateMetric: $dateMetric, mileageMetric: $mileageMetric, isRecurring: $isRecurring, notes: $notes, updatedAt: $updatedAt, syncStatus: $syncStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.reminderMetric, reminderMetric) ||
                other.reminderMetric == reminderMetric) &&
            (identical(other.dateMetric, dateMetric) ||
                other.dateMetric == dateMetric) &&
            (identical(other.mileageMetric, mileageMetric) ||
                other.mileageMetric == mileageMetric) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
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
    description,
    reminderMetric,
    dateMetric,
    mileageMetric,
    isRecurring,
    notes,
    updatedAt,
    syncStatus,
  );

  /// Create a copy of ReminderRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderRecordImplCopyWith<_$ReminderRecordImpl> get copyWith =>
      __$$ReminderRecordImplCopyWithImpl<_$ReminderRecordImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderRecordImplToJson(this);
  }
}

abstract class _ReminderRecord implements ReminderRecord {
  const factory _ReminderRecord({
    required final int id,
    final int? remoteId,
    required final int vehicleId,
    required final String description,
    final String reminderMetric,
    final DateTime? dateMetric,
    final double? mileageMetric,
    final bool isRecurring,
    final String notes,
    required final DateTime updatedAt,
    final String syncStatus,
  }) = _$ReminderRecordImpl;

  factory _ReminderRecord.fromJson(Map<String, dynamic> json) =
      _$ReminderRecordImpl.fromJson;

  @override
  int get id;
  @override
  int? get remoteId;
  @override
  int get vehicleId;
  @override
  String get description;
  @override
  String get reminderMetric; // 'date', 'mileage', 'both'
  @override
  DateTime? get dateMetric;
  @override
  double? get mileageMetric;
  @override
  bool get isRecurring;
  @override
  String get notes;
  @override
  DateTime get updatedAt;
  @override
  String get syncStatus;

  /// Create a copy of ReminderRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderRecordImplCopyWith<_$ReminderRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
