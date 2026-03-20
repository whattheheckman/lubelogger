// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$repairRecordListHash() => r'815ff945da47e0ce519b0436ef540fa9ab2ca290';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [repairRecordList].
@ProviderFor(repairRecordList)
const repairRecordListProvider = RepairRecordListFamily();

/// See also [repairRecordList].
class RepairRecordListFamily extends Family<AsyncValue<List<RepairRecord>>> {
  /// See also [repairRecordList].
  const RepairRecordListFamily();

  /// See also [repairRecordList].
  RepairRecordListProvider call(int vehicleId) {
    return RepairRecordListProvider(vehicleId);
  }

  @override
  RepairRecordListProvider getProviderOverride(
    covariant RepairRecordListProvider provider,
  ) {
    return call(provider.vehicleId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'repairRecordListProvider';
}

/// See also [repairRecordList].
class RepairRecordListProvider
    extends AutoDisposeStreamProvider<List<RepairRecord>> {
  /// See also [repairRecordList].
  RepairRecordListProvider(int vehicleId)
    : this._internal(
        (ref) => repairRecordList(ref as RepairRecordListRef, vehicleId),
        from: repairRecordListProvider,
        name: r'repairRecordListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$repairRecordListHash,
        dependencies: RepairRecordListFamily._dependencies,
        allTransitiveDependencies:
            RepairRecordListFamily._allTransitiveDependencies,
        vehicleId: vehicleId,
      );

  RepairRecordListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.vehicleId,
  }) : super.internal();

  final int vehicleId;

  @override
  Override overrideWith(
    Stream<List<RepairRecord>> Function(RepairRecordListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RepairRecordListProvider._internal(
        (ref) => create(ref as RepairRecordListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        vehicleId: vehicleId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<RepairRecord>> createElement() {
    return _RepairRecordListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RepairRecordListProvider && other.vehicleId == vehicleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, vehicleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RepairRecordListRef on AutoDisposeStreamProviderRef<List<RepairRecord>> {
  /// The parameter `vehicleId` of this provider.
  int get vehicleId;
}

class _RepairRecordListProviderElement
    extends AutoDisposeStreamProviderElement<List<RepairRecord>>
    with RepairRecordListRef {
  _RepairRecordListProviderElement(super.provider);

  @override
  int get vehicleId => (origin as RepairRecordListProvider).vehicleId;
}

String _$repairRecordsNotifierHash() =>
    r'd07444187656ef0c0850380255c0c8eaff78909f';

/// See also [RepairRecordsNotifier].
@ProviderFor(RepairRecordsNotifier)
final repairRecordsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<RepairRecordsNotifier, void>.internal(
      RepairRecordsNotifier.new,
      name: r'repairRecordsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$repairRecordsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RepairRecordsNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
