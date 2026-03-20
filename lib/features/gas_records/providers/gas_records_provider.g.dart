// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gas_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gasRecordListHash() => r'32b8bb389c390c2c62b4951aa771a6e2f060ae77';

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

/// See also [gasRecordList].
@ProviderFor(gasRecordList)
const gasRecordListProvider = GasRecordListFamily();

/// See also [gasRecordList].
class GasRecordListFamily extends Family<AsyncValue<List<GasRecord>>> {
  /// See also [gasRecordList].
  const GasRecordListFamily();

  /// See also [gasRecordList].
  GasRecordListProvider call(int vehicleId) {
    return GasRecordListProvider(vehicleId);
  }

  @override
  GasRecordListProvider getProviderOverride(
    covariant GasRecordListProvider provider,
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
  String? get name => r'gasRecordListProvider';
}

/// See also [gasRecordList].
class GasRecordListProvider extends AutoDisposeStreamProvider<List<GasRecord>> {
  /// See also [gasRecordList].
  GasRecordListProvider(int vehicleId)
    : this._internal(
        (ref) => gasRecordList(ref as GasRecordListRef, vehicleId),
        from: gasRecordListProvider,
        name: r'gasRecordListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$gasRecordListHash,
        dependencies: GasRecordListFamily._dependencies,
        allTransitiveDependencies:
            GasRecordListFamily._allTransitiveDependencies,
        vehicleId: vehicleId,
      );

  GasRecordListProvider._internal(
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
    Stream<List<GasRecord>> Function(GasRecordListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GasRecordListProvider._internal(
        (ref) => create(ref as GasRecordListRef),
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
  AutoDisposeStreamProviderElement<List<GasRecord>> createElement() {
    return _GasRecordListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GasRecordListProvider && other.vehicleId == vehicleId;
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
mixin GasRecordListRef on AutoDisposeStreamProviderRef<List<GasRecord>> {
  /// The parameter `vehicleId` of this provider.
  int get vehicleId;
}

class _GasRecordListProviderElement
    extends AutoDisposeStreamProviderElement<List<GasRecord>>
    with GasRecordListRef {
  _GasRecordListProviderElement(super.provider);

  @override
  int get vehicleId => (origin as GasRecordListProvider).vehicleId;
}

String _$gasRecordsNotifierHash() =>
    r'979ba60d7a4126b4a06a1bd461d534f68f76332b';

/// See also [GasRecordsNotifier].
@ProviderFor(GasRecordsNotifier)
final gasRecordsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<GasRecordsNotifier, void>.internal(
      GasRecordsNotifier.new,
      name: r'gasRecordsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$gasRecordsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$GasRecordsNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
