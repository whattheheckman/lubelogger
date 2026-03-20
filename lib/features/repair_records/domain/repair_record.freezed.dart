// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RepairRecord _$RepairRecordFromJson(Map<String, dynamic> json) {
  return _RepairRecord.fromJson(json);
}

/// @nodoc
mixin _$RepairRecord {
  int get id => throw _privateConstructorUsedError;
  int? get remoteId => throw _privateConstructorUsedError;
  int get vehicleId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  double get mileage => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;

  /// Serializes this RepairRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepairRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepairRecordCopyWith<RepairRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairRecordCopyWith<$Res> {
  factory $RepairRecordCopyWith(
    RepairRecord value,
    $Res Function(RepairRecord) then,
  ) = _$RepairRecordCopyWithImpl<$Res, RepairRecord>;
  @useResult
  $Res call({
    int id,
    int? remoteId,
    int vehicleId,
    DateTime date,
    double mileage,
    String description,
    double cost,
    String notes,
    List<String> tags,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class _$RepairRecordCopyWithImpl<$Res, $Val extends RepairRecord>
    implements $RepairRecordCopyWith<$Res> {
  _$RepairRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepairRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? vehicleId = null,
    Object? date = null,
    Object? mileage = null,
    Object? description = null,
    Object? cost = null,
    Object? notes = null,
    Object? tags = null,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            cost: null == cost
                ? _value.cost
                : cost // ignore: cast_nullable_to_non_nullable
                      as double,
            notes: null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
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
abstract class _$$RepairRecordImplCopyWith<$Res>
    implements $RepairRecordCopyWith<$Res> {
  factory _$$RepairRecordImplCopyWith(
    _$RepairRecordImpl value,
    $Res Function(_$RepairRecordImpl) then,
  ) = __$$RepairRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int? remoteId,
    int vehicleId,
    DateTime date,
    double mileage,
    String description,
    double cost,
    String notes,
    List<String> tags,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class __$$RepairRecordImplCopyWithImpl<$Res>
    extends _$RepairRecordCopyWithImpl<$Res, _$RepairRecordImpl>
    implements _$$RepairRecordImplCopyWith<$Res> {
  __$$RepairRecordImplCopyWithImpl(
    _$RepairRecordImpl _value,
    $Res Function(_$RepairRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RepairRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? vehicleId = null,
    Object? date = null,
    Object? mileage = null,
    Object? description = null,
    Object? cost = null,
    Object? notes = null,
    Object? tags = null,
    Object? updatedAt = null,
    Object? syncStatus = null,
  }) {
    return _then(
      _$RepairRecordImpl(
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
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        cost: null == cost
            ? _value.cost
            : cost // ignore: cast_nullable_to_non_nullable
                  as double,
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
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
class _$RepairRecordImpl implements _RepairRecord {
  const _$RepairRecordImpl({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.date,
    this.mileage = 0.0,
    required this.description,
    this.cost = 0.0,
    this.notes = '',
    final List<String> tags = const [],
    required this.updatedAt,
    this.syncStatus = 'synced',
  }) : _tags = tags;

  factory _$RepairRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepairRecordImplFromJson(json);

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
  final String description;
  @override
  @JsonKey()
  final double cost;
  @override
  @JsonKey()
  final String notes;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final String syncStatus;

  @override
  String toString() {
    return 'RepairRecord(id: $id, remoteId: $remoteId, vehicleId: $vehicleId, date: $date, mileage: $mileage, description: $description, cost: $cost, notes: $notes, tags: $tags, updatedAt: $updatedAt, syncStatus: $syncStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
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
    description,
    cost,
    notes,
    const DeepCollectionEquality().hash(_tags),
    updatedAt,
    syncStatus,
  );

  /// Create a copy of RepairRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairRecordImplCopyWith<_$RepairRecordImpl> get copyWith =>
      __$$RepairRecordImplCopyWithImpl<_$RepairRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairRecordImplToJson(this);
  }
}

abstract class _RepairRecord implements RepairRecord {
  const factory _RepairRecord({
    required final int id,
    final int? remoteId,
    required final int vehicleId,
    required final DateTime date,
    final double mileage,
    required final String description,
    final double cost,
    final String notes,
    final List<String> tags,
    required final DateTime updatedAt,
    final String syncStatus,
  }) = _$RepairRecordImpl;

  factory _RepairRecord.fromJson(Map<String, dynamic> json) =
      _$RepairRecordImpl.fromJson;

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
  String get description;
  @override
  double get cost;
  @override
  String get notes;
  @override
  List<String> get tags;
  @override
  DateTime get updatedAt;
  @override
  String get syncStatus;

  /// Create a copy of RepairRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepairRecordImplCopyWith<_$RepairRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
