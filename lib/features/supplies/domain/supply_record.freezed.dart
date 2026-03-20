// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supply_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SupplyRecord _$SupplyRecordFromJson(Map<String, dynamic> json) {
  return _SupplyRecord.fromJson(json);
}

/// @nodoc
mixin _$SupplyRecord {
  int get id => throw _privateConstructorUsedError;
  int? get remoteId => throw _privateConstructorUsedError;
  int get vehicleId => throw _privateConstructorUsedError;
  String get partNumber => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;

  /// Serializes this SupplyRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SupplyRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupplyRecordCopyWith<SupplyRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupplyRecordCopyWith<$Res> {
  factory $SupplyRecordCopyWith(
    SupplyRecord value,
    $Res Function(SupplyRecord) then,
  ) = _$SupplyRecordCopyWithImpl<$Res, SupplyRecord>;
  @useResult
  $Res call({
    int id,
    int? remoteId,
    int vehicleId,
    String partNumber,
    String description,
    double quantity,
    double cost,
    String notes,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class _$SupplyRecordCopyWithImpl<$Res, $Val extends SupplyRecord>
    implements $SupplyRecordCopyWith<$Res> {
  _$SupplyRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupplyRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? vehicleId = null,
    Object? partNumber = null,
    Object? description = null,
    Object? quantity = null,
    Object? cost = null,
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
            partNumber: null == partNumber
                ? _value.partNumber
                : partNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as double,
            cost: null == cost
                ? _value.cost
                : cost // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SupplyRecordImplCopyWith<$Res>
    implements $SupplyRecordCopyWith<$Res> {
  factory _$$SupplyRecordImplCopyWith(
    _$SupplyRecordImpl value,
    $Res Function(_$SupplyRecordImpl) then,
  ) = __$$SupplyRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int? remoteId,
    int vehicleId,
    String partNumber,
    String description,
    double quantity,
    double cost,
    String notes,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class __$$SupplyRecordImplCopyWithImpl<$Res>
    extends _$SupplyRecordCopyWithImpl<$Res, _$SupplyRecordImpl>
    implements _$$SupplyRecordImplCopyWith<$Res> {
  __$$SupplyRecordImplCopyWithImpl(
    _$SupplyRecordImpl _value,
    $Res Function(_$SupplyRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SupplyRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? vehicleId = null,
    Object? partNumber = null,
    Object? description = null,
    Object? quantity = null,
    Object? cost = null,
    Object? notes = null,
    Object? updatedAt = null,
    Object? syncStatus = null,
  }) {
    return _then(
      _$SupplyRecordImpl(
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
        partNumber: null == partNumber
            ? _value.partNumber
            : partNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as double,
        cost: null == cost
            ? _value.cost
            : cost // ignore: cast_nullable_to_non_nullable
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
class _$SupplyRecordImpl implements _SupplyRecord {
  const _$SupplyRecordImpl({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    this.partNumber = '',
    required this.description,
    this.quantity = 1.0,
    this.cost = 0.0,
    this.notes = '',
    required this.updatedAt,
    this.syncStatus = 'synced',
  });

  factory _$SupplyRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupplyRecordImplFromJson(json);

  @override
  final int id;
  @override
  final int? remoteId;
  @override
  final int vehicleId;
  @override
  @JsonKey()
  final String partNumber;
  @override
  final String description;
  @override
  @JsonKey()
  final double quantity;
  @override
  @JsonKey()
  final double cost;
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
    return 'SupplyRecord(id: $id, remoteId: $remoteId, vehicleId: $vehicleId, partNumber: $partNumber, description: $description, quantity: $quantity, cost: $cost, notes: $notes, updatedAt: $updatedAt, syncStatus: $syncStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupplyRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.cost, cost) || other.cost == cost) &&
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
    partNumber,
    description,
    quantity,
    cost,
    notes,
    updatedAt,
    syncStatus,
  );

  /// Create a copy of SupplyRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupplyRecordImplCopyWith<_$SupplyRecordImpl> get copyWith =>
      __$$SupplyRecordImplCopyWithImpl<_$SupplyRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupplyRecordImplToJson(this);
  }
}

abstract class _SupplyRecord implements SupplyRecord {
  const factory _SupplyRecord({
    required final int id,
    final int? remoteId,
    required final int vehicleId,
    final String partNumber,
    required final String description,
    final double quantity,
    final double cost,
    final String notes,
    required final DateTime updatedAt,
    final String syncStatus,
  }) = _$SupplyRecordImpl;

  factory _SupplyRecord.fromJson(Map<String, dynamic> json) =
      _$SupplyRecordImpl.fromJson;

  @override
  int get id;
  @override
  int? get remoteId;
  @override
  int get vehicleId;
  @override
  String get partNumber;
  @override
  String get description;
  @override
  double get quantity;
  @override
  double get cost;
  @override
  String get notes;
  @override
  DateTime get updatedAt;
  @override
  String get syncStatus;

  /// Create a copy of SupplyRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupplyRecordImplCopyWith<_$SupplyRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
