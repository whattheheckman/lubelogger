// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NoteRecord _$NoteRecordFromJson(Map<String, dynamic> json) {
  return _NoteRecord.fromJson(json);
}

/// @nodoc
mixin _$NoteRecord {
  int get id => throw _privateConstructorUsedError;
  int? get remoteId => throw _privateConstructorUsedError;
  int get vehicleId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;

  /// Serializes this NoteRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NoteRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoteRecordCopyWith<NoteRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteRecordCopyWith<$Res> {
  factory $NoteRecordCopyWith(
    NoteRecord value,
    $Res Function(NoteRecord) then,
  ) = _$NoteRecordCopyWithImpl<$Res, NoteRecord>;
  @useResult
  $Res call({
    int id,
    int? remoteId,
    int vehicleId,
    String title,
    String body,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class _$NoteRecordCopyWithImpl<$Res, $Val extends NoteRecord>
    implements $NoteRecordCopyWith<$Res> {
  _$NoteRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoteRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? vehicleId = null,
    Object? title = null,
    Object? body = null,
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
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            body: null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
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
abstract class _$$NoteRecordImplCopyWith<$Res>
    implements $NoteRecordCopyWith<$Res> {
  factory _$$NoteRecordImplCopyWith(
    _$NoteRecordImpl value,
    $Res Function(_$NoteRecordImpl) then,
  ) = __$$NoteRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int? remoteId,
    int vehicleId,
    String title,
    String body,
    DateTime updatedAt,
    String syncStatus,
  });
}

/// @nodoc
class __$$NoteRecordImplCopyWithImpl<$Res>
    extends _$NoteRecordCopyWithImpl<$Res, _$NoteRecordImpl>
    implements _$$NoteRecordImplCopyWith<$Res> {
  __$$NoteRecordImplCopyWithImpl(
    _$NoteRecordImpl _value,
    $Res Function(_$NoteRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NoteRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? remoteId = freezed,
    Object? vehicleId = null,
    Object? title = null,
    Object? body = null,
    Object? updatedAt = null,
    Object? syncStatus = null,
  }) {
    return _then(
      _$NoteRecordImpl(
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
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        body: null == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
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
class _$NoteRecordImpl implements _NoteRecord {
  const _$NoteRecordImpl({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.title,
    this.body = '',
    required this.updatedAt,
    this.syncStatus = 'synced',
  });

  factory _$NoteRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteRecordImplFromJson(json);

  @override
  final int id;
  @override
  final int? remoteId;
  @override
  final int vehicleId;
  @override
  final String title;
  @override
  @JsonKey()
  final String body;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final String syncStatus;

  @override
  String toString() {
    return 'NoteRecord(id: $id, remoteId: $remoteId, vehicleId: $vehicleId, title: $title, body: $body, updatedAt: $updatedAt, syncStatus: $syncStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
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
    title,
    body,
    updatedAt,
    syncStatus,
  );

  /// Create a copy of NoteRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteRecordImplCopyWith<_$NoteRecordImpl> get copyWith =>
      __$$NoteRecordImplCopyWithImpl<_$NoteRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteRecordImplToJson(this);
  }
}

abstract class _NoteRecord implements NoteRecord {
  const factory _NoteRecord({
    required final int id,
    final int? remoteId,
    required final int vehicleId,
    required final String title,
    final String body,
    required final DateTime updatedAt,
    final String syncStatus,
  }) = _$NoteRecordImpl;

  factory _NoteRecord.fromJson(Map<String, dynamic> json) =
      _$NoteRecordImpl.fromJson;

  @override
  int get id;
  @override
  int? get remoteId;
  @override
  int get vehicleId;
  @override
  String get title;
  @override
  String get body;
  @override
  DateTime get updatedAt;
  @override
  String get syncStatus;

  /// Create a copy of NoteRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoteRecordImplCopyWith<_$NoteRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
