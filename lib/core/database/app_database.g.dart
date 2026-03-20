// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $VehiclesTable extends Vehicles with TableInfo<$VehiclesTable, Vehicle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehiclesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<String> year = GeneratedColumn<String>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _makeMeta = const VerificationMeta('make');
  @override
  late final GeneratedColumn<String> make = GeneratedColumn<String>(
    'make',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
    'model',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _licensePlateMeta = const VerificationMeta(
    'licensePlate',
  );
  @override
  late final GeneratedColumn<String> licensePlate = GeneratedColumn<String>(
    'license_plate',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _isElectricMeta = const VerificationMeta(
    'isElectric',
  );
  @override
  late final GeneratedColumn<bool> isElectric = GeneratedColumn<bool>(
    'is_electric',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_electric" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isDieselMeta = const VerificationMeta(
    'isDiesel',
  );
  @override
  late final GeneratedColumn<bool> isDiesel = GeneratedColumn<bool>(
    'is_diesel',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_diesel" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _useHoursMeta = const VerificationMeta(
    'useHours',
  );
  @override
  late final GeneratedColumn<bool> useHours = GeneratedColumn<bool>(
    'use_hours',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("use_hours" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _extraFieldsMeta = const VerificationMeta(
    'extraFields',
  );
  @override
  late final GeneratedColumn<String> extraFields = GeneratedColumn<String>(
    'extra_fields',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('{}'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    year,
    make,
    model,
    licensePlate,
    isElectric,
    isDiesel,
    useHours,
    tags,
    extraFields,
    updatedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Vehicle> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('make')) {
      context.handle(
        _makeMeta,
        make.isAcceptableOrUnknown(data['make']!, _makeMeta),
      );
    } else if (isInserting) {
      context.missing(_makeMeta);
    }
    if (data.containsKey('model')) {
      context.handle(
        _modelMeta,
        model.isAcceptableOrUnknown(data['model']!, _modelMeta),
      );
    } else if (isInserting) {
      context.missing(_modelMeta);
    }
    if (data.containsKey('license_plate')) {
      context.handle(
        _licensePlateMeta,
        licensePlate.isAcceptableOrUnknown(
          data['license_plate']!,
          _licensePlateMeta,
        ),
      );
    }
    if (data.containsKey('is_electric')) {
      context.handle(
        _isElectricMeta,
        isElectric.isAcceptableOrUnknown(data['is_electric']!, _isElectricMeta),
      );
    }
    if (data.containsKey('is_diesel')) {
      context.handle(
        _isDieselMeta,
        isDiesel.isAcceptableOrUnknown(data['is_diesel']!, _isDieselMeta),
      );
    }
    if (data.containsKey('use_hours')) {
      context.handle(
        _useHoursMeta,
        useHours.isAcceptableOrUnknown(data['use_hours']!, _useHoursMeta),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('extra_fields')) {
      context.handle(
        _extraFieldsMeta,
        extraFields.isAcceptableOrUnknown(
          data['extra_fields']!,
          _extraFieldsMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Vehicle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vehicle(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_id'],
      ),
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}year'],
      )!,
      make: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}make'],
      )!,
      model: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model'],
      )!,
      licensePlate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}license_plate'],
      )!,
      isElectric: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_electric'],
      )!,
      isDiesel: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_diesel'],
      )!,
      useHours: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}use_hours'],
      )!,
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      )!,
      extraFields: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extra_fields'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $VehiclesTable createAlias(String alias) {
    return $VehiclesTable(attachedDatabase, alias);
  }
}

class Vehicle extends DataClass implements Insertable<Vehicle> {
  final int id;
  final int? remoteId;
  final String year;
  final String make;
  final String model;
  final String licensePlate;
  final bool isElectric;
  final bool isDiesel;
  final bool useHours;
  final String tags;
  final String extraFields;
  final DateTime updatedAt;
  final String syncStatus;
  const Vehicle({
    required this.id,
    this.remoteId,
    required this.year,
    required this.make,
    required this.model,
    required this.licensePlate,
    required this.isElectric,
    required this.isDiesel,
    required this.useHours,
    required this.tags,
    required this.extraFields,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    map['year'] = Variable<String>(year);
    map['make'] = Variable<String>(make);
    map['model'] = Variable<String>(model);
    map['license_plate'] = Variable<String>(licensePlate);
    map['is_electric'] = Variable<bool>(isElectric);
    map['is_diesel'] = Variable<bool>(isDiesel);
    map['use_hours'] = Variable<bool>(useHours);
    map['tags'] = Variable<String>(tags);
    map['extra_fields'] = Variable<String>(extraFields);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  VehiclesCompanion toCompanion(bool nullToAbsent) {
    return VehiclesCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      year: Value(year),
      make: Value(make),
      model: Value(model),
      licensePlate: Value(licensePlate),
      isElectric: Value(isElectric),
      isDiesel: Value(isDiesel),
      useHours: Value(useHours),
      tags: Value(tags),
      extraFields: Value(extraFields),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory Vehicle.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Vehicle(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      year: serializer.fromJson<String>(json['year']),
      make: serializer.fromJson<String>(json['make']),
      model: serializer.fromJson<String>(json['model']),
      licensePlate: serializer.fromJson<String>(json['licensePlate']),
      isElectric: serializer.fromJson<bool>(json['isElectric']),
      isDiesel: serializer.fromJson<bool>(json['isDiesel']),
      useHours: serializer.fromJson<bool>(json['useHours']),
      tags: serializer.fromJson<String>(json['tags']),
      extraFields: serializer.fromJson<String>(json['extraFields']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<int?>(remoteId),
      'year': serializer.toJson<String>(year),
      'make': serializer.toJson<String>(make),
      'model': serializer.toJson<String>(model),
      'licensePlate': serializer.toJson<String>(licensePlate),
      'isElectric': serializer.toJson<bool>(isElectric),
      'isDiesel': serializer.toJson<bool>(isDiesel),
      'useHours': serializer.toJson<bool>(useHours),
      'tags': serializer.toJson<String>(tags),
      'extraFields': serializer.toJson<String>(extraFields),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  Vehicle copyWith({
    int? id,
    Value<int?> remoteId = const Value.absent(),
    String? year,
    String? make,
    String? model,
    String? licensePlate,
    bool? isElectric,
    bool? isDiesel,
    bool? useHours,
    String? tags,
    String? extraFields,
    DateTime? updatedAt,
    String? syncStatus,
  }) => Vehicle(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    year: year ?? this.year,
    make: make ?? this.make,
    model: model ?? this.model,
    licensePlate: licensePlate ?? this.licensePlate,
    isElectric: isElectric ?? this.isElectric,
    isDiesel: isDiesel ?? this.isDiesel,
    useHours: useHours ?? this.useHours,
    tags: tags ?? this.tags,
    extraFields: extraFields ?? this.extraFields,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  Vehicle copyWithCompanion(VehiclesCompanion data) {
    return Vehicle(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      year: data.year.present ? data.year.value : this.year,
      make: data.make.present ? data.make.value : this.make,
      model: data.model.present ? data.model.value : this.model,
      licensePlate: data.licensePlate.present
          ? data.licensePlate.value
          : this.licensePlate,
      isElectric: data.isElectric.present
          ? data.isElectric.value
          : this.isElectric,
      isDiesel: data.isDiesel.present ? data.isDiesel.value : this.isDiesel,
      useHours: data.useHours.present ? data.useHours.value : this.useHours,
      tags: data.tags.present ? data.tags.value : this.tags,
      extraFields: data.extraFields.present
          ? data.extraFields.value
          : this.extraFields,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Vehicle(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('year: $year, ')
          ..write('make: $make, ')
          ..write('model: $model, ')
          ..write('licensePlate: $licensePlate, ')
          ..write('isElectric: $isElectric, ')
          ..write('isDiesel: $isDiesel, ')
          ..write('useHours: $useHours, ')
          ..write('tags: $tags, ')
          ..write('extraFields: $extraFields, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    remoteId,
    year,
    make,
    model,
    licensePlate,
    isElectric,
    isDiesel,
    useHours,
    tags,
    extraFields,
    updatedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Vehicle &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.year == this.year &&
          other.make == this.make &&
          other.model == this.model &&
          other.licensePlate == this.licensePlate &&
          other.isElectric == this.isElectric &&
          other.isDiesel == this.isDiesel &&
          other.useHours == this.useHours &&
          other.tags == this.tags &&
          other.extraFields == this.extraFields &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class VehiclesCompanion extends UpdateCompanion<Vehicle> {
  final Value<int> id;
  final Value<int?> remoteId;
  final Value<String> year;
  final Value<String> make;
  final Value<String> model;
  final Value<String> licensePlate;
  final Value<bool> isElectric;
  final Value<bool> isDiesel;
  final Value<bool> useHours;
  final Value<String> tags;
  final Value<String> extraFields;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const VehiclesCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.year = const Value.absent(),
    this.make = const Value.absent(),
    this.model = const Value.absent(),
    this.licensePlate = const Value.absent(),
    this.isElectric = const Value.absent(),
    this.isDiesel = const Value.absent(),
    this.useHours = const Value.absent(),
    this.tags = const Value.absent(),
    this.extraFields = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  VehiclesCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String year,
    required String make,
    required String model,
    this.licensePlate = const Value.absent(),
    this.isElectric = const Value.absent(),
    this.isDiesel = const Value.absent(),
    this.useHours = const Value.absent(),
    this.tags = const Value.absent(),
    this.extraFields = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  }) : year = Value(year),
       make = Value(make),
       model = Value(model);
  static Insertable<Vehicle> custom({
    Expression<int>? id,
    Expression<int>? remoteId,
    Expression<String>? year,
    Expression<String>? make,
    Expression<String>? model,
    Expression<String>? licensePlate,
    Expression<bool>? isElectric,
    Expression<bool>? isDiesel,
    Expression<bool>? useHours,
    Expression<String>? tags,
    Expression<String>? extraFields,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (year != null) 'year': year,
      if (make != null) 'make': make,
      if (model != null) 'model': model,
      if (licensePlate != null) 'license_plate': licensePlate,
      if (isElectric != null) 'is_electric': isElectric,
      if (isDiesel != null) 'is_diesel': isDiesel,
      if (useHours != null) 'use_hours': useHours,
      if (tags != null) 'tags': tags,
      if (extraFields != null) 'extra_fields': extraFields,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  VehiclesCompanion copyWith({
    Value<int>? id,
    Value<int?>? remoteId,
    Value<String>? year,
    Value<String>? make,
    Value<String>? model,
    Value<String>? licensePlate,
    Value<bool>? isElectric,
    Value<bool>? isDiesel,
    Value<bool>? useHours,
    Value<String>? tags,
    Value<String>? extraFields,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return VehiclesCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      year: year ?? this.year,
      make: make ?? this.make,
      model: model ?? this.model,
      licensePlate: licensePlate ?? this.licensePlate,
      isElectric: isElectric ?? this.isElectric,
      isDiesel: isDiesel ?? this.isDiesel,
      useHours: useHours ?? this.useHours,
      tags: tags ?? this.tags,
      extraFields: extraFields ?? this.extraFields,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (year.present) {
      map['year'] = Variable<String>(year.value);
    }
    if (make.present) {
      map['make'] = Variable<String>(make.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (licensePlate.present) {
      map['license_plate'] = Variable<String>(licensePlate.value);
    }
    if (isElectric.present) {
      map['is_electric'] = Variable<bool>(isElectric.value);
    }
    if (isDiesel.present) {
      map['is_diesel'] = Variable<bool>(isDiesel.value);
    }
    if (useHours.present) {
      map['use_hours'] = Variable<bool>(useHours.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (extraFields.present) {
      map['extra_fields'] = Variable<String>(extraFields.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehiclesCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('year: $year, ')
          ..write('make: $make, ')
          ..write('model: $model, ')
          ..write('licensePlate: $licensePlate, ')
          ..write('isElectric: $isElectric, ')
          ..write('isDiesel: $isDiesel, ')
          ..write('useHours: $useHours, ')
          ..write('tags: $tags, ')
          ..write('extraFields: $extraFields, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $ServiceRecordsTable extends ServiceRecords
    with TableInfo<$ServiceRecordsTable, ServiceRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mileageMeta = const VerificationMeta(
    'mileage',
  );
  @override
  late final GeneratedColumn<double> mileage = GeneratedColumn<double>(
    'mileage',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
    'cost',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    vehicleId,
    date,
    mileage,
    description,
    cost,
    notes,
    tags,
    updatedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<ServiceRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('mileage')) {
      context.handle(
        _mileageMeta,
        mileage.isAcceptableOrUnknown(data['mileage']!, _mileageMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('cost')) {
      context.handle(
        _costMeta,
        cost.isAcceptableOrUnknown(data['cost']!, _costMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServiceRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_id'],
      ),
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      mileage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mileage'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      cost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $ServiceRecordsTable createAlias(String alias) {
    return $ServiceRecordsTable(attachedDatabase, alias);
  }
}

class ServiceRecord extends DataClass implements Insertable<ServiceRecord> {
  final int id;
  final int? remoteId;
  final int vehicleId;
  final DateTime date;
  final double mileage;
  final String description;
  final double cost;
  final String notes;
  final String tags;
  final DateTime updatedAt;
  final String syncStatus;
  const ServiceRecord({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.date,
    required this.mileage,
    required this.description,
    required this.cost,
    required this.notes,
    required this.tags,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    map['vehicle_id'] = Variable<int>(vehicleId);
    map['date'] = Variable<DateTime>(date);
    map['mileage'] = Variable<double>(mileage);
    map['description'] = Variable<String>(description);
    map['cost'] = Variable<double>(cost);
    map['notes'] = Variable<String>(notes);
    map['tags'] = Variable<String>(tags);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  ServiceRecordsCompanion toCompanion(bool nullToAbsent) {
    return ServiceRecordsCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      vehicleId: Value(vehicleId),
      date: Value(date),
      mileage: Value(mileage),
      description: Value(description),
      cost: Value(cost),
      notes: Value(notes),
      tags: Value(tags),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory ServiceRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServiceRecord(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      vehicleId: serializer.fromJson<int>(json['vehicleId']),
      date: serializer.fromJson<DateTime>(json['date']),
      mileage: serializer.fromJson<double>(json['mileage']),
      description: serializer.fromJson<String>(json['description']),
      cost: serializer.fromJson<double>(json['cost']),
      notes: serializer.fromJson<String>(json['notes']),
      tags: serializer.fromJson<String>(json['tags']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<int?>(remoteId),
      'vehicleId': serializer.toJson<int>(vehicleId),
      'date': serializer.toJson<DateTime>(date),
      'mileage': serializer.toJson<double>(mileage),
      'description': serializer.toJson<String>(description),
      'cost': serializer.toJson<double>(cost),
      'notes': serializer.toJson<String>(notes),
      'tags': serializer.toJson<String>(tags),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  ServiceRecord copyWith({
    int? id,
    Value<int?> remoteId = const Value.absent(),
    int? vehicleId,
    DateTime? date,
    double? mileage,
    String? description,
    double? cost,
    String? notes,
    String? tags,
    DateTime? updatedAt,
    String? syncStatus,
  }) => ServiceRecord(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    vehicleId: vehicleId ?? this.vehicleId,
    date: date ?? this.date,
    mileage: mileage ?? this.mileage,
    description: description ?? this.description,
    cost: cost ?? this.cost,
    notes: notes ?? this.notes,
    tags: tags ?? this.tags,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  ServiceRecord copyWithCompanion(ServiceRecordsCompanion data) {
    return ServiceRecord(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      date: data.date.present ? data.date.value : this.date,
      mileage: data.mileage.present ? data.mileage.value : this.mileage,
      description: data.description.present
          ? data.description.value
          : this.description,
      cost: data.cost.present ? data.cost.value : this.cost,
      notes: data.notes.present ? data.notes.value : this.notes,
      tags: data.tags.present ? data.tags.value : this.tags,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceRecord(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('date: $date, ')
          ..write('mileage: $mileage, ')
          ..write('description: $description, ')
          ..write('cost: $cost, ')
          ..write('notes: $notes, ')
          ..write('tags: $tags, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    remoteId,
    vehicleId,
    date,
    mileage,
    description,
    cost,
    notes,
    tags,
    updatedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceRecord &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.vehicleId == this.vehicleId &&
          other.date == this.date &&
          other.mileage == this.mileage &&
          other.description == this.description &&
          other.cost == this.cost &&
          other.notes == this.notes &&
          other.tags == this.tags &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class ServiceRecordsCompanion extends UpdateCompanion<ServiceRecord> {
  final Value<int> id;
  final Value<int?> remoteId;
  final Value<int> vehicleId;
  final Value<DateTime> date;
  final Value<double> mileage;
  final Value<String> description;
  final Value<double> cost;
  final Value<String> notes;
  final Value<String> tags;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const ServiceRecordsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.date = const Value.absent(),
    this.mileage = const Value.absent(),
    this.description = const Value.absent(),
    this.cost = const Value.absent(),
    this.notes = const Value.absent(),
    this.tags = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  ServiceRecordsCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required int vehicleId,
    required DateTime date,
    this.mileage = const Value.absent(),
    required String description,
    this.cost = const Value.absent(),
    this.notes = const Value.absent(),
    this.tags = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  }) : vehicleId = Value(vehicleId),
       date = Value(date),
       description = Value(description);
  static Insertable<ServiceRecord> custom({
    Expression<int>? id,
    Expression<int>? remoteId,
    Expression<int>? vehicleId,
    Expression<DateTime>? date,
    Expression<double>? mileage,
    Expression<String>? description,
    Expression<double>? cost,
    Expression<String>? notes,
    Expression<String>? tags,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (date != null) 'date': date,
      if (mileage != null) 'mileage': mileage,
      if (description != null) 'description': description,
      if (cost != null) 'cost': cost,
      if (notes != null) 'notes': notes,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  ServiceRecordsCompanion copyWith({
    Value<int>? id,
    Value<int?>? remoteId,
    Value<int>? vehicleId,
    Value<DateTime>? date,
    Value<double>? mileage,
    Value<String>? description,
    Value<double>? cost,
    Value<String>? notes,
    Value<String>? tags,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return ServiceRecordsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      vehicleId: vehicleId ?? this.vehicleId,
      date: date ?? this.date,
      mileage: mileage ?? this.mileage,
      description: description ?? this.description,
      cost: cost ?? this.cost,
      notes: notes ?? this.notes,
      tags: tags ?? this.tags,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (mileage.present) {
      map['mileage'] = Variable<double>(mileage.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceRecordsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('date: $date, ')
          ..write('mileage: $mileage, ')
          ..write('description: $description, ')
          ..write('cost: $cost, ')
          ..write('notes: $notes, ')
          ..write('tags: $tags, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $RepairRecordsTable extends RepairRecords
    with TableInfo<$RepairRecordsTable, RepairRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RepairRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mileageMeta = const VerificationMeta(
    'mileage',
  );
  @override
  late final GeneratedColumn<double> mileage = GeneratedColumn<double>(
    'mileage',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
    'cost',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    vehicleId,
    date,
    mileage,
    description,
    cost,
    notes,
    tags,
    updatedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'repair_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<RepairRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('mileage')) {
      context.handle(
        _mileageMeta,
        mileage.isAcceptableOrUnknown(data['mileage']!, _mileageMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('cost')) {
      context.handle(
        _costMeta,
        cost.isAcceptableOrUnknown(data['cost']!, _costMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RepairRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RepairRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_id'],
      ),
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      mileage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mileage'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      cost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $RepairRecordsTable createAlias(String alias) {
    return $RepairRecordsTable(attachedDatabase, alias);
  }
}

class RepairRecord extends DataClass implements Insertable<RepairRecord> {
  final int id;
  final int? remoteId;
  final int vehicleId;
  final DateTime date;
  final double mileage;
  final String description;
  final double cost;
  final String notes;
  final String tags;
  final DateTime updatedAt;
  final String syncStatus;
  const RepairRecord({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.date,
    required this.mileage,
    required this.description,
    required this.cost,
    required this.notes,
    required this.tags,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    map['vehicle_id'] = Variable<int>(vehicleId);
    map['date'] = Variable<DateTime>(date);
    map['mileage'] = Variable<double>(mileage);
    map['description'] = Variable<String>(description);
    map['cost'] = Variable<double>(cost);
    map['notes'] = Variable<String>(notes);
    map['tags'] = Variable<String>(tags);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  RepairRecordsCompanion toCompanion(bool nullToAbsent) {
    return RepairRecordsCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      vehicleId: Value(vehicleId),
      date: Value(date),
      mileage: Value(mileage),
      description: Value(description),
      cost: Value(cost),
      notes: Value(notes),
      tags: Value(tags),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory RepairRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RepairRecord(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      vehicleId: serializer.fromJson<int>(json['vehicleId']),
      date: serializer.fromJson<DateTime>(json['date']),
      mileage: serializer.fromJson<double>(json['mileage']),
      description: serializer.fromJson<String>(json['description']),
      cost: serializer.fromJson<double>(json['cost']),
      notes: serializer.fromJson<String>(json['notes']),
      tags: serializer.fromJson<String>(json['tags']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<int?>(remoteId),
      'vehicleId': serializer.toJson<int>(vehicleId),
      'date': serializer.toJson<DateTime>(date),
      'mileage': serializer.toJson<double>(mileage),
      'description': serializer.toJson<String>(description),
      'cost': serializer.toJson<double>(cost),
      'notes': serializer.toJson<String>(notes),
      'tags': serializer.toJson<String>(tags),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  RepairRecord copyWith({
    int? id,
    Value<int?> remoteId = const Value.absent(),
    int? vehicleId,
    DateTime? date,
    double? mileage,
    String? description,
    double? cost,
    String? notes,
    String? tags,
    DateTime? updatedAt,
    String? syncStatus,
  }) => RepairRecord(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    vehicleId: vehicleId ?? this.vehicleId,
    date: date ?? this.date,
    mileage: mileage ?? this.mileage,
    description: description ?? this.description,
    cost: cost ?? this.cost,
    notes: notes ?? this.notes,
    tags: tags ?? this.tags,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  RepairRecord copyWithCompanion(RepairRecordsCompanion data) {
    return RepairRecord(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      date: data.date.present ? data.date.value : this.date,
      mileage: data.mileage.present ? data.mileage.value : this.mileage,
      description: data.description.present
          ? data.description.value
          : this.description,
      cost: data.cost.present ? data.cost.value : this.cost,
      notes: data.notes.present ? data.notes.value : this.notes,
      tags: data.tags.present ? data.tags.value : this.tags,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RepairRecord(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('date: $date, ')
          ..write('mileage: $mileage, ')
          ..write('description: $description, ')
          ..write('cost: $cost, ')
          ..write('notes: $notes, ')
          ..write('tags: $tags, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    remoteId,
    vehicleId,
    date,
    mileage,
    description,
    cost,
    notes,
    tags,
    updatedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RepairRecord &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.vehicleId == this.vehicleId &&
          other.date == this.date &&
          other.mileage == this.mileage &&
          other.description == this.description &&
          other.cost == this.cost &&
          other.notes == this.notes &&
          other.tags == this.tags &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class RepairRecordsCompanion extends UpdateCompanion<RepairRecord> {
  final Value<int> id;
  final Value<int?> remoteId;
  final Value<int> vehicleId;
  final Value<DateTime> date;
  final Value<double> mileage;
  final Value<String> description;
  final Value<double> cost;
  final Value<String> notes;
  final Value<String> tags;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const RepairRecordsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.date = const Value.absent(),
    this.mileage = const Value.absent(),
    this.description = const Value.absent(),
    this.cost = const Value.absent(),
    this.notes = const Value.absent(),
    this.tags = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  RepairRecordsCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required int vehicleId,
    required DateTime date,
    this.mileage = const Value.absent(),
    required String description,
    this.cost = const Value.absent(),
    this.notes = const Value.absent(),
    this.tags = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  }) : vehicleId = Value(vehicleId),
       date = Value(date),
       description = Value(description);
  static Insertable<RepairRecord> custom({
    Expression<int>? id,
    Expression<int>? remoteId,
    Expression<int>? vehicleId,
    Expression<DateTime>? date,
    Expression<double>? mileage,
    Expression<String>? description,
    Expression<double>? cost,
    Expression<String>? notes,
    Expression<String>? tags,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (date != null) 'date': date,
      if (mileage != null) 'mileage': mileage,
      if (description != null) 'description': description,
      if (cost != null) 'cost': cost,
      if (notes != null) 'notes': notes,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  RepairRecordsCompanion copyWith({
    Value<int>? id,
    Value<int?>? remoteId,
    Value<int>? vehicleId,
    Value<DateTime>? date,
    Value<double>? mileage,
    Value<String>? description,
    Value<double>? cost,
    Value<String>? notes,
    Value<String>? tags,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return RepairRecordsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      vehicleId: vehicleId ?? this.vehicleId,
      date: date ?? this.date,
      mileage: mileage ?? this.mileage,
      description: description ?? this.description,
      cost: cost ?? this.cost,
      notes: notes ?? this.notes,
      tags: tags ?? this.tags,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (mileage.present) {
      map['mileage'] = Variable<double>(mileage.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RepairRecordsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('date: $date, ')
          ..write('mileage: $mileage, ')
          ..write('description: $description, ')
          ..write('cost: $cost, ')
          ..write('notes: $notes, ')
          ..write('tags: $tags, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $UpgradeRecordsTable extends UpgradeRecords
    with TableInfo<$UpgradeRecordsTable, UpgradeRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UpgradeRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mileageMeta = const VerificationMeta(
    'mileage',
  );
  @override
  late final GeneratedColumn<double> mileage = GeneratedColumn<double>(
    'mileage',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
    'cost',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    vehicleId,
    date,
    mileage,
    description,
    cost,
    notes,
    tags,
    updatedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'upgrade_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<UpgradeRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('mileage')) {
      context.handle(
        _mileageMeta,
        mileage.isAcceptableOrUnknown(data['mileage']!, _mileageMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('cost')) {
      context.handle(
        _costMeta,
        cost.isAcceptableOrUnknown(data['cost']!, _costMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UpgradeRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UpgradeRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_id'],
      ),
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      mileage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mileage'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      cost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $UpgradeRecordsTable createAlias(String alias) {
    return $UpgradeRecordsTable(attachedDatabase, alias);
  }
}

class UpgradeRecord extends DataClass implements Insertable<UpgradeRecord> {
  final int id;
  final int? remoteId;
  final int vehicleId;
  final DateTime date;
  final double mileage;
  final String description;
  final double cost;
  final String notes;
  final String tags;
  final DateTime updatedAt;
  final String syncStatus;
  const UpgradeRecord({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.date,
    required this.mileage,
    required this.description,
    required this.cost,
    required this.notes,
    required this.tags,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    map['vehicle_id'] = Variable<int>(vehicleId);
    map['date'] = Variable<DateTime>(date);
    map['mileage'] = Variable<double>(mileage);
    map['description'] = Variable<String>(description);
    map['cost'] = Variable<double>(cost);
    map['notes'] = Variable<String>(notes);
    map['tags'] = Variable<String>(tags);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  UpgradeRecordsCompanion toCompanion(bool nullToAbsent) {
    return UpgradeRecordsCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      vehicleId: Value(vehicleId),
      date: Value(date),
      mileage: Value(mileage),
      description: Value(description),
      cost: Value(cost),
      notes: Value(notes),
      tags: Value(tags),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory UpgradeRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UpgradeRecord(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      vehicleId: serializer.fromJson<int>(json['vehicleId']),
      date: serializer.fromJson<DateTime>(json['date']),
      mileage: serializer.fromJson<double>(json['mileage']),
      description: serializer.fromJson<String>(json['description']),
      cost: serializer.fromJson<double>(json['cost']),
      notes: serializer.fromJson<String>(json['notes']),
      tags: serializer.fromJson<String>(json['tags']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<int?>(remoteId),
      'vehicleId': serializer.toJson<int>(vehicleId),
      'date': serializer.toJson<DateTime>(date),
      'mileage': serializer.toJson<double>(mileage),
      'description': serializer.toJson<String>(description),
      'cost': serializer.toJson<double>(cost),
      'notes': serializer.toJson<String>(notes),
      'tags': serializer.toJson<String>(tags),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  UpgradeRecord copyWith({
    int? id,
    Value<int?> remoteId = const Value.absent(),
    int? vehicleId,
    DateTime? date,
    double? mileage,
    String? description,
    double? cost,
    String? notes,
    String? tags,
    DateTime? updatedAt,
    String? syncStatus,
  }) => UpgradeRecord(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    vehicleId: vehicleId ?? this.vehicleId,
    date: date ?? this.date,
    mileage: mileage ?? this.mileage,
    description: description ?? this.description,
    cost: cost ?? this.cost,
    notes: notes ?? this.notes,
    tags: tags ?? this.tags,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  UpgradeRecord copyWithCompanion(UpgradeRecordsCompanion data) {
    return UpgradeRecord(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      date: data.date.present ? data.date.value : this.date,
      mileage: data.mileage.present ? data.mileage.value : this.mileage,
      description: data.description.present
          ? data.description.value
          : this.description,
      cost: data.cost.present ? data.cost.value : this.cost,
      notes: data.notes.present ? data.notes.value : this.notes,
      tags: data.tags.present ? data.tags.value : this.tags,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UpgradeRecord(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('date: $date, ')
          ..write('mileage: $mileage, ')
          ..write('description: $description, ')
          ..write('cost: $cost, ')
          ..write('notes: $notes, ')
          ..write('tags: $tags, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    remoteId,
    vehicleId,
    date,
    mileage,
    description,
    cost,
    notes,
    tags,
    updatedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UpgradeRecord &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.vehicleId == this.vehicleId &&
          other.date == this.date &&
          other.mileage == this.mileage &&
          other.description == this.description &&
          other.cost == this.cost &&
          other.notes == this.notes &&
          other.tags == this.tags &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class UpgradeRecordsCompanion extends UpdateCompanion<UpgradeRecord> {
  final Value<int> id;
  final Value<int?> remoteId;
  final Value<int> vehicleId;
  final Value<DateTime> date;
  final Value<double> mileage;
  final Value<String> description;
  final Value<double> cost;
  final Value<String> notes;
  final Value<String> tags;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const UpgradeRecordsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.date = const Value.absent(),
    this.mileage = const Value.absent(),
    this.description = const Value.absent(),
    this.cost = const Value.absent(),
    this.notes = const Value.absent(),
    this.tags = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  UpgradeRecordsCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required int vehicleId,
    required DateTime date,
    this.mileage = const Value.absent(),
    required String description,
    this.cost = const Value.absent(),
    this.notes = const Value.absent(),
    this.tags = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  }) : vehicleId = Value(vehicleId),
       date = Value(date),
       description = Value(description);
  static Insertable<UpgradeRecord> custom({
    Expression<int>? id,
    Expression<int>? remoteId,
    Expression<int>? vehicleId,
    Expression<DateTime>? date,
    Expression<double>? mileage,
    Expression<String>? description,
    Expression<double>? cost,
    Expression<String>? notes,
    Expression<String>? tags,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (date != null) 'date': date,
      if (mileage != null) 'mileage': mileage,
      if (description != null) 'description': description,
      if (cost != null) 'cost': cost,
      if (notes != null) 'notes': notes,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  UpgradeRecordsCompanion copyWith({
    Value<int>? id,
    Value<int?>? remoteId,
    Value<int>? vehicleId,
    Value<DateTime>? date,
    Value<double>? mileage,
    Value<String>? description,
    Value<double>? cost,
    Value<String>? notes,
    Value<String>? tags,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return UpgradeRecordsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      vehicleId: vehicleId ?? this.vehicleId,
      date: date ?? this.date,
      mileage: mileage ?? this.mileage,
      description: description ?? this.description,
      cost: cost ?? this.cost,
      notes: notes ?? this.notes,
      tags: tags ?? this.tags,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (mileage.present) {
      map['mileage'] = Variable<double>(mileage.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UpgradeRecordsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('date: $date, ')
          ..write('mileage: $mileage, ')
          ..write('description: $description, ')
          ..write('cost: $cost, ')
          ..write('notes: $notes, ')
          ..write('tags: $tags, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $GasRecordsTable extends GasRecords
    with TableInfo<$GasRecordsTable, GasRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GasRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mileageMeta = const VerificationMeta(
    'mileage',
  );
  @override
  late final GeneratedColumn<double> mileage = GeneratedColumn<double>(
    'mileage',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _gallonsMeta = const VerificationMeta(
    'gallons',
  );
  @override
  late final GeneratedColumn<double> gallons = GeneratedColumn<double>(
    'gallons',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
    'cost',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _isFillToFullMeta = const VerificationMeta(
    'isFillToFull',
  );
  @override
  late final GeneratedColumn<bool> isFillToFull = GeneratedColumn<bool>(
    'is_fill_to_full',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_fill_to_full" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _missedFuelUpMeta = const VerificationMeta(
    'missedFuelUp',
  );
  @override
  late final GeneratedColumn<bool> missedFuelUp = GeneratedColumn<bool>(
    'missed_fuel_up',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("missed_fuel_up" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _mpgMeta = const VerificationMeta('mpg');
  @override
  late final GeneratedColumn<double> mpg = GeneratedColumn<double>(
    'mpg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'gas_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<GasRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('mileage')) {
      context.handle(
        _mileageMeta,
        mileage.isAcceptableOrUnknown(data['mileage']!, _mileageMeta),
      );
    }
    if (data.containsKey('gallons')) {
      context.handle(
        _gallonsMeta,
        gallons.isAcceptableOrUnknown(data['gallons']!, _gallonsMeta),
      );
    }
    if (data.containsKey('cost')) {
      context.handle(
        _costMeta,
        cost.isAcceptableOrUnknown(data['cost']!, _costMeta),
      );
    }
    if (data.containsKey('is_fill_to_full')) {
      context.handle(
        _isFillToFullMeta,
        isFillToFull.isAcceptableOrUnknown(
          data['is_fill_to_full']!,
          _isFillToFullMeta,
        ),
      );
    }
    if (data.containsKey('missed_fuel_up')) {
      context.handle(
        _missedFuelUpMeta,
        missedFuelUp.isAcceptableOrUnknown(
          data['missed_fuel_up']!,
          _missedFuelUpMeta,
        ),
      );
    }
    if (data.containsKey('mpg')) {
      context.handle(
        _mpgMeta,
        mpg.isAcceptableOrUnknown(data['mpg']!, _mpgMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GasRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GasRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_id'],
      ),
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      mileage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mileage'],
      )!,
      gallons: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gallons'],
      )!,
      cost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost'],
      )!,
      isFillToFull: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_fill_to_full'],
      )!,
      missedFuelUp: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}missed_fuel_up'],
      )!,
      mpg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mpg'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $GasRecordsTable createAlias(String alias) {
    return $GasRecordsTable(attachedDatabase, alias);
  }
}

class GasRecord extends DataClass implements Insertable<GasRecord> {
  final int id;
  final int? remoteId;
  final int vehicleId;
  final DateTime date;
  final double mileage;
  final double gallons;
  final double cost;
  final bool isFillToFull;
  final bool missedFuelUp;
  final double? mpg;
  final String notes;
  final DateTime updatedAt;
  final String syncStatus;
  const GasRecord({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.date,
    required this.mileage,
    required this.gallons,
    required this.cost,
    required this.isFillToFull,
    required this.missedFuelUp,
    this.mpg,
    required this.notes,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    map['vehicle_id'] = Variable<int>(vehicleId);
    map['date'] = Variable<DateTime>(date);
    map['mileage'] = Variable<double>(mileage);
    map['gallons'] = Variable<double>(gallons);
    map['cost'] = Variable<double>(cost);
    map['is_fill_to_full'] = Variable<bool>(isFillToFull);
    map['missed_fuel_up'] = Variable<bool>(missedFuelUp);
    if (!nullToAbsent || mpg != null) {
      map['mpg'] = Variable<double>(mpg);
    }
    map['notes'] = Variable<String>(notes);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  GasRecordsCompanion toCompanion(bool nullToAbsent) {
    return GasRecordsCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      vehicleId: Value(vehicleId),
      date: Value(date),
      mileage: Value(mileage),
      gallons: Value(gallons),
      cost: Value(cost),
      isFillToFull: Value(isFillToFull),
      missedFuelUp: Value(missedFuelUp),
      mpg: mpg == null && nullToAbsent ? const Value.absent() : Value(mpg),
      notes: Value(notes),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory GasRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GasRecord(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      vehicleId: serializer.fromJson<int>(json['vehicleId']),
      date: serializer.fromJson<DateTime>(json['date']),
      mileage: serializer.fromJson<double>(json['mileage']),
      gallons: serializer.fromJson<double>(json['gallons']),
      cost: serializer.fromJson<double>(json['cost']),
      isFillToFull: serializer.fromJson<bool>(json['isFillToFull']),
      missedFuelUp: serializer.fromJson<bool>(json['missedFuelUp']),
      mpg: serializer.fromJson<double?>(json['mpg']),
      notes: serializer.fromJson<String>(json['notes']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<int?>(remoteId),
      'vehicleId': serializer.toJson<int>(vehicleId),
      'date': serializer.toJson<DateTime>(date),
      'mileage': serializer.toJson<double>(mileage),
      'gallons': serializer.toJson<double>(gallons),
      'cost': serializer.toJson<double>(cost),
      'isFillToFull': serializer.toJson<bool>(isFillToFull),
      'missedFuelUp': serializer.toJson<bool>(missedFuelUp),
      'mpg': serializer.toJson<double?>(mpg),
      'notes': serializer.toJson<String>(notes),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  GasRecord copyWith({
    int? id,
    Value<int?> remoteId = const Value.absent(),
    int? vehicleId,
    DateTime? date,
    double? mileage,
    double? gallons,
    double? cost,
    bool? isFillToFull,
    bool? missedFuelUp,
    Value<double?> mpg = const Value.absent(),
    String? notes,
    DateTime? updatedAt,
    String? syncStatus,
  }) => GasRecord(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    vehicleId: vehicleId ?? this.vehicleId,
    date: date ?? this.date,
    mileage: mileage ?? this.mileage,
    gallons: gallons ?? this.gallons,
    cost: cost ?? this.cost,
    isFillToFull: isFillToFull ?? this.isFillToFull,
    missedFuelUp: missedFuelUp ?? this.missedFuelUp,
    mpg: mpg.present ? mpg.value : this.mpg,
    notes: notes ?? this.notes,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  GasRecord copyWithCompanion(GasRecordsCompanion data) {
    return GasRecord(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      date: data.date.present ? data.date.value : this.date,
      mileage: data.mileage.present ? data.mileage.value : this.mileage,
      gallons: data.gallons.present ? data.gallons.value : this.gallons,
      cost: data.cost.present ? data.cost.value : this.cost,
      isFillToFull: data.isFillToFull.present
          ? data.isFillToFull.value
          : this.isFillToFull,
      missedFuelUp: data.missedFuelUp.present
          ? data.missedFuelUp.value
          : this.missedFuelUp,
      mpg: data.mpg.present ? data.mpg.value : this.mpg,
      notes: data.notes.present ? data.notes.value : this.notes,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GasRecord(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('date: $date, ')
          ..write('mileage: $mileage, ')
          ..write('gallons: $gallons, ')
          ..write('cost: $cost, ')
          ..write('isFillToFull: $isFillToFull, ')
          ..write('missedFuelUp: $missedFuelUp, ')
          ..write('mpg: $mpg, ')
          ..write('notes: $notes, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GasRecord &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.vehicleId == this.vehicleId &&
          other.date == this.date &&
          other.mileage == this.mileage &&
          other.gallons == this.gallons &&
          other.cost == this.cost &&
          other.isFillToFull == this.isFillToFull &&
          other.missedFuelUp == this.missedFuelUp &&
          other.mpg == this.mpg &&
          other.notes == this.notes &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class GasRecordsCompanion extends UpdateCompanion<GasRecord> {
  final Value<int> id;
  final Value<int?> remoteId;
  final Value<int> vehicleId;
  final Value<DateTime> date;
  final Value<double> mileage;
  final Value<double> gallons;
  final Value<double> cost;
  final Value<bool> isFillToFull;
  final Value<bool> missedFuelUp;
  final Value<double?> mpg;
  final Value<String> notes;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const GasRecordsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.date = const Value.absent(),
    this.mileage = const Value.absent(),
    this.gallons = const Value.absent(),
    this.cost = const Value.absent(),
    this.isFillToFull = const Value.absent(),
    this.missedFuelUp = const Value.absent(),
    this.mpg = const Value.absent(),
    this.notes = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  GasRecordsCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required int vehicleId,
    required DateTime date,
    this.mileage = const Value.absent(),
    this.gallons = const Value.absent(),
    this.cost = const Value.absent(),
    this.isFillToFull = const Value.absent(),
    this.missedFuelUp = const Value.absent(),
    this.mpg = const Value.absent(),
    this.notes = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  }) : vehicleId = Value(vehicleId),
       date = Value(date);
  static Insertable<GasRecord> custom({
    Expression<int>? id,
    Expression<int>? remoteId,
    Expression<int>? vehicleId,
    Expression<DateTime>? date,
    Expression<double>? mileage,
    Expression<double>? gallons,
    Expression<double>? cost,
    Expression<bool>? isFillToFull,
    Expression<bool>? missedFuelUp,
    Expression<double>? mpg,
    Expression<String>? notes,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (date != null) 'date': date,
      if (mileage != null) 'mileage': mileage,
      if (gallons != null) 'gallons': gallons,
      if (cost != null) 'cost': cost,
      if (isFillToFull != null) 'is_fill_to_full': isFillToFull,
      if (missedFuelUp != null) 'missed_fuel_up': missedFuelUp,
      if (mpg != null) 'mpg': mpg,
      if (notes != null) 'notes': notes,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  GasRecordsCompanion copyWith({
    Value<int>? id,
    Value<int?>? remoteId,
    Value<int>? vehicleId,
    Value<DateTime>? date,
    Value<double>? mileage,
    Value<double>? gallons,
    Value<double>? cost,
    Value<bool>? isFillToFull,
    Value<bool>? missedFuelUp,
    Value<double?>? mpg,
    Value<String>? notes,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return GasRecordsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      vehicleId: vehicleId ?? this.vehicleId,
      date: date ?? this.date,
      mileage: mileage ?? this.mileage,
      gallons: gallons ?? this.gallons,
      cost: cost ?? this.cost,
      isFillToFull: isFillToFull ?? this.isFillToFull,
      missedFuelUp: missedFuelUp ?? this.missedFuelUp,
      mpg: mpg ?? this.mpg,
      notes: notes ?? this.notes,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (mileage.present) {
      map['mileage'] = Variable<double>(mileage.value);
    }
    if (gallons.present) {
      map['gallons'] = Variable<double>(gallons.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (isFillToFull.present) {
      map['is_fill_to_full'] = Variable<bool>(isFillToFull.value);
    }
    if (missedFuelUp.present) {
      map['missed_fuel_up'] = Variable<bool>(missedFuelUp.value);
    }
    if (mpg.present) {
      map['mpg'] = Variable<double>(mpg.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GasRecordsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('date: $date, ')
          ..write('mileage: $mileage, ')
          ..write('gallons: $gallons, ')
          ..write('cost: $cost, ')
          ..write('isFillToFull: $isFillToFull, ')
          ..write('missedFuelUp: $missedFuelUp, ')
          ..write('mpg: $mpg, ')
          ..write('notes: $notes, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $OdometerRecordsTable extends OdometerRecords
    with TableInfo<$OdometerRecordsTable, OdometerRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OdometerRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mileageMeta = const VerificationMeta(
    'mileage',
  );
  @override
  late final GeneratedColumn<double> mileage = GeneratedColumn<double>(
    'mileage',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _initialMileageMeta = const VerificationMeta(
    'initialMileage',
  );
  @override
  late final GeneratedColumn<double> initialMileage = GeneratedColumn<double>(
    'initial_mileage',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    vehicleId,
    date,
    mileage,
    initialMileage,
    notes,
    updatedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'odometer_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<OdometerRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('mileage')) {
      context.handle(
        _mileageMeta,
        mileage.isAcceptableOrUnknown(data['mileage']!, _mileageMeta),
      );
    }
    if (data.containsKey('initial_mileage')) {
      context.handle(
        _initialMileageMeta,
        initialMileage.isAcceptableOrUnknown(
          data['initial_mileage']!,
          _initialMileageMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OdometerRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OdometerRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_id'],
      ),
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      mileage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mileage'],
      )!,
      initialMileage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}initial_mileage'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $OdometerRecordsTable createAlias(String alias) {
    return $OdometerRecordsTable(attachedDatabase, alias);
  }
}

class OdometerRecord extends DataClass implements Insertable<OdometerRecord> {
  final int id;
  final int? remoteId;
  final int vehicleId;
  final DateTime date;
  final double mileage;
  final double initialMileage;
  final String notes;
  final DateTime updatedAt;
  final String syncStatus;
  const OdometerRecord({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.date,
    required this.mileage,
    required this.initialMileage,
    required this.notes,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    map['vehicle_id'] = Variable<int>(vehicleId);
    map['date'] = Variable<DateTime>(date);
    map['mileage'] = Variable<double>(mileage);
    map['initial_mileage'] = Variable<double>(initialMileage);
    map['notes'] = Variable<String>(notes);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  OdometerRecordsCompanion toCompanion(bool nullToAbsent) {
    return OdometerRecordsCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      vehicleId: Value(vehicleId),
      date: Value(date),
      mileage: Value(mileage),
      initialMileage: Value(initialMileage),
      notes: Value(notes),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory OdometerRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OdometerRecord(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      vehicleId: serializer.fromJson<int>(json['vehicleId']),
      date: serializer.fromJson<DateTime>(json['date']),
      mileage: serializer.fromJson<double>(json['mileage']),
      initialMileage: serializer.fromJson<double>(json['initialMileage']),
      notes: serializer.fromJson<String>(json['notes']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<int?>(remoteId),
      'vehicleId': serializer.toJson<int>(vehicleId),
      'date': serializer.toJson<DateTime>(date),
      'mileage': serializer.toJson<double>(mileage),
      'initialMileage': serializer.toJson<double>(initialMileage),
      'notes': serializer.toJson<String>(notes),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  OdometerRecord copyWith({
    int? id,
    Value<int?> remoteId = const Value.absent(),
    int? vehicleId,
    DateTime? date,
    double? mileage,
    double? initialMileage,
    String? notes,
    DateTime? updatedAt,
    String? syncStatus,
  }) => OdometerRecord(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    vehicleId: vehicleId ?? this.vehicleId,
    date: date ?? this.date,
    mileage: mileage ?? this.mileage,
    initialMileage: initialMileage ?? this.initialMileage,
    notes: notes ?? this.notes,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  OdometerRecord copyWithCompanion(OdometerRecordsCompanion data) {
    return OdometerRecord(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      date: data.date.present ? data.date.value : this.date,
      mileage: data.mileage.present ? data.mileage.value : this.mileage,
      initialMileage: data.initialMileage.present
          ? data.initialMileage.value
          : this.initialMileage,
      notes: data.notes.present ? data.notes.value : this.notes,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OdometerRecord(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('date: $date, ')
          ..write('mileage: $mileage, ')
          ..write('initialMileage: $initialMileage, ')
          ..write('notes: $notes, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OdometerRecord &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.vehicleId == this.vehicleId &&
          other.date == this.date &&
          other.mileage == this.mileage &&
          other.initialMileage == this.initialMileage &&
          other.notes == this.notes &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class OdometerRecordsCompanion extends UpdateCompanion<OdometerRecord> {
  final Value<int> id;
  final Value<int?> remoteId;
  final Value<int> vehicleId;
  final Value<DateTime> date;
  final Value<double> mileage;
  final Value<double> initialMileage;
  final Value<String> notes;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const OdometerRecordsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.date = const Value.absent(),
    this.mileage = const Value.absent(),
    this.initialMileage = const Value.absent(),
    this.notes = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  OdometerRecordsCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required int vehicleId,
    required DateTime date,
    this.mileage = const Value.absent(),
    this.initialMileage = const Value.absent(),
    this.notes = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  }) : vehicleId = Value(vehicleId),
       date = Value(date);
  static Insertable<OdometerRecord> custom({
    Expression<int>? id,
    Expression<int>? remoteId,
    Expression<int>? vehicleId,
    Expression<DateTime>? date,
    Expression<double>? mileage,
    Expression<double>? initialMileage,
    Expression<String>? notes,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (date != null) 'date': date,
      if (mileage != null) 'mileage': mileage,
      if (initialMileage != null) 'initial_mileage': initialMileage,
      if (notes != null) 'notes': notes,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  OdometerRecordsCompanion copyWith({
    Value<int>? id,
    Value<int?>? remoteId,
    Value<int>? vehicleId,
    Value<DateTime>? date,
    Value<double>? mileage,
    Value<double>? initialMileage,
    Value<String>? notes,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return OdometerRecordsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      vehicleId: vehicleId ?? this.vehicleId,
      date: date ?? this.date,
      mileage: mileage ?? this.mileage,
      initialMileage: initialMileage ?? this.initialMileage,
      notes: notes ?? this.notes,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (mileage.present) {
      map['mileage'] = Variable<double>(mileage.value);
    }
    if (initialMileage.present) {
      map['initial_mileage'] = Variable<double>(initialMileage.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OdometerRecordsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('date: $date, ')
          ..write('mileage: $mileage, ')
          ..write('initialMileage: $initialMileage, ')
          ..write('notes: $notes, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $TaxRecordsTable extends TaxRecords
    with TableInfo<$TaxRecordsTable, TaxRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaxRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
    'cost',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _isRecurringMeta = const VerificationMeta(
    'isRecurring',
  );
  @override
  late final GeneratedColumn<bool> isRecurring = GeneratedColumn<bool>(
    'is_recurring',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_recurring" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _recurringIntervalMeta = const VerificationMeta(
    'recurringInterval',
  );
  @override
  late final GeneratedColumn<String> recurringInterval =
      GeneratedColumn<String>(
        'recurring_interval',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tax_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaxRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('cost')) {
      context.handle(
        _costMeta,
        cost.isAcceptableOrUnknown(data['cost']!, _costMeta),
      );
    }
    if (data.containsKey('is_recurring')) {
      context.handle(
        _isRecurringMeta,
        isRecurring.isAcceptableOrUnknown(
          data['is_recurring']!,
          _isRecurringMeta,
        ),
      );
    }
    if (data.containsKey('recurring_interval')) {
      context.handle(
        _recurringIntervalMeta,
        recurringInterval.isAcceptableOrUnknown(
          data['recurring_interval']!,
          _recurringIntervalMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaxRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaxRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_id'],
      ),
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      cost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost'],
      )!,
      isRecurring: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_recurring'],
      )!,
      recurringInterval: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recurring_interval'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $TaxRecordsTable createAlias(String alias) {
    return $TaxRecordsTable(attachedDatabase, alias);
  }
}

class TaxRecord extends DataClass implements Insertable<TaxRecord> {
  final int id;
  final int? remoteId;
  final int vehicleId;
  final DateTime date;
  final String description;
  final double cost;
  final bool isRecurring;
  final String recurringInterval;
  final String notes;
  final DateTime updatedAt;
  final String syncStatus;
  const TaxRecord({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.date,
    required this.description,
    required this.cost,
    required this.isRecurring,
    required this.recurringInterval,
    required this.notes,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    map['vehicle_id'] = Variable<int>(vehicleId);
    map['date'] = Variable<DateTime>(date);
    map['description'] = Variable<String>(description);
    map['cost'] = Variable<double>(cost);
    map['is_recurring'] = Variable<bool>(isRecurring);
    map['recurring_interval'] = Variable<String>(recurringInterval);
    map['notes'] = Variable<String>(notes);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  TaxRecordsCompanion toCompanion(bool nullToAbsent) {
    return TaxRecordsCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      vehicleId: Value(vehicleId),
      date: Value(date),
      description: Value(description),
      cost: Value(cost),
      isRecurring: Value(isRecurring),
      recurringInterval: Value(recurringInterval),
      notes: Value(notes),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory TaxRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaxRecord(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      vehicleId: serializer.fromJson<int>(json['vehicleId']),
      date: serializer.fromJson<DateTime>(json['date']),
      description: serializer.fromJson<String>(json['description']),
      cost: serializer.fromJson<double>(json['cost']),
      isRecurring: serializer.fromJson<bool>(json['isRecurring']),
      recurringInterval: serializer.fromJson<String>(json['recurringInterval']),
      notes: serializer.fromJson<String>(json['notes']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<int?>(remoteId),
      'vehicleId': serializer.toJson<int>(vehicleId),
      'date': serializer.toJson<DateTime>(date),
      'description': serializer.toJson<String>(description),
      'cost': serializer.toJson<double>(cost),
      'isRecurring': serializer.toJson<bool>(isRecurring),
      'recurringInterval': serializer.toJson<String>(recurringInterval),
      'notes': serializer.toJson<String>(notes),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  TaxRecord copyWith({
    int? id,
    Value<int?> remoteId = const Value.absent(),
    int? vehicleId,
    DateTime? date,
    String? description,
    double? cost,
    bool? isRecurring,
    String? recurringInterval,
    String? notes,
    DateTime? updatedAt,
    String? syncStatus,
  }) => TaxRecord(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    vehicleId: vehicleId ?? this.vehicleId,
    date: date ?? this.date,
    description: description ?? this.description,
    cost: cost ?? this.cost,
    isRecurring: isRecurring ?? this.isRecurring,
    recurringInterval: recurringInterval ?? this.recurringInterval,
    notes: notes ?? this.notes,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  TaxRecord copyWithCompanion(TaxRecordsCompanion data) {
    return TaxRecord(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      date: data.date.present ? data.date.value : this.date,
      description: data.description.present
          ? data.description.value
          : this.description,
      cost: data.cost.present ? data.cost.value : this.cost,
      isRecurring: data.isRecurring.present
          ? data.isRecurring.value
          : this.isRecurring,
      recurringInterval: data.recurringInterval.present
          ? data.recurringInterval.value
          : this.recurringInterval,
      notes: data.notes.present ? data.notes.value : this.notes,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaxRecord(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('date: $date, ')
          ..write('description: $description, ')
          ..write('cost: $cost, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('recurringInterval: $recurringInterval, ')
          ..write('notes: $notes, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaxRecord &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.vehicleId == this.vehicleId &&
          other.date == this.date &&
          other.description == this.description &&
          other.cost == this.cost &&
          other.isRecurring == this.isRecurring &&
          other.recurringInterval == this.recurringInterval &&
          other.notes == this.notes &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class TaxRecordsCompanion extends UpdateCompanion<TaxRecord> {
  final Value<int> id;
  final Value<int?> remoteId;
  final Value<int> vehicleId;
  final Value<DateTime> date;
  final Value<String> description;
  final Value<double> cost;
  final Value<bool> isRecurring;
  final Value<String> recurringInterval;
  final Value<String> notes;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const TaxRecordsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.date = const Value.absent(),
    this.description = const Value.absent(),
    this.cost = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.recurringInterval = const Value.absent(),
    this.notes = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  TaxRecordsCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required int vehicleId,
    required DateTime date,
    required String description,
    this.cost = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.recurringInterval = const Value.absent(),
    this.notes = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  }) : vehicleId = Value(vehicleId),
       date = Value(date),
       description = Value(description);
  static Insertable<TaxRecord> custom({
    Expression<int>? id,
    Expression<int>? remoteId,
    Expression<int>? vehicleId,
    Expression<DateTime>? date,
    Expression<String>? description,
    Expression<double>? cost,
    Expression<bool>? isRecurring,
    Expression<String>? recurringInterval,
    Expression<String>? notes,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (date != null) 'date': date,
      if (description != null) 'description': description,
      if (cost != null) 'cost': cost,
      if (isRecurring != null) 'is_recurring': isRecurring,
      if (recurringInterval != null) 'recurring_interval': recurringInterval,
      if (notes != null) 'notes': notes,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  TaxRecordsCompanion copyWith({
    Value<int>? id,
    Value<int?>? remoteId,
    Value<int>? vehicleId,
    Value<DateTime>? date,
    Value<String>? description,
    Value<double>? cost,
    Value<bool>? isRecurring,
    Value<String>? recurringInterval,
    Value<String>? notes,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return TaxRecordsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      vehicleId: vehicleId ?? this.vehicleId,
      date: date ?? this.date,
      description: description ?? this.description,
      cost: cost ?? this.cost,
      isRecurring: isRecurring ?? this.isRecurring,
      recurringInterval: recurringInterval ?? this.recurringInterval,
      notes: notes ?? this.notes,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (isRecurring.present) {
      map['is_recurring'] = Variable<bool>(isRecurring.value);
    }
    if (recurringInterval.present) {
      map['recurring_interval'] = Variable<String>(recurringInterval.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaxRecordsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('date: $date, ')
          ..write('description: $description, ')
          ..write('cost: $cost, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('recurringInterval: $recurringInterval, ')
          ..write('notes: $notes, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $ReminderRecordsTable extends ReminderRecords
    with TableInfo<$ReminderRecordsTable, ReminderRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReminderRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reminderMetricMeta = const VerificationMeta(
    'reminderMetric',
  );
  @override
  late final GeneratedColumn<String> reminderMetric = GeneratedColumn<String>(
    'reminder_metric',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('both'),
  );
  static const VerificationMeta _dateMetricMeta = const VerificationMeta(
    'dateMetric',
  );
  @override
  late final GeneratedColumn<DateTime> dateMetric = GeneratedColumn<DateTime>(
    'date_metric',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mileageMetricMeta = const VerificationMeta(
    'mileageMetric',
  );
  @override
  late final GeneratedColumn<double> mileageMetric = GeneratedColumn<double>(
    'mileage_metric',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isRecurringMeta = const VerificationMeta(
    'isRecurring',
  );
  @override
  late final GeneratedColumn<bool> isRecurring = GeneratedColumn<bool>(
    'is_recurring',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_recurring" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminder_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReminderRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('reminder_metric')) {
      context.handle(
        _reminderMetricMeta,
        reminderMetric.isAcceptableOrUnknown(
          data['reminder_metric']!,
          _reminderMetricMeta,
        ),
      );
    }
    if (data.containsKey('date_metric')) {
      context.handle(
        _dateMetricMeta,
        dateMetric.isAcceptableOrUnknown(data['date_metric']!, _dateMetricMeta),
      );
    }
    if (data.containsKey('mileage_metric')) {
      context.handle(
        _mileageMetricMeta,
        mileageMetric.isAcceptableOrUnknown(
          data['mileage_metric']!,
          _mileageMetricMeta,
        ),
      );
    }
    if (data.containsKey('is_recurring')) {
      context.handle(
        _isRecurringMeta,
        isRecurring.isAcceptableOrUnknown(
          data['is_recurring']!,
          _isRecurringMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReminderRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_id'],
      ),
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      reminderMetric: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reminder_metric'],
      )!,
      dateMetric: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_metric'],
      ),
      mileageMetric: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mileage_metric'],
      ),
      isRecurring: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_recurring'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $ReminderRecordsTable createAlias(String alias) {
    return $ReminderRecordsTable(attachedDatabase, alias);
  }
}

class ReminderRecord extends DataClass implements Insertable<ReminderRecord> {
  final int id;
  final int? remoteId;
  final int vehicleId;
  final String description;
  final String reminderMetric;
  final DateTime? dateMetric;
  final double? mileageMetric;
  final bool isRecurring;
  final String notes;
  final DateTime updatedAt;
  final String syncStatus;
  const ReminderRecord({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.description,
    required this.reminderMetric,
    this.dateMetric,
    this.mileageMetric,
    required this.isRecurring,
    required this.notes,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    map['vehicle_id'] = Variable<int>(vehicleId);
    map['description'] = Variable<String>(description);
    map['reminder_metric'] = Variable<String>(reminderMetric);
    if (!nullToAbsent || dateMetric != null) {
      map['date_metric'] = Variable<DateTime>(dateMetric);
    }
    if (!nullToAbsent || mileageMetric != null) {
      map['mileage_metric'] = Variable<double>(mileageMetric);
    }
    map['is_recurring'] = Variable<bool>(isRecurring);
    map['notes'] = Variable<String>(notes);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  ReminderRecordsCompanion toCompanion(bool nullToAbsent) {
    return ReminderRecordsCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      vehicleId: Value(vehicleId),
      description: Value(description),
      reminderMetric: Value(reminderMetric),
      dateMetric: dateMetric == null && nullToAbsent
          ? const Value.absent()
          : Value(dateMetric),
      mileageMetric: mileageMetric == null && nullToAbsent
          ? const Value.absent()
          : Value(mileageMetric),
      isRecurring: Value(isRecurring),
      notes: Value(notes),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory ReminderRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderRecord(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      vehicleId: serializer.fromJson<int>(json['vehicleId']),
      description: serializer.fromJson<String>(json['description']),
      reminderMetric: serializer.fromJson<String>(json['reminderMetric']),
      dateMetric: serializer.fromJson<DateTime?>(json['dateMetric']),
      mileageMetric: serializer.fromJson<double?>(json['mileageMetric']),
      isRecurring: serializer.fromJson<bool>(json['isRecurring']),
      notes: serializer.fromJson<String>(json['notes']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<int?>(remoteId),
      'vehicleId': serializer.toJson<int>(vehicleId),
      'description': serializer.toJson<String>(description),
      'reminderMetric': serializer.toJson<String>(reminderMetric),
      'dateMetric': serializer.toJson<DateTime?>(dateMetric),
      'mileageMetric': serializer.toJson<double?>(mileageMetric),
      'isRecurring': serializer.toJson<bool>(isRecurring),
      'notes': serializer.toJson<String>(notes),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  ReminderRecord copyWith({
    int? id,
    Value<int?> remoteId = const Value.absent(),
    int? vehicleId,
    String? description,
    String? reminderMetric,
    Value<DateTime?> dateMetric = const Value.absent(),
    Value<double?> mileageMetric = const Value.absent(),
    bool? isRecurring,
    String? notes,
    DateTime? updatedAt,
    String? syncStatus,
  }) => ReminderRecord(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    vehicleId: vehicleId ?? this.vehicleId,
    description: description ?? this.description,
    reminderMetric: reminderMetric ?? this.reminderMetric,
    dateMetric: dateMetric.present ? dateMetric.value : this.dateMetric,
    mileageMetric: mileageMetric.present
        ? mileageMetric.value
        : this.mileageMetric,
    isRecurring: isRecurring ?? this.isRecurring,
    notes: notes ?? this.notes,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  ReminderRecord copyWithCompanion(ReminderRecordsCompanion data) {
    return ReminderRecord(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      description: data.description.present
          ? data.description.value
          : this.description,
      reminderMetric: data.reminderMetric.present
          ? data.reminderMetric.value
          : this.reminderMetric,
      dateMetric: data.dateMetric.present
          ? data.dateMetric.value
          : this.dateMetric,
      mileageMetric: data.mileageMetric.present
          ? data.mileageMetric.value
          : this.mileageMetric,
      isRecurring: data.isRecurring.present
          ? data.isRecurring.value
          : this.isRecurring,
      notes: data.notes.present ? data.notes.value : this.notes,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderRecord(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('description: $description, ')
          ..write('reminderMetric: $reminderMetric, ')
          ..write('dateMetric: $dateMetric, ')
          ..write('mileageMetric: $mileageMetric, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('notes: $notes, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderRecord &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.vehicleId == this.vehicleId &&
          other.description == this.description &&
          other.reminderMetric == this.reminderMetric &&
          other.dateMetric == this.dateMetric &&
          other.mileageMetric == this.mileageMetric &&
          other.isRecurring == this.isRecurring &&
          other.notes == this.notes &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class ReminderRecordsCompanion extends UpdateCompanion<ReminderRecord> {
  final Value<int> id;
  final Value<int?> remoteId;
  final Value<int> vehicleId;
  final Value<String> description;
  final Value<String> reminderMetric;
  final Value<DateTime?> dateMetric;
  final Value<double?> mileageMetric;
  final Value<bool> isRecurring;
  final Value<String> notes;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const ReminderRecordsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.description = const Value.absent(),
    this.reminderMetric = const Value.absent(),
    this.dateMetric = const Value.absent(),
    this.mileageMetric = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.notes = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  ReminderRecordsCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required int vehicleId,
    required String description,
    this.reminderMetric = const Value.absent(),
    this.dateMetric = const Value.absent(),
    this.mileageMetric = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.notes = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  }) : vehicleId = Value(vehicleId),
       description = Value(description);
  static Insertable<ReminderRecord> custom({
    Expression<int>? id,
    Expression<int>? remoteId,
    Expression<int>? vehicleId,
    Expression<String>? description,
    Expression<String>? reminderMetric,
    Expression<DateTime>? dateMetric,
    Expression<double>? mileageMetric,
    Expression<bool>? isRecurring,
    Expression<String>? notes,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (description != null) 'description': description,
      if (reminderMetric != null) 'reminder_metric': reminderMetric,
      if (dateMetric != null) 'date_metric': dateMetric,
      if (mileageMetric != null) 'mileage_metric': mileageMetric,
      if (isRecurring != null) 'is_recurring': isRecurring,
      if (notes != null) 'notes': notes,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  ReminderRecordsCompanion copyWith({
    Value<int>? id,
    Value<int?>? remoteId,
    Value<int>? vehicleId,
    Value<String>? description,
    Value<String>? reminderMetric,
    Value<DateTime?>? dateMetric,
    Value<double?>? mileageMetric,
    Value<bool>? isRecurring,
    Value<String>? notes,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return ReminderRecordsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      vehicleId: vehicleId ?? this.vehicleId,
      description: description ?? this.description,
      reminderMetric: reminderMetric ?? this.reminderMetric,
      dateMetric: dateMetric ?? this.dateMetric,
      mileageMetric: mileageMetric ?? this.mileageMetric,
      isRecurring: isRecurring ?? this.isRecurring,
      notes: notes ?? this.notes,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (reminderMetric.present) {
      map['reminder_metric'] = Variable<String>(reminderMetric.value);
    }
    if (dateMetric.present) {
      map['date_metric'] = Variable<DateTime>(dateMetric.value);
    }
    if (mileageMetric.present) {
      map['mileage_metric'] = Variable<double>(mileageMetric.value);
    }
    if (isRecurring.present) {
      map['is_recurring'] = Variable<bool>(isRecurring.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReminderRecordsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('description: $description, ')
          ..write('reminderMetric: $reminderMetric, ')
          ..write('dateMetric: $dateMetric, ')
          ..write('mileageMetric: $mileageMetric, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('notes: $notes, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $PlanRecordsTable extends PlanRecords
    with TableInfo<$PlanRecordsTable, PlanRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlanRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('normal'),
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<String> progress = GeneratedColumn<String>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Backlog'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    vehicleId,
    description,
    priority,
    progress,
    notes,
    updatedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plan_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlanRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlanRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlanRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_id'],
      ),
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}priority'],
      )!,
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}progress'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $PlanRecordsTable createAlias(String alias) {
    return $PlanRecordsTable(attachedDatabase, alias);
  }
}

class PlanRecord extends DataClass implements Insertable<PlanRecord> {
  final int id;
  final int? remoteId;
  final int vehicleId;
  final String description;
  final String priority;
  final String progress;
  final String notes;
  final DateTime updatedAt;
  final String syncStatus;
  const PlanRecord({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.description,
    required this.priority,
    required this.progress,
    required this.notes,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    map['vehicle_id'] = Variable<int>(vehicleId);
    map['description'] = Variable<String>(description);
    map['priority'] = Variable<String>(priority);
    map['progress'] = Variable<String>(progress);
    map['notes'] = Variable<String>(notes);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  PlanRecordsCompanion toCompanion(bool nullToAbsent) {
    return PlanRecordsCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      vehicleId: Value(vehicleId),
      description: Value(description),
      priority: Value(priority),
      progress: Value(progress),
      notes: Value(notes),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory PlanRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanRecord(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      vehicleId: serializer.fromJson<int>(json['vehicleId']),
      description: serializer.fromJson<String>(json['description']),
      priority: serializer.fromJson<String>(json['priority']),
      progress: serializer.fromJson<String>(json['progress']),
      notes: serializer.fromJson<String>(json['notes']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<int?>(remoteId),
      'vehicleId': serializer.toJson<int>(vehicleId),
      'description': serializer.toJson<String>(description),
      'priority': serializer.toJson<String>(priority),
      'progress': serializer.toJson<String>(progress),
      'notes': serializer.toJson<String>(notes),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  PlanRecord copyWith({
    int? id,
    Value<int?> remoteId = const Value.absent(),
    int? vehicleId,
    String? description,
    String? priority,
    String? progress,
    String? notes,
    DateTime? updatedAt,
    String? syncStatus,
  }) => PlanRecord(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    vehicleId: vehicleId ?? this.vehicleId,
    description: description ?? this.description,
    priority: priority ?? this.priority,
    progress: progress ?? this.progress,
    notes: notes ?? this.notes,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  PlanRecord copyWithCompanion(PlanRecordsCompanion data) {
    return PlanRecord(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      description: data.description.present
          ? data.description.value
          : this.description,
      priority: data.priority.present ? data.priority.value : this.priority,
      progress: data.progress.present ? data.progress.value : this.progress,
      notes: data.notes.present ? data.notes.value : this.notes,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlanRecord(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('description: $description, ')
          ..write('priority: $priority, ')
          ..write('progress: $progress, ')
          ..write('notes: $notes, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanRecord &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.vehicleId == this.vehicleId &&
          other.description == this.description &&
          other.priority == this.priority &&
          other.progress == this.progress &&
          other.notes == this.notes &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class PlanRecordsCompanion extends UpdateCompanion<PlanRecord> {
  final Value<int> id;
  final Value<int?> remoteId;
  final Value<int> vehicleId;
  final Value<String> description;
  final Value<String> priority;
  final Value<String> progress;
  final Value<String> notes;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const PlanRecordsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.description = const Value.absent(),
    this.priority = const Value.absent(),
    this.progress = const Value.absent(),
    this.notes = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  PlanRecordsCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required int vehicleId,
    required String description,
    this.priority = const Value.absent(),
    this.progress = const Value.absent(),
    this.notes = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  }) : vehicleId = Value(vehicleId),
       description = Value(description);
  static Insertable<PlanRecord> custom({
    Expression<int>? id,
    Expression<int>? remoteId,
    Expression<int>? vehicleId,
    Expression<String>? description,
    Expression<String>? priority,
    Expression<String>? progress,
    Expression<String>? notes,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (description != null) 'description': description,
      if (priority != null) 'priority': priority,
      if (progress != null) 'progress': progress,
      if (notes != null) 'notes': notes,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  PlanRecordsCompanion copyWith({
    Value<int>? id,
    Value<int?>? remoteId,
    Value<int>? vehicleId,
    Value<String>? description,
    Value<String>? priority,
    Value<String>? progress,
    Value<String>? notes,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return PlanRecordsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      vehicleId: vehicleId ?? this.vehicleId,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      progress: progress ?? this.progress,
      notes: notes ?? this.notes,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (progress.present) {
      map['progress'] = Variable<String>(progress.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanRecordsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('description: $description, ')
          ..write('priority: $priority, ')
          ..write('progress: $progress, ')
          ..write('notes: $notes, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $SupplyRecordsTable extends SupplyRecords
    with TableInfo<$SupplyRecordsTable, SupplyRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupplyRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _partNumberMeta = const VerificationMeta(
    'partNumber',
  );
  @override
  late final GeneratedColumn<String> partNumber = GeneratedColumn<String>(
    'part_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
    'cost',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supply_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<SupplyRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('part_number')) {
      context.handle(
        _partNumberMeta,
        partNumber.isAcceptableOrUnknown(data['part_number']!, _partNumberMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('cost')) {
      context.handle(
        _costMeta,
        cost.isAcceptableOrUnknown(data['cost']!, _costMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplyRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplyRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_id'],
      ),
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_id'],
      )!,
      partNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}part_number'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      cost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $SupplyRecordsTable createAlias(String alias) {
    return $SupplyRecordsTable(attachedDatabase, alias);
  }
}

class SupplyRecord extends DataClass implements Insertable<SupplyRecord> {
  final int id;
  final int? remoteId;
  final int vehicleId;
  final String partNumber;
  final String description;
  final double quantity;
  final double cost;
  final String notes;
  final DateTime updatedAt;
  final String syncStatus;
  const SupplyRecord({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.partNumber,
    required this.description,
    required this.quantity,
    required this.cost,
    required this.notes,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    map['vehicle_id'] = Variable<int>(vehicleId);
    map['part_number'] = Variable<String>(partNumber);
    map['description'] = Variable<String>(description);
    map['quantity'] = Variable<double>(quantity);
    map['cost'] = Variable<double>(cost);
    map['notes'] = Variable<String>(notes);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  SupplyRecordsCompanion toCompanion(bool nullToAbsent) {
    return SupplyRecordsCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      vehicleId: Value(vehicleId),
      partNumber: Value(partNumber),
      description: Value(description),
      quantity: Value(quantity),
      cost: Value(cost),
      notes: Value(notes),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory SupplyRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplyRecord(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      vehicleId: serializer.fromJson<int>(json['vehicleId']),
      partNumber: serializer.fromJson<String>(json['partNumber']),
      description: serializer.fromJson<String>(json['description']),
      quantity: serializer.fromJson<double>(json['quantity']),
      cost: serializer.fromJson<double>(json['cost']),
      notes: serializer.fromJson<String>(json['notes']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<int?>(remoteId),
      'vehicleId': serializer.toJson<int>(vehicleId),
      'partNumber': serializer.toJson<String>(partNumber),
      'description': serializer.toJson<String>(description),
      'quantity': serializer.toJson<double>(quantity),
      'cost': serializer.toJson<double>(cost),
      'notes': serializer.toJson<String>(notes),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  SupplyRecord copyWith({
    int? id,
    Value<int?> remoteId = const Value.absent(),
    int? vehicleId,
    String? partNumber,
    String? description,
    double? quantity,
    double? cost,
    String? notes,
    DateTime? updatedAt,
    String? syncStatus,
  }) => SupplyRecord(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    vehicleId: vehicleId ?? this.vehicleId,
    partNumber: partNumber ?? this.partNumber,
    description: description ?? this.description,
    quantity: quantity ?? this.quantity,
    cost: cost ?? this.cost,
    notes: notes ?? this.notes,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  SupplyRecord copyWithCompanion(SupplyRecordsCompanion data) {
    return SupplyRecord(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      partNumber: data.partNumber.present
          ? data.partNumber.value
          : this.partNumber,
      description: data.description.present
          ? data.description.value
          : this.description,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      cost: data.cost.present ? data.cost.value : this.cost,
      notes: data.notes.present ? data.notes.value : this.notes,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplyRecord(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('partNumber: $partNumber, ')
          ..write('description: $description, ')
          ..write('quantity: $quantity, ')
          ..write('cost: $cost, ')
          ..write('notes: $notes, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplyRecord &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.vehicleId == this.vehicleId &&
          other.partNumber == this.partNumber &&
          other.description == this.description &&
          other.quantity == this.quantity &&
          other.cost == this.cost &&
          other.notes == this.notes &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class SupplyRecordsCompanion extends UpdateCompanion<SupplyRecord> {
  final Value<int> id;
  final Value<int?> remoteId;
  final Value<int> vehicleId;
  final Value<String> partNumber;
  final Value<String> description;
  final Value<double> quantity;
  final Value<double> cost;
  final Value<String> notes;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const SupplyRecordsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.partNumber = const Value.absent(),
    this.description = const Value.absent(),
    this.quantity = const Value.absent(),
    this.cost = const Value.absent(),
    this.notes = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  SupplyRecordsCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required int vehicleId,
    this.partNumber = const Value.absent(),
    required String description,
    this.quantity = const Value.absent(),
    this.cost = const Value.absent(),
    this.notes = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  }) : vehicleId = Value(vehicleId),
       description = Value(description);
  static Insertable<SupplyRecord> custom({
    Expression<int>? id,
    Expression<int>? remoteId,
    Expression<int>? vehicleId,
    Expression<String>? partNumber,
    Expression<String>? description,
    Expression<double>? quantity,
    Expression<double>? cost,
    Expression<String>? notes,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (partNumber != null) 'part_number': partNumber,
      if (description != null) 'description': description,
      if (quantity != null) 'quantity': quantity,
      if (cost != null) 'cost': cost,
      if (notes != null) 'notes': notes,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  SupplyRecordsCompanion copyWith({
    Value<int>? id,
    Value<int?>? remoteId,
    Value<int>? vehicleId,
    Value<String>? partNumber,
    Value<String>? description,
    Value<double>? quantity,
    Value<double>? cost,
    Value<String>? notes,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return SupplyRecordsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      vehicleId: vehicleId ?? this.vehicleId,
      partNumber: partNumber ?? this.partNumber,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      cost: cost ?? this.cost,
      notes: notes ?? this.notes,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (partNumber.present) {
      map['part_number'] = Variable<String>(partNumber.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupplyRecordsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('partNumber: $partNumber, ')
          ..write('description: $description, ')
          ..write('quantity: $quantity, ')
          ..write('cost: $cost, ')
          ..write('notes: $notes, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<int> vehicleId = GeneratedColumn<int>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    vehicleId,
    title,
    body,
    updatedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Note> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_id'],
      ),
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class Note extends DataClass implements Insertable<Note> {
  final int id;
  final int? remoteId;
  final int vehicleId;
  final String title;
  final String body;
  final DateTime updatedAt;
  final String syncStatus;
  const Note({
    required this.id,
    this.remoteId,
    required this.vehicleId,
    required this.title,
    required this.body,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    map['vehicle_id'] = Variable<int>(vehicleId);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      vehicleId: Value(vehicleId),
      title: Value(title),
      body: Value(body),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory Note.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      vehicleId: serializer.fromJson<int>(json['vehicleId']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<int?>(remoteId),
      'vehicleId': serializer.toJson<int>(vehicleId),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  Note copyWith({
    int? id,
    Value<int?> remoteId = const Value.absent(),
    int? vehicleId,
    String? title,
    String? body,
    DateTime? updatedAt,
    String? syncStatus,
  }) => Note(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    vehicleId: vehicleId ?? this.vehicleId,
    title: title ?? this.title,
    body: body ?? this.body,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  Note copyWithCompanion(NotesCompanion data) {
    return Note(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, remoteId, vehicleId, title, body, updatedAt, syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.vehicleId == this.vehicleId &&
          other.title == this.title &&
          other.body == this.body &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<int> id;
  final Value<int?> remoteId;
  final Value<int> vehicleId;
  final Value<String> title;
  final Value<String> body;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required int vehicleId,
    required String title,
    this.body = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
  }) : vehicleId = Value(vehicleId),
       title = Value(title);
  static Insertable<Note> custom({
    Expression<int>? id,
    Expression<int>? remoteId,
    Expression<int>? vehicleId,
    Expression<String>? title,
    Expression<String>? body,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
    });
  }

  NotesCompanion copyWith({
    Value<int>? id,
    Value<int?>? remoteId,
    Value<int>? vehicleId,
    Value<String>? title,
    Value<String>? body,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
  }) {
    return NotesCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      vehicleId: vehicleId ?? this.vehicleId,
      title: title ?? this.title,
      body: body ?? this.body,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<int>(vehicleId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operationMeta = const VerificationMeta(
    'operation',
  );
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
    'operation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _nextRetryAtMeta = const VerificationMeta(
    'nextRetryAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextRetryAt = GeneratedColumn<DateTime>(
    'next_retry_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    localId,
    remoteId,
    operation,
    payload,
    retryCount,
    createdAt,
    nextRetryAt,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncQueueData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('operation')) {
      context.handle(
        _operationMeta,
        operation.isAcceptableOrUnknown(data['operation']!, _operationMeta),
      );
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('next_retry_at')) {
      context.handle(
        _nextRetryAtMeta,
        nextRetryAt.isAcceptableOrUnknown(
          data['next_retry_at']!,
          _nextRetryAtMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_id'],
      ),
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      nextRetryAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_retry_at'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueData extends DataClass implements Insertable<SyncQueueData> {
  final int id;
  final String entityType;
  final int localId;
  final int? remoteId;
  final String operation;
  final String payload;
  final int retryCount;
  final DateTime createdAt;
  final DateTime nextRetryAt;
  final String status;
  const SyncQueueData({
    required this.id,
    required this.entityType,
    required this.localId,
    this.remoteId,
    required this.operation,
    required this.payload,
    required this.retryCount,
    required this.createdAt,
    required this.nextRetryAt,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    map['operation'] = Variable<String>(operation);
    map['payload'] = Variable<String>(payload);
    map['retry_count'] = Variable<int>(retryCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['next_retry_at'] = Variable<DateTime>(nextRetryAt);
    map['status'] = Variable<String>(status);
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      entityType: Value(entityType),
      localId: Value(localId),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      operation: Value(operation),
      payload: Value(payload),
      retryCount: Value(retryCount),
      createdAt: Value(createdAt),
      nextRetryAt: Value(nextRetryAt),
      status: Value(status),
    );
  }

  factory SyncQueueData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueData(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      localId: serializer.fromJson<int>(json['localId']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      operation: serializer.fromJson<String>(json['operation']),
      payload: serializer.fromJson<String>(json['payload']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      nextRetryAt: serializer.fromJson<DateTime>(json['nextRetryAt']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'localId': serializer.toJson<int>(localId),
      'remoteId': serializer.toJson<int?>(remoteId),
      'operation': serializer.toJson<String>(operation),
      'payload': serializer.toJson<String>(payload),
      'retryCount': serializer.toJson<int>(retryCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'nextRetryAt': serializer.toJson<DateTime>(nextRetryAt),
      'status': serializer.toJson<String>(status),
    };
  }

  SyncQueueData copyWith({
    int? id,
    String? entityType,
    int? localId,
    Value<int?> remoteId = const Value.absent(),
    String? operation,
    String? payload,
    int? retryCount,
    DateTime? createdAt,
    DateTime? nextRetryAt,
    String? status,
  }) => SyncQueueData(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    localId: localId ?? this.localId,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    operation: operation ?? this.operation,
    payload: payload ?? this.payload,
    retryCount: retryCount ?? this.retryCount,
    createdAt: createdAt ?? this.createdAt,
    nextRetryAt: nextRetryAt ?? this.nextRetryAt,
    status: status ?? this.status,
  );
  SyncQueueData copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueData(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      localId: data.localId.present ? data.localId.value : this.localId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      operation: data.operation.present ? data.operation.value : this.operation,
      payload: data.payload.present ? data.payload.value : this.payload,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      nextRetryAt: data.nextRetryAt.present
          ? data.nextRetryAt.value
          : this.nextRetryAt,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueData(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('nextRetryAt: $nextRetryAt, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entityType,
    localId,
    remoteId,
    operation,
    payload,
    retryCount,
    createdAt,
    nextRetryAt,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueData &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.localId == this.localId &&
          other.remoteId == this.remoteId &&
          other.operation == this.operation &&
          other.payload == this.payload &&
          other.retryCount == this.retryCount &&
          other.createdAt == this.createdAt &&
          other.nextRetryAt == this.nextRetryAt &&
          other.status == this.status);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueData> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<int> localId;
  final Value<int?> remoteId;
  final Value<String> operation;
  final Value<String> payload;
  final Value<int> retryCount;
  final Value<DateTime> createdAt;
  final Value<DateTime> nextRetryAt;
  final Value<String> status;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.operation = const Value.absent(),
    this.payload = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.nextRetryAt = const Value.absent(),
    this.status = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required int localId,
    this.remoteId = const Value.absent(),
    required String operation,
    required String payload,
    this.retryCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.nextRetryAt = const Value.absent(),
    this.status = const Value.absent(),
  }) : entityType = Value(entityType),
       localId = Value(localId),
       operation = Value(operation),
       payload = Value(payload);
  static Insertable<SyncQueueData> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<int>? localId,
    Expression<int>? remoteId,
    Expression<String>? operation,
    Expression<String>? payload,
    Expression<int>? retryCount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? nextRetryAt,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (localId != null) 'local_id': localId,
      if (remoteId != null) 'remote_id': remoteId,
      if (operation != null) 'operation': operation,
      if (payload != null) 'payload': payload,
      if (retryCount != null) 'retry_count': retryCount,
      if (createdAt != null) 'created_at': createdAt,
      if (nextRetryAt != null) 'next_retry_at': nextRetryAt,
      if (status != null) 'status': status,
    });
  }

  SyncQueueCompanion copyWith({
    Value<int>? id,
    Value<String>? entityType,
    Value<int>? localId,
    Value<int?>? remoteId,
    Value<String>? operation,
    Value<String>? payload,
    Value<int>? retryCount,
    Value<DateTime>? createdAt,
    Value<DateTime>? nextRetryAt,
    Value<String>? status,
  }) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      localId: localId ?? this.localId,
      remoteId: remoteId ?? this.remoteId,
      operation: operation ?? this.operation,
      payload: payload ?? this.payload,
      retryCount: retryCount ?? this.retryCount,
      createdAt: createdAt ?? this.createdAt,
      nextRetryAt: nextRetryAt ?? this.nextRetryAt,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (nextRetryAt.present) {
      map['next_retry_at'] = Variable<DateTime>(nextRetryAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('nextRetryAt: $nextRetryAt, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $VehiclesTable vehicles = $VehiclesTable(this);
  late final $ServiceRecordsTable serviceRecords = $ServiceRecordsTable(this);
  late final $RepairRecordsTable repairRecords = $RepairRecordsTable(this);
  late final $UpgradeRecordsTable upgradeRecords = $UpgradeRecordsTable(this);
  late final $GasRecordsTable gasRecords = $GasRecordsTable(this);
  late final $OdometerRecordsTable odometerRecords = $OdometerRecordsTable(
    this,
  );
  late final $TaxRecordsTable taxRecords = $TaxRecordsTable(this);
  late final $ReminderRecordsTable reminderRecords = $ReminderRecordsTable(
    this,
  );
  late final $PlanRecordsTable planRecords = $PlanRecordsTable(this);
  late final $SupplyRecordsTable supplyRecords = $SupplyRecordsTable(this);
  late final $NotesTable notes = $NotesTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final VehiclesDao vehiclesDao = VehiclesDao(this as AppDatabase);
  late final ServiceRecordsDao serviceRecordsDao = ServiceRecordsDao(
    this as AppDatabase,
  );
  late final RepairRecordsDao repairRecordsDao = RepairRecordsDao(
    this as AppDatabase,
  );
  late final UpgradeRecordsDao upgradeRecordsDao = UpgradeRecordsDao(
    this as AppDatabase,
  );
  late final GasRecordsDao gasRecordsDao = GasRecordsDao(this as AppDatabase);
  late final OdometerRecordsDao odometerRecordsDao = OdometerRecordsDao(
    this as AppDatabase,
  );
  late final TaxRecordsDao taxRecordsDao = TaxRecordsDao(this as AppDatabase);
  late final ReminderRecordsDao reminderRecordsDao = ReminderRecordsDao(
    this as AppDatabase,
  );
  late final PlanRecordsDao planRecordsDao = PlanRecordsDao(
    this as AppDatabase,
  );
  late final SupplyRecordsDao supplyRecordsDao = SupplyRecordsDao(
    this as AppDatabase,
  );
  late final NotesDao notesDao = NotesDao(this as AppDatabase);
  late final SyncQueueDao syncQueueDao = SyncQueueDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    vehicles,
    serviceRecords,
    repairRecords,
    upgradeRecords,
    gasRecords,
    odometerRecords,
    taxRecords,
    reminderRecords,
    planRecords,
    supplyRecords,
    notes,
    syncQueue,
  ];
}

typedef $$VehiclesTableCreateCompanionBuilder =
    VehiclesCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      required String year,
      required String make,
      required String model,
      Value<String> licensePlate,
      Value<bool> isElectric,
      Value<bool> isDiesel,
      Value<bool> useHours,
      Value<String> tags,
      Value<String> extraFields,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });
typedef $$VehiclesTableUpdateCompanionBuilder =
    VehiclesCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      Value<String> year,
      Value<String> make,
      Value<String> model,
      Value<String> licensePlate,
      Value<bool> isElectric,
      Value<bool> isDiesel,
      Value<bool> useHours,
      Value<String> tags,
      Value<String> extraFields,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

class $$VehiclesTableFilterComposer
    extends Composer<_$AppDatabase, $VehiclesTable> {
  $$VehiclesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get make => $composableBuilder(
    column: $table.make,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get licensePlate => $composableBuilder(
    column: $table.licensePlate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isElectric => $composableBuilder(
    column: $table.isElectric,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDiesel => $composableBuilder(
    column: $table.isDiesel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get useHours => $composableBuilder(
    column: $table.useHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extraFields => $composableBuilder(
    column: $table.extraFields,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VehiclesTableOrderingComposer
    extends Composer<_$AppDatabase, $VehiclesTable> {
  $$VehiclesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get make => $composableBuilder(
    column: $table.make,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get licensePlate => $composableBuilder(
    column: $table.licensePlate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isElectric => $composableBuilder(
    column: $table.isElectric,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDiesel => $composableBuilder(
    column: $table.isDiesel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get useHours => $composableBuilder(
    column: $table.useHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extraFields => $composableBuilder(
    column: $table.extraFields,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VehiclesTableAnnotationComposer
    extends Composer<_$AppDatabase, $VehiclesTable> {
  $$VehiclesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<String> get make =>
      $composableBuilder(column: $table.make, builder: (column) => column);

  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  GeneratedColumn<String> get licensePlate => $composableBuilder(
    column: $table.licensePlate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isElectric => $composableBuilder(
    column: $table.isElectric,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDiesel =>
      $composableBuilder(column: $table.isDiesel, builder: (column) => column);

  GeneratedColumn<bool> get useHours =>
      $composableBuilder(column: $table.useHours, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get extraFields => $composableBuilder(
    column: $table.extraFields,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$VehiclesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VehiclesTable,
          Vehicle,
          $$VehiclesTableFilterComposer,
          $$VehiclesTableOrderingComposer,
          $$VehiclesTableAnnotationComposer,
          $$VehiclesTableCreateCompanionBuilder,
          $$VehiclesTableUpdateCompanionBuilder,
          (Vehicle, BaseReferences<_$AppDatabase, $VehiclesTable, Vehicle>),
          Vehicle,
          PrefetchHooks Function()
        > {
  $$VehiclesTableTableManager(_$AppDatabase db, $VehiclesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehiclesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehiclesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehiclesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                Value<String> year = const Value.absent(),
                Value<String> make = const Value.absent(),
                Value<String> model = const Value.absent(),
                Value<String> licensePlate = const Value.absent(),
                Value<bool> isElectric = const Value.absent(),
                Value<bool> isDiesel = const Value.absent(),
                Value<bool> useHours = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<String> extraFields = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => VehiclesCompanion(
                id: id,
                remoteId: remoteId,
                year: year,
                make: make,
                model: model,
                licensePlate: licensePlate,
                isElectric: isElectric,
                isDiesel: isDiesel,
                useHours: useHours,
                tags: tags,
                extraFields: extraFields,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                required String year,
                required String make,
                required String model,
                Value<String> licensePlate = const Value.absent(),
                Value<bool> isElectric = const Value.absent(),
                Value<bool> isDiesel = const Value.absent(),
                Value<bool> useHours = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<String> extraFields = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => VehiclesCompanion.insert(
                id: id,
                remoteId: remoteId,
                year: year,
                make: make,
                model: model,
                licensePlate: licensePlate,
                isElectric: isElectric,
                isDiesel: isDiesel,
                useHours: useHours,
                tags: tags,
                extraFields: extraFields,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VehiclesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VehiclesTable,
      Vehicle,
      $$VehiclesTableFilterComposer,
      $$VehiclesTableOrderingComposer,
      $$VehiclesTableAnnotationComposer,
      $$VehiclesTableCreateCompanionBuilder,
      $$VehiclesTableUpdateCompanionBuilder,
      (Vehicle, BaseReferences<_$AppDatabase, $VehiclesTable, Vehicle>),
      Vehicle,
      PrefetchHooks Function()
    >;
typedef $$ServiceRecordsTableCreateCompanionBuilder =
    ServiceRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      required int vehicleId,
      required DateTime date,
      Value<double> mileage,
      required String description,
      Value<double> cost,
      Value<String> notes,
      Value<String> tags,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });
typedef $$ServiceRecordsTableUpdateCompanionBuilder =
    ServiceRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      Value<int> vehicleId,
      Value<DateTime> date,
      Value<double> mileage,
      Value<String> description,
      Value<double> cost,
      Value<String> notes,
      Value<String> tags,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

class $$ServiceRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $ServiceRecordsTable> {
  $$ServiceRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ServiceRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $ServiceRecordsTable> {
  $$ServiceRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ServiceRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ServiceRecordsTable> {
  $$ServiceRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get vehicleId =>
      $composableBuilder(column: $table.vehicleId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get mileage =>
      $composableBuilder(column: $table.mileage, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$ServiceRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ServiceRecordsTable,
          ServiceRecord,
          $$ServiceRecordsTableFilterComposer,
          $$ServiceRecordsTableOrderingComposer,
          $$ServiceRecordsTableAnnotationComposer,
          $$ServiceRecordsTableCreateCompanionBuilder,
          $$ServiceRecordsTableUpdateCompanionBuilder,
          (
            ServiceRecord,
            BaseReferences<_$AppDatabase, $ServiceRecordsTable, ServiceRecord>,
          ),
          ServiceRecord,
          PrefetchHooks Function()
        > {
  $$ServiceRecordsTableTableManager(
    _$AppDatabase db,
    $ServiceRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServiceRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServiceRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServiceRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                Value<int> vehicleId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> mileage = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<double> cost = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => ServiceRecordsCompanion(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                date: date,
                mileage: mileage,
                description: description,
                cost: cost,
                notes: notes,
                tags: tags,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                required int vehicleId,
                required DateTime date,
                Value<double> mileage = const Value.absent(),
                required String description,
                Value<double> cost = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => ServiceRecordsCompanion.insert(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                date: date,
                mileage: mileage,
                description: description,
                cost: cost,
                notes: notes,
                tags: tags,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ServiceRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ServiceRecordsTable,
      ServiceRecord,
      $$ServiceRecordsTableFilterComposer,
      $$ServiceRecordsTableOrderingComposer,
      $$ServiceRecordsTableAnnotationComposer,
      $$ServiceRecordsTableCreateCompanionBuilder,
      $$ServiceRecordsTableUpdateCompanionBuilder,
      (
        ServiceRecord,
        BaseReferences<_$AppDatabase, $ServiceRecordsTable, ServiceRecord>,
      ),
      ServiceRecord,
      PrefetchHooks Function()
    >;
typedef $$RepairRecordsTableCreateCompanionBuilder =
    RepairRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      required int vehicleId,
      required DateTime date,
      Value<double> mileage,
      required String description,
      Value<double> cost,
      Value<String> notes,
      Value<String> tags,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });
typedef $$RepairRecordsTableUpdateCompanionBuilder =
    RepairRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      Value<int> vehicleId,
      Value<DateTime> date,
      Value<double> mileage,
      Value<String> description,
      Value<double> cost,
      Value<String> notes,
      Value<String> tags,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

class $$RepairRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $RepairRecordsTable> {
  $$RepairRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RepairRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $RepairRecordsTable> {
  $$RepairRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RepairRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RepairRecordsTable> {
  $$RepairRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get vehicleId =>
      $composableBuilder(column: $table.vehicleId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get mileage =>
      $composableBuilder(column: $table.mileage, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$RepairRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RepairRecordsTable,
          RepairRecord,
          $$RepairRecordsTableFilterComposer,
          $$RepairRecordsTableOrderingComposer,
          $$RepairRecordsTableAnnotationComposer,
          $$RepairRecordsTableCreateCompanionBuilder,
          $$RepairRecordsTableUpdateCompanionBuilder,
          (
            RepairRecord,
            BaseReferences<_$AppDatabase, $RepairRecordsTable, RepairRecord>,
          ),
          RepairRecord,
          PrefetchHooks Function()
        > {
  $$RepairRecordsTableTableManager(_$AppDatabase db, $RepairRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RepairRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RepairRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RepairRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                Value<int> vehicleId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> mileage = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<double> cost = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => RepairRecordsCompanion(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                date: date,
                mileage: mileage,
                description: description,
                cost: cost,
                notes: notes,
                tags: tags,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                required int vehicleId,
                required DateTime date,
                Value<double> mileage = const Value.absent(),
                required String description,
                Value<double> cost = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => RepairRecordsCompanion.insert(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                date: date,
                mileage: mileage,
                description: description,
                cost: cost,
                notes: notes,
                tags: tags,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RepairRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RepairRecordsTable,
      RepairRecord,
      $$RepairRecordsTableFilterComposer,
      $$RepairRecordsTableOrderingComposer,
      $$RepairRecordsTableAnnotationComposer,
      $$RepairRecordsTableCreateCompanionBuilder,
      $$RepairRecordsTableUpdateCompanionBuilder,
      (
        RepairRecord,
        BaseReferences<_$AppDatabase, $RepairRecordsTable, RepairRecord>,
      ),
      RepairRecord,
      PrefetchHooks Function()
    >;
typedef $$UpgradeRecordsTableCreateCompanionBuilder =
    UpgradeRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      required int vehicleId,
      required DateTime date,
      Value<double> mileage,
      required String description,
      Value<double> cost,
      Value<String> notes,
      Value<String> tags,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });
typedef $$UpgradeRecordsTableUpdateCompanionBuilder =
    UpgradeRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      Value<int> vehicleId,
      Value<DateTime> date,
      Value<double> mileage,
      Value<String> description,
      Value<double> cost,
      Value<String> notes,
      Value<String> tags,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

class $$UpgradeRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $UpgradeRecordsTable> {
  $$UpgradeRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UpgradeRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $UpgradeRecordsTable> {
  $$UpgradeRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UpgradeRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UpgradeRecordsTable> {
  $$UpgradeRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get vehicleId =>
      $composableBuilder(column: $table.vehicleId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get mileage =>
      $composableBuilder(column: $table.mileage, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$UpgradeRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UpgradeRecordsTable,
          UpgradeRecord,
          $$UpgradeRecordsTableFilterComposer,
          $$UpgradeRecordsTableOrderingComposer,
          $$UpgradeRecordsTableAnnotationComposer,
          $$UpgradeRecordsTableCreateCompanionBuilder,
          $$UpgradeRecordsTableUpdateCompanionBuilder,
          (
            UpgradeRecord,
            BaseReferences<_$AppDatabase, $UpgradeRecordsTable, UpgradeRecord>,
          ),
          UpgradeRecord,
          PrefetchHooks Function()
        > {
  $$UpgradeRecordsTableTableManager(
    _$AppDatabase db,
    $UpgradeRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UpgradeRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UpgradeRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UpgradeRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                Value<int> vehicleId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> mileage = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<double> cost = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => UpgradeRecordsCompanion(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                date: date,
                mileage: mileage,
                description: description,
                cost: cost,
                notes: notes,
                tags: tags,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                required int vehicleId,
                required DateTime date,
                Value<double> mileage = const Value.absent(),
                required String description,
                Value<double> cost = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => UpgradeRecordsCompanion.insert(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                date: date,
                mileage: mileage,
                description: description,
                cost: cost,
                notes: notes,
                tags: tags,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UpgradeRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UpgradeRecordsTable,
      UpgradeRecord,
      $$UpgradeRecordsTableFilterComposer,
      $$UpgradeRecordsTableOrderingComposer,
      $$UpgradeRecordsTableAnnotationComposer,
      $$UpgradeRecordsTableCreateCompanionBuilder,
      $$UpgradeRecordsTableUpdateCompanionBuilder,
      (
        UpgradeRecord,
        BaseReferences<_$AppDatabase, $UpgradeRecordsTable, UpgradeRecord>,
      ),
      UpgradeRecord,
      PrefetchHooks Function()
    >;
typedef $$GasRecordsTableCreateCompanionBuilder =
    GasRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      required int vehicleId,
      required DateTime date,
      Value<double> mileage,
      Value<double> gallons,
      Value<double> cost,
      Value<bool> isFillToFull,
      Value<bool> missedFuelUp,
      Value<double?> mpg,
      Value<String> notes,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });
typedef $$GasRecordsTableUpdateCompanionBuilder =
    GasRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      Value<int> vehicleId,
      Value<DateTime> date,
      Value<double> mileage,
      Value<double> gallons,
      Value<double> cost,
      Value<bool> isFillToFull,
      Value<bool> missedFuelUp,
      Value<double?> mpg,
      Value<String> notes,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

class $$GasRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $GasRecordsTable> {
  $$GasRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gallons => $composableBuilder(
    column: $table.gallons,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFillToFull => $composableBuilder(
    column: $table.isFillToFull,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get missedFuelUp => $composableBuilder(
    column: $table.missedFuelUp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mpg => $composableBuilder(
    column: $table.mpg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GasRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $GasRecordsTable> {
  $$GasRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gallons => $composableBuilder(
    column: $table.gallons,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFillToFull => $composableBuilder(
    column: $table.isFillToFull,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get missedFuelUp => $composableBuilder(
    column: $table.missedFuelUp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mpg => $composableBuilder(
    column: $table.mpg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GasRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GasRecordsTable> {
  $$GasRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get vehicleId =>
      $composableBuilder(column: $table.vehicleId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get mileage =>
      $composableBuilder(column: $table.mileage, builder: (column) => column);

  GeneratedColumn<double> get gallons =>
      $composableBuilder(column: $table.gallons, builder: (column) => column);

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<bool> get isFillToFull => $composableBuilder(
    column: $table.isFillToFull,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get missedFuelUp => $composableBuilder(
    column: $table.missedFuelUp,
    builder: (column) => column,
  );

  GeneratedColumn<double> get mpg =>
      $composableBuilder(column: $table.mpg, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$GasRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GasRecordsTable,
          GasRecord,
          $$GasRecordsTableFilterComposer,
          $$GasRecordsTableOrderingComposer,
          $$GasRecordsTableAnnotationComposer,
          $$GasRecordsTableCreateCompanionBuilder,
          $$GasRecordsTableUpdateCompanionBuilder,
          (
            GasRecord,
            BaseReferences<_$AppDatabase, $GasRecordsTable, GasRecord>,
          ),
          GasRecord,
          PrefetchHooks Function()
        > {
  $$GasRecordsTableTableManager(_$AppDatabase db, $GasRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GasRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GasRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GasRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                Value<int> vehicleId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> mileage = const Value.absent(),
                Value<double> gallons = const Value.absent(),
                Value<double> cost = const Value.absent(),
                Value<bool> isFillToFull = const Value.absent(),
                Value<bool> missedFuelUp = const Value.absent(),
                Value<double?> mpg = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => GasRecordsCompanion(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                date: date,
                mileage: mileage,
                gallons: gallons,
                cost: cost,
                isFillToFull: isFillToFull,
                missedFuelUp: missedFuelUp,
                mpg: mpg,
                notes: notes,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                required int vehicleId,
                required DateTime date,
                Value<double> mileage = const Value.absent(),
                Value<double> gallons = const Value.absent(),
                Value<double> cost = const Value.absent(),
                Value<bool> isFillToFull = const Value.absent(),
                Value<bool> missedFuelUp = const Value.absent(),
                Value<double?> mpg = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => GasRecordsCompanion.insert(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                date: date,
                mileage: mileage,
                gallons: gallons,
                cost: cost,
                isFillToFull: isFillToFull,
                missedFuelUp: missedFuelUp,
                mpg: mpg,
                notes: notes,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GasRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GasRecordsTable,
      GasRecord,
      $$GasRecordsTableFilterComposer,
      $$GasRecordsTableOrderingComposer,
      $$GasRecordsTableAnnotationComposer,
      $$GasRecordsTableCreateCompanionBuilder,
      $$GasRecordsTableUpdateCompanionBuilder,
      (GasRecord, BaseReferences<_$AppDatabase, $GasRecordsTable, GasRecord>),
      GasRecord,
      PrefetchHooks Function()
    >;
typedef $$OdometerRecordsTableCreateCompanionBuilder =
    OdometerRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      required int vehicleId,
      required DateTime date,
      Value<double> mileage,
      Value<double> initialMileage,
      Value<String> notes,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });
typedef $$OdometerRecordsTableUpdateCompanionBuilder =
    OdometerRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      Value<int> vehicleId,
      Value<DateTime> date,
      Value<double> mileage,
      Value<double> initialMileage,
      Value<String> notes,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

class $$OdometerRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $OdometerRecordsTable> {
  $$OdometerRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get initialMileage => $composableBuilder(
    column: $table.initialMileage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OdometerRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $OdometerRecordsTable> {
  $$OdometerRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get initialMileage => $composableBuilder(
    column: $table.initialMileage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OdometerRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OdometerRecordsTable> {
  $$OdometerRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get vehicleId =>
      $composableBuilder(column: $table.vehicleId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get mileage =>
      $composableBuilder(column: $table.mileage, builder: (column) => column);

  GeneratedColumn<double> get initialMileage => $composableBuilder(
    column: $table.initialMileage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$OdometerRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OdometerRecordsTable,
          OdometerRecord,
          $$OdometerRecordsTableFilterComposer,
          $$OdometerRecordsTableOrderingComposer,
          $$OdometerRecordsTableAnnotationComposer,
          $$OdometerRecordsTableCreateCompanionBuilder,
          $$OdometerRecordsTableUpdateCompanionBuilder,
          (
            OdometerRecord,
            BaseReferences<
              _$AppDatabase,
              $OdometerRecordsTable,
              OdometerRecord
            >,
          ),
          OdometerRecord,
          PrefetchHooks Function()
        > {
  $$OdometerRecordsTableTableManager(
    _$AppDatabase db,
    $OdometerRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OdometerRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OdometerRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OdometerRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                Value<int> vehicleId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> mileage = const Value.absent(),
                Value<double> initialMileage = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => OdometerRecordsCompanion(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                date: date,
                mileage: mileage,
                initialMileage: initialMileage,
                notes: notes,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                required int vehicleId,
                required DateTime date,
                Value<double> mileage = const Value.absent(),
                Value<double> initialMileage = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => OdometerRecordsCompanion.insert(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                date: date,
                mileage: mileage,
                initialMileage: initialMileage,
                notes: notes,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OdometerRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OdometerRecordsTable,
      OdometerRecord,
      $$OdometerRecordsTableFilterComposer,
      $$OdometerRecordsTableOrderingComposer,
      $$OdometerRecordsTableAnnotationComposer,
      $$OdometerRecordsTableCreateCompanionBuilder,
      $$OdometerRecordsTableUpdateCompanionBuilder,
      (
        OdometerRecord,
        BaseReferences<_$AppDatabase, $OdometerRecordsTable, OdometerRecord>,
      ),
      OdometerRecord,
      PrefetchHooks Function()
    >;
typedef $$TaxRecordsTableCreateCompanionBuilder =
    TaxRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      required int vehicleId,
      required DateTime date,
      required String description,
      Value<double> cost,
      Value<bool> isRecurring,
      Value<String> recurringInterval,
      Value<String> notes,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });
typedef $$TaxRecordsTableUpdateCompanionBuilder =
    TaxRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      Value<int> vehicleId,
      Value<DateTime> date,
      Value<String> description,
      Value<double> cost,
      Value<bool> isRecurring,
      Value<String> recurringInterval,
      Value<String> notes,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

class $$TaxRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $TaxRecordsTable> {
  $$TaxRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRecurring => $composableBuilder(
    column: $table.isRecurring,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recurringInterval => $composableBuilder(
    column: $table.recurringInterval,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TaxRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $TaxRecordsTable> {
  $$TaxRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRecurring => $composableBuilder(
    column: $table.isRecurring,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recurringInterval => $composableBuilder(
    column: $table.recurringInterval,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TaxRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaxRecordsTable> {
  $$TaxRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get vehicleId =>
      $composableBuilder(column: $table.vehicleId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<bool> get isRecurring => $composableBuilder(
    column: $table.isRecurring,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recurringInterval => $composableBuilder(
    column: $table.recurringInterval,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$TaxRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TaxRecordsTable,
          TaxRecord,
          $$TaxRecordsTableFilterComposer,
          $$TaxRecordsTableOrderingComposer,
          $$TaxRecordsTableAnnotationComposer,
          $$TaxRecordsTableCreateCompanionBuilder,
          $$TaxRecordsTableUpdateCompanionBuilder,
          (
            TaxRecord,
            BaseReferences<_$AppDatabase, $TaxRecordsTable, TaxRecord>,
          ),
          TaxRecord,
          PrefetchHooks Function()
        > {
  $$TaxRecordsTableTableManager(_$AppDatabase db, $TaxRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaxRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaxRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaxRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                Value<int> vehicleId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<double> cost = const Value.absent(),
                Value<bool> isRecurring = const Value.absent(),
                Value<String> recurringInterval = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => TaxRecordsCompanion(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                date: date,
                description: description,
                cost: cost,
                isRecurring: isRecurring,
                recurringInterval: recurringInterval,
                notes: notes,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                required int vehicleId,
                required DateTime date,
                required String description,
                Value<double> cost = const Value.absent(),
                Value<bool> isRecurring = const Value.absent(),
                Value<String> recurringInterval = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => TaxRecordsCompanion.insert(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                date: date,
                description: description,
                cost: cost,
                isRecurring: isRecurring,
                recurringInterval: recurringInterval,
                notes: notes,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TaxRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TaxRecordsTable,
      TaxRecord,
      $$TaxRecordsTableFilterComposer,
      $$TaxRecordsTableOrderingComposer,
      $$TaxRecordsTableAnnotationComposer,
      $$TaxRecordsTableCreateCompanionBuilder,
      $$TaxRecordsTableUpdateCompanionBuilder,
      (TaxRecord, BaseReferences<_$AppDatabase, $TaxRecordsTable, TaxRecord>),
      TaxRecord,
      PrefetchHooks Function()
    >;
typedef $$ReminderRecordsTableCreateCompanionBuilder =
    ReminderRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      required int vehicleId,
      required String description,
      Value<String> reminderMetric,
      Value<DateTime?> dateMetric,
      Value<double?> mileageMetric,
      Value<bool> isRecurring,
      Value<String> notes,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });
typedef $$ReminderRecordsTableUpdateCompanionBuilder =
    ReminderRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      Value<int> vehicleId,
      Value<String> description,
      Value<String> reminderMetric,
      Value<DateTime?> dateMetric,
      Value<double?> mileageMetric,
      Value<bool> isRecurring,
      Value<String> notes,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

class $$ReminderRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $ReminderRecordsTable> {
  $$ReminderRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reminderMetric => $composableBuilder(
    column: $table.reminderMetric,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateMetric => $composableBuilder(
    column: $table.dateMetric,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mileageMetric => $composableBuilder(
    column: $table.mileageMetric,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRecurring => $composableBuilder(
    column: $table.isRecurring,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReminderRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReminderRecordsTable> {
  $$ReminderRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reminderMetric => $composableBuilder(
    column: $table.reminderMetric,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateMetric => $composableBuilder(
    column: $table.dateMetric,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mileageMetric => $composableBuilder(
    column: $table.mileageMetric,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRecurring => $composableBuilder(
    column: $table.isRecurring,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReminderRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReminderRecordsTable> {
  $$ReminderRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get vehicleId =>
      $composableBuilder(column: $table.vehicleId, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reminderMetric => $composableBuilder(
    column: $table.reminderMetric,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateMetric => $composableBuilder(
    column: $table.dateMetric,
    builder: (column) => column,
  );

  GeneratedColumn<double> get mileageMetric => $composableBuilder(
    column: $table.mileageMetric,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isRecurring => $composableBuilder(
    column: $table.isRecurring,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$ReminderRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReminderRecordsTable,
          ReminderRecord,
          $$ReminderRecordsTableFilterComposer,
          $$ReminderRecordsTableOrderingComposer,
          $$ReminderRecordsTableAnnotationComposer,
          $$ReminderRecordsTableCreateCompanionBuilder,
          $$ReminderRecordsTableUpdateCompanionBuilder,
          (
            ReminderRecord,
            BaseReferences<
              _$AppDatabase,
              $ReminderRecordsTable,
              ReminderRecord
            >,
          ),
          ReminderRecord,
          PrefetchHooks Function()
        > {
  $$ReminderRecordsTableTableManager(
    _$AppDatabase db,
    $ReminderRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReminderRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReminderRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReminderRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                Value<int> vehicleId = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> reminderMetric = const Value.absent(),
                Value<DateTime?> dateMetric = const Value.absent(),
                Value<double?> mileageMetric = const Value.absent(),
                Value<bool> isRecurring = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => ReminderRecordsCompanion(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                description: description,
                reminderMetric: reminderMetric,
                dateMetric: dateMetric,
                mileageMetric: mileageMetric,
                isRecurring: isRecurring,
                notes: notes,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                required int vehicleId,
                required String description,
                Value<String> reminderMetric = const Value.absent(),
                Value<DateTime?> dateMetric = const Value.absent(),
                Value<double?> mileageMetric = const Value.absent(),
                Value<bool> isRecurring = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => ReminderRecordsCompanion.insert(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                description: description,
                reminderMetric: reminderMetric,
                dateMetric: dateMetric,
                mileageMetric: mileageMetric,
                isRecurring: isRecurring,
                notes: notes,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReminderRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReminderRecordsTable,
      ReminderRecord,
      $$ReminderRecordsTableFilterComposer,
      $$ReminderRecordsTableOrderingComposer,
      $$ReminderRecordsTableAnnotationComposer,
      $$ReminderRecordsTableCreateCompanionBuilder,
      $$ReminderRecordsTableUpdateCompanionBuilder,
      (
        ReminderRecord,
        BaseReferences<_$AppDatabase, $ReminderRecordsTable, ReminderRecord>,
      ),
      ReminderRecord,
      PrefetchHooks Function()
    >;
typedef $$PlanRecordsTableCreateCompanionBuilder =
    PlanRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      required int vehicleId,
      required String description,
      Value<String> priority,
      Value<String> progress,
      Value<String> notes,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });
typedef $$PlanRecordsTableUpdateCompanionBuilder =
    PlanRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      Value<int> vehicleId,
      Value<String> description,
      Value<String> priority,
      Value<String> progress,
      Value<String> notes,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

class $$PlanRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $PlanRecordsTable> {
  $$PlanRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlanRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlanRecordsTable> {
  $$PlanRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlanRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlanRecordsTable> {
  $$PlanRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get vehicleId =>
      $composableBuilder(column: $table.vehicleId, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$PlanRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlanRecordsTable,
          PlanRecord,
          $$PlanRecordsTableFilterComposer,
          $$PlanRecordsTableOrderingComposer,
          $$PlanRecordsTableAnnotationComposer,
          $$PlanRecordsTableCreateCompanionBuilder,
          $$PlanRecordsTableUpdateCompanionBuilder,
          (
            PlanRecord,
            BaseReferences<_$AppDatabase, $PlanRecordsTable, PlanRecord>,
          ),
          PlanRecord,
          PrefetchHooks Function()
        > {
  $$PlanRecordsTableTableManager(_$AppDatabase db, $PlanRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlanRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlanRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlanRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                Value<int> vehicleId = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<String> progress = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => PlanRecordsCompanion(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                description: description,
                priority: priority,
                progress: progress,
                notes: notes,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                required int vehicleId,
                required String description,
                Value<String> priority = const Value.absent(),
                Value<String> progress = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => PlanRecordsCompanion.insert(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                description: description,
                priority: priority,
                progress: progress,
                notes: notes,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlanRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlanRecordsTable,
      PlanRecord,
      $$PlanRecordsTableFilterComposer,
      $$PlanRecordsTableOrderingComposer,
      $$PlanRecordsTableAnnotationComposer,
      $$PlanRecordsTableCreateCompanionBuilder,
      $$PlanRecordsTableUpdateCompanionBuilder,
      (
        PlanRecord,
        BaseReferences<_$AppDatabase, $PlanRecordsTable, PlanRecord>,
      ),
      PlanRecord,
      PrefetchHooks Function()
    >;
typedef $$SupplyRecordsTableCreateCompanionBuilder =
    SupplyRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      required int vehicleId,
      Value<String> partNumber,
      required String description,
      Value<double> quantity,
      Value<double> cost,
      Value<String> notes,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });
typedef $$SupplyRecordsTableUpdateCompanionBuilder =
    SupplyRecordsCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      Value<int> vehicleId,
      Value<String> partNumber,
      Value<String> description,
      Value<double> quantity,
      Value<double> cost,
      Value<String> notes,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

class $$SupplyRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $SupplyRecordsTable> {
  $$SupplyRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get partNumber => $composableBuilder(
    column: $table.partNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SupplyRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $SupplyRecordsTable> {
  $$SupplyRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partNumber => $composableBuilder(
    column: $table.partNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SupplyRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SupplyRecordsTable> {
  $$SupplyRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get vehicleId =>
      $composableBuilder(column: $table.vehicleId, builder: (column) => column);

  GeneratedColumn<String> get partNumber => $composableBuilder(
    column: $table.partNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$SupplyRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SupplyRecordsTable,
          SupplyRecord,
          $$SupplyRecordsTableFilterComposer,
          $$SupplyRecordsTableOrderingComposer,
          $$SupplyRecordsTableAnnotationComposer,
          $$SupplyRecordsTableCreateCompanionBuilder,
          $$SupplyRecordsTableUpdateCompanionBuilder,
          (
            SupplyRecord,
            BaseReferences<_$AppDatabase, $SupplyRecordsTable, SupplyRecord>,
          ),
          SupplyRecord,
          PrefetchHooks Function()
        > {
  $$SupplyRecordsTableTableManager(_$AppDatabase db, $SupplyRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SupplyRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SupplyRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SupplyRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                Value<int> vehicleId = const Value.absent(),
                Value<String> partNumber = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<double> cost = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => SupplyRecordsCompanion(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                partNumber: partNumber,
                description: description,
                quantity: quantity,
                cost: cost,
                notes: notes,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                required int vehicleId,
                Value<String> partNumber = const Value.absent(),
                required String description,
                Value<double> quantity = const Value.absent(),
                Value<double> cost = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => SupplyRecordsCompanion.insert(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                partNumber: partNumber,
                description: description,
                quantity: quantity,
                cost: cost,
                notes: notes,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SupplyRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SupplyRecordsTable,
      SupplyRecord,
      $$SupplyRecordsTableFilterComposer,
      $$SupplyRecordsTableOrderingComposer,
      $$SupplyRecordsTableAnnotationComposer,
      $$SupplyRecordsTableCreateCompanionBuilder,
      $$SupplyRecordsTableUpdateCompanionBuilder,
      (
        SupplyRecord,
        BaseReferences<_$AppDatabase, $SupplyRecordsTable, SupplyRecord>,
      ),
      SupplyRecord,
      PrefetchHooks Function()
    >;
typedef $$NotesTableCreateCompanionBuilder =
    NotesCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      required int vehicleId,
      required String title,
      Value<String> body,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });
typedef $$NotesTableUpdateCompanionBuilder =
    NotesCompanion Function({
      Value<int> id,
      Value<int?> remoteId,
      Value<int> vehicleId,
      Value<String> title,
      Value<String> body,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
    });

class $$NotesTableFilterComposer extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotesTableOrderingComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vehicleId => $composableBuilder(
    column: $table.vehicleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get vehicleId =>
      $composableBuilder(column: $table.vehicleId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$NotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotesTable,
          Note,
          $$NotesTableFilterComposer,
          $$NotesTableOrderingComposer,
          $$NotesTableAnnotationComposer,
          $$NotesTableCreateCompanionBuilder,
          $$NotesTableUpdateCompanionBuilder,
          (Note, BaseReferences<_$AppDatabase, $NotesTable, Note>),
          Note,
          PrefetchHooks Function()
        > {
  $$NotesTableTableManager(_$AppDatabase db, $NotesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                Value<int> vehicleId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => NotesCompanion(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                title: title,
                body: body,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                required int vehicleId,
                required String title,
                Value<String> body = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
              }) => NotesCompanion.insert(
                id: id,
                remoteId: remoteId,
                vehicleId: vehicleId,
                title: title,
                body: body,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotesTable,
      Note,
      $$NotesTableFilterComposer,
      $$NotesTableOrderingComposer,
      $$NotesTableAnnotationComposer,
      $$NotesTableCreateCompanionBuilder,
      $$NotesTableUpdateCompanionBuilder,
      (Note, BaseReferences<_$AppDatabase, $NotesTable, Note>),
      Note,
      PrefetchHooks Function()
    >;
typedef $$SyncQueueTableCreateCompanionBuilder =
    SyncQueueCompanion Function({
      Value<int> id,
      required String entityType,
      required int localId,
      Value<int?> remoteId,
      required String operation,
      required String payload,
      Value<int> retryCount,
      Value<DateTime> createdAt,
      Value<DateTime> nextRetryAt,
      Value<String> status,
    });
typedef $$SyncQueueTableUpdateCompanionBuilder =
    SyncQueueCompanion Function({
      Value<int> id,
      Value<String> entityType,
      Value<int> localId,
      Value<int?> remoteId,
      Value<String> operation,
      Value<String> payload,
      Value<int> retryCount,
      Value<DateTime> createdAt,
      Value<DateTime> nextRetryAt,
      Value<String> status,
    });

class $$SyncQueueTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextRetryAt => $composableBuilder(
    column: $table.nextRetryAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextRetryAt => $composableBuilder(
    column: $table.nextRetryAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get nextRetryAt => $composableBuilder(
    column: $table.nextRetryAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$SyncQueueTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncQueueTable,
          SyncQueueData,
          $$SyncQueueTableFilterComposer,
          $$SyncQueueTableOrderingComposer,
          $$SyncQueueTableAnnotationComposer,
          $$SyncQueueTableCreateCompanionBuilder,
          $$SyncQueueTableUpdateCompanionBuilder,
          (
            SyncQueueData,
            BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>,
          ),
          SyncQueueData,
          PrefetchHooks Function()
        > {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<int> localId = const Value.absent(),
                Value<int?> remoteId = const Value.absent(),
                Value<String> operation = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> nextRetryAt = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => SyncQueueCompanion(
                id: id,
                entityType: entityType,
                localId: localId,
                remoteId: remoteId,
                operation: operation,
                payload: payload,
                retryCount: retryCount,
                createdAt: createdAt,
                nextRetryAt: nextRetryAt,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entityType,
                required int localId,
                Value<int?> remoteId = const Value.absent(),
                required String operation,
                required String payload,
                Value<int> retryCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> nextRetryAt = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => SyncQueueCompanion.insert(
                id: id,
                entityType: entityType,
                localId: localId,
                remoteId: remoteId,
                operation: operation,
                payload: payload,
                retryCount: retryCount,
                createdAt: createdAt,
                nextRetryAt: nextRetryAt,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncQueueTable,
      SyncQueueData,
      $$SyncQueueTableFilterComposer,
      $$SyncQueueTableOrderingComposer,
      $$SyncQueueTableAnnotationComposer,
      $$SyncQueueTableCreateCompanionBuilder,
      $$SyncQueueTableUpdateCompanionBuilder,
      (
        SyncQueueData,
        BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>,
      ),
      SyncQueueData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$VehiclesTableTableManager get vehicles =>
      $$VehiclesTableTableManager(_db, _db.vehicles);
  $$ServiceRecordsTableTableManager get serviceRecords =>
      $$ServiceRecordsTableTableManager(_db, _db.serviceRecords);
  $$RepairRecordsTableTableManager get repairRecords =>
      $$RepairRecordsTableTableManager(_db, _db.repairRecords);
  $$UpgradeRecordsTableTableManager get upgradeRecords =>
      $$UpgradeRecordsTableTableManager(_db, _db.upgradeRecords);
  $$GasRecordsTableTableManager get gasRecords =>
      $$GasRecordsTableTableManager(_db, _db.gasRecords);
  $$OdometerRecordsTableTableManager get odometerRecords =>
      $$OdometerRecordsTableTableManager(_db, _db.odometerRecords);
  $$TaxRecordsTableTableManager get taxRecords =>
      $$TaxRecordsTableTableManager(_db, _db.taxRecords);
  $$ReminderRecordsTableTableManager get reminderRecords =>
      $$ReminderRecordsTableTableManager(_db, _db.reminderRecords);
  $$PlanRecordsTableTableManager get planRecords =>
      $$PlanRecordsTableTableManager(_db, _db.planRecords);
  $$SupplyRecordsTableTableManager get supplyRecords =>
      $$SupplyRecordsTableTableManager(_db, _db.supplyRecords);
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db, _db.notes);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
}
