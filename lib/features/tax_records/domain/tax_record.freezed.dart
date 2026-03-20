// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tax_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TaxRecord _$TaxRecordFromJson(Map<String, dynamic> json) {
  return _TaxRecord.fromJson(json);
}

/// @nodoc
mixin _$TaxRecord {
  int get id => throw _privateConstructorUsedError;
  int? get remoteId => throw _privateConstructorUsedError;
  int get vehicleId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  bool get isRecurring => throw _privateConstructorUsedError;
  String get recurringInterval => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;

  /// Serializes this TaxRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaxRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaxRecordCopyWith<TaxRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxRecordCopyWith<$Res> {
  factory $TaxRecordCopyWith(TaxRecord value, $Res Function(TaxRecord) then) =
      _$TaxRecordCopyWithImpl<$Res, TaxRecord>;
  @useResult
  $Res call({
    int id,
    int? remoteId,
    int vehicleId,
    DateTime date,
    String description,
    double cost,
    bool isRecurring,
    String recurringInterval,
    String notes,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class _$TaxRecordCopyWithImpl<$Res, $Val extends TaxRecord>
    implements $TaxRecordCopyWith<$Res> {
  _$TaxRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaxRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? vehicleId = null,
    Object? date = null,
    Object? description = null,
    Object? cost = null,
    Object? isRecurring = null,
    Object? recurringInterval = null,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            cost: null == cost
                ? _value.cost
                : cost // ignore: cast_nullable_to_non_nullable
                      as double,
            isRecurring: null == isRecurring
                ? _value.isRecurring
                : isRecurring // ignore: cast_nullable_to_non_nullable
                      as bool,
            recurringInterval: null == recurringInterval
                ? _value.recurringInterval
                : recurringInterval // ignore: cast_nullable_to_non_nullable
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
abstract class _$$TaxRecordImplCopyWith<$Res>
    implements $TaxRecordCopyWith<$Res> {
  factory _$$TaxRecordImplCopyWith(
    _$TaxRecordImpl value,
    $Res Function(_$TaxRecordImpl) then,
  ) = __$$TaxRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int? remoteId,
    int vehicleId,
    DateTime date,
    String description,
    double cost,
    bool isRecurring,
    String recurringInterval,
    String notes,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class __$$TaxRecordImplCopyWithImpl<$Res>
    extends _$TaxRecordCopyWithImpl<$Res, _$TaxRecordImpl>
    implements _$$TaxRecordImplCopyWith<$Res> {
  __$$TaxRecordImplCopyWithImpl(
    _$TaxRecordImpl _value,
    $Res Function(_$TaxRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaxRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? vehicleId = null,
    Object? date = null,
    Object? description = null,
    Object? cost = null,
    Object? isRecurring = null,
    Object? recurringInterval = null,
    Object? notes = null,
    Object? updatedAt = null,
    Object? syncStatus = null,
  }) {
    return _then(
      _$TaxRecordImpl(
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
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        cost: null == cost
            ? _value.cost
            : cost // ignore: cast_nullable_to_non_nullable
                  as double,
        isRecurring: null == isRecurring
            ? _value.isRecurring
            : isRecurring // ignore: cast_nullable_to_non_nullable
                  as bool,
        recurringInterval: null == recurringInterval
            ? _value.recurringInterval
            : recurringInterval // ignore: cast_nullable_to_non_nullable
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
class _$TaxRecordImpl implements _TaxRecord {
  const _$TaxRecordImpl({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.date,
    required this.description,
    this.cost = 0.0,
    this.isRecurring = false,
    this.recurringInterval = '',
    this.notes = '',
    required this.updatedAt,
    this.syncStatus = 'synced',
  });

  factory _$TaxRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxRecordImplFromJson(json);

  @override
  final int id;
  @override
  final int? remoteId;
  @override
  final int vehicleId;
  @override
  final DateTime date;
  @override
  final String description;
  @override
  @JsonKey()
  final double cost;
  @override
  @JsonKey()
  final bool isRecurring;
  @override
  @JsonKey()
  final String recurringInterval;
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
    return 'TaxRecord(id: $id, remoteId: $remoteId, vehicleId: $vehicleId, date: $date, description: $description, cost: $cost, isRecurring: $isRecurring, recurringInterval: $recurringInterval, notes: $notes, updatedAt: $updatedAt, syncStatus: $syncStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.recurringInterval, recurringInterval) ||
                other.recurringInterval == recurringInterval) &&
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
    description,
    cost,
    isRecurring,
    recurringInterval,
    notes,
    updatedAt,
    syncStatus,
  );

  /// Create a copy of TaxRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxRecordImplCopyWith<_$TaxRecordImpl> get copyWith =>
      __$$TaxRecordImplCopyWithImpl<_$TaxRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxRecordImplToJson(this);
  }
}

abstract class _TaxRecord implements TaxRecord {
  const factory _TaxRecord({
    required final int id,
    final int? remoteId,
    required final int vehicleId,
    required final DateTime date,
    required final String description,
    final double cost,
    final bool isRecurring,
    final String recurringInterval,
    final String notes,
    required final DateTime updatedAt,
    final String syncStatus,
  }) = _$TaxRecordImpl;

  factory _TaxRecord.fromJson(Map<String, dynamic> json) =
      _$TaxRecordImpl.fromJson;

  @override
  int get id;
  @override
  int? get remoteId;
  @override
  int get vehicleId;
  @override
  DateTime get date;
  @override
  String get description;
  @override
  double get cost;
  @override
  bool get isRecurring;
  @override
  String get recurringInterval;
  @override
  String get notes;
  @override
  DateTime get updatedAt;
  @override
  String get syncStatus;

  /// Create a copy of TaxRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaxRecordImplCopyWith<_$TaxRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
