// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supplyRecordListHash() => r'36694302407c4517178f4726bc46ad6f0cf3d9f2';

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

/// See also [supplyRecordList].
@ProviderFor(supplyRecordList)
const supplyRecordListProvider = SupplyRecordListFamily();

/// See also [supplyRecordList].
class SupplyRecordListFamily extends Family<AsyncValue<List<SupplyRecord>>> {
  /// See also [supplyRecordList].
  const SupplyRecordListFamily();

  /// See also [supplyRecordList].
  SupplyRecordListProvider call(int vehicleId) {
    return SupplyRecordListProvider(vehicleId);
  }

  @override
  SupplyRecordListProvider getProviderOverride(
    covariant SupplyRecordListProvider provider,
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
  String? get name => r'supplyRecordListProvider';
}

/// See also [supplyRecordList].
class SupplyRecordListProvider
    extends AutoDisposeStreamProvider<List<SupplyRecord>> {
  /// See also [supplyRecordList].
  SupplyRecordListProvider(int vehicleId)
    : this._internal(
        (ref) => supplyRecordList(ref as SupplyRecordListRef, vehicleId),
        from: supplyRecordListProvider,
        name: r'supplyRecordListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$supplyRecordListHash,
        dependencies: SupplyRecordListFamily._dependencies,
        allTransitiveDependencies:
            SupplyRecordListFamily._allTransitiveDependencies,
        vehicleId: vehicleId,
      );

  SupplyRecordListProvider._internal(
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
    Stream<List<SupplyRecord>> Function(SupplyRecordListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SupplyRecordListProvider._internal(
        (ref) => create(ref as SupplyRecordListRef),
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
  AutoDisposeStreamProviderElement<List<SupplyRecord>> createElement() {
    return _SupplyRecordListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SupplyRecordListProvider && other.vehicleId == vehicleId;
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
mixin SupplyRecordListRef on AutoDisposeStreamProviderRef<List<SupplyRecord>> {
  /// The parameter `vehicleId` of this provider.
  int get vehicleId;
}

class _SupplyRecordListProviderElement
    extends AutoDisposeStreamProviderElement<List<SupplyRecord>>
    with SupplyRecordListRef {
  _SupplyRecordListProviderElement(super.provider);

  @override
  int get vehicleId => (origin as SupplyRecordListProvider).vehicleId;
}

String _$supplyRecordsNotifierHash() =>
    r'22d49da37031f53d871d8e5e2929923eb020efbe';

/// See also [SupplyRecordsNotifier].
@ProviderFor(SupplyRecordsNotifier)
final supplyRecordsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<SupplyRecordsNotifier, void>.internal(
      SupplyRecordsNotifier.new,
      name: r'supplyRecordsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$supplyRecordsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SupplyRecordsNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
