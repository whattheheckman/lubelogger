// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlanRecord _$PlanRecordFromJson(Map<String, dynamic> json) {
  return _PlanRecord.fromJson(json);
}

/// @nodoc
mixin _$PlanRecord {
  int get id => throw _privateConstructorUsedError;
  int? get remoteId => throw _privateConstructorUsedError;
  int get vehicleId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get priority =>
      throw _privateConstructorUsedError; // 'low', 'normal', 'high', 'critical'
  String get progress =>
      throw _privateConstructorUsedError; // 'Backlog', 'InProgress', 'Testing', 'Done'
  String get notes => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;

  /// Serializes this PlanRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlanRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanRecordCopyWith<PlanRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanRecordCopyWith<$Res> {
  factory $PlanRecordCopyWith(
    PlanRecord value,
    $Res Function(PlanRecord) then,
  ) = _$PlanRecordCopyWithImpl<$Res, PlanRecord>;
  @useResult
  $Res call({
    int id,
    int? remoteId,
    int vehicleId,
    String description,
    String priority,
    String progress,
    String notes,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class _$PlanRecordCopyWithImpl<$Res, $Val extends PlanRecord>
    implements $PlanRecordCopyWith<$Res> {
  _$PlanRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? vehicleId = null,
    Object? description = null,
    Object? priority = null,
    Object? progress = null,
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
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as String,
            progress: null == progress
                ? _value.progress
                : progress // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$PlanRecordImplCopyWith<$Res>
    implements $PlanRecordCopyWith<$Res> {
  factory _$$PlanRecordImplCopyWith(
    _$PlanRecordImpl value,
    $Res Function(_$PlanRecordImpl) then,
  ) = __$$PlanRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int? remoteId,
    int vehicleId,
    String description,
    String priority,
    String progress,
    String notes,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class __$$PlanRecordImplCopyWithImpl<$Res>
    extends _$PlanRecordCopyWithImpl<$Res, _$PlanRecordImpl>
    implements _$$PlanRecordImplCopyWith<$Res> {
  __$$PlanRecordImplCopyWithImpl(
    _$PlanRecordImpl _value,
    $Res Function(_$PlanRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlanRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? vehicleId = null,
    Object? description = null,
    Object? priority = null,
    Object? progress = null,
    Object? notes = null,
    Object? updatedAt = null,
    Object? syncStatus = null,
  }) {
    return _then(
      _$PlanRecordImpl(
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
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as String,
        progress: null == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$PlanRecordImpl implements _PlanRecord {
  const _$PlanRecordImpl({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.description,
    this.priority = 'normal',
    this.progress = 'Backlog',
    this.notes = '',
    required this.updatedAt,
    this.syncStatus = 'synced',
  });

  factory _$PlanRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanRecordImplFromJson(json);

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
  final String priority;
  // 'low', 'normal', 'high', 'critical'
  @override
  @JsonKey()
  final String progress;
  // 'Backlog', 'InProgress', 'Testing', 'Done'
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
    return 'PlanRecord(id: $id, remoteId: $remoteId, vehicleId: $vehicleId, description: $description, priority: $priority, progress: $progress, notes: $notes, updatedAt: $updatedAt, syncStatus: $syncStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
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
    priority,
    progress,
    notes,
    updatedAt,
    syncStatus,
  );

  /// Create a copy of PlanRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanRecordImplCopyWith<_$PlanRecordImpl> get copyWith =>
      __$$PlanRecordImplCopyWithImpl<_$PlanRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanRecordImplToJson(this);
  }
}

abstract class _PlanRecord implements PlanRecord {
  const factory _PlanRecord({
    required final int id,
    final int? remoteId,
    required final int vehicleId,
    required final String description,
    final String priority,
    final String progress,
    final String notes,
    required final DateTime updatedAt,
    final String syncStatus,
  }) = _$PlanRecordImpl;

  factory _PlanRecord.fromJson(Map<String, dynamic> json) =
      _$PlanRecordImpl.fromJson;

  @override
  int get id;
  @override
  int? get remoteId;
  @override
  int get vehicleId;
  @override
  String get description;
  @override
  String get priority; // 'low', 'normal', 'high', 'critical'
  @override
  String get progress; // 'Backlog', 'InProgress', 'Testing', 'Done'
  @override
  String get notes;
  @override
  DateTime get updatedAt;
  @override
  String get syncStatus;

  /// Create a copy of PlanRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanRecordImplCopyWith<_$PlanRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
