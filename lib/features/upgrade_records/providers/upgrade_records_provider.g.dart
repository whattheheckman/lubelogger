// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$upgradeRecordListHash() => r'258517329a94821f872b1ad19a143081f7bb8abe';

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

/// See also [upgradeRecordList].
@ProviderFor(upgradeRecordList)
const upgradeRecordListProvider = UpgradeRecordListFamily();

/// See also [upgradeRecordList].
class UpgradeRecordListFamily extends Family<AsyncValue<List<UpgradeRecord>>> {
  /// See also [upgradeRecordList].
  const UpgradeRecordListFamily();

  /// See also [upgradeRecordList].
  UpgradeRecordListProvider call(int vehicleId) {
    return UpgradeRecordListProvider(vehicleId);
  }

  @override
  UpgradeRecordListProvider getProviderOverride(
    covariant UpgradeRecordListProvider provider,
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
  String? get name => r'upgradeRecordListProvider';
}

/// See also [upgradeRecordList].
class UpgradeRecordListProvider
    extends AutoDisposeStreamProvider<List<UpgradeRecord>> {
  /// See also [upgradeRecordList].
  UpgradeRecordListProvider(int vehicleId)
    : this._internal(
        (ref) => upgradeRecordList(ref as UpgradeRecordListRef, vehicleId),
        from: upgradeRecordListProvider,
        name: r'upgradeRecordListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$upgradeRecordListHash,
        dependencies: UpgradeRecordListFamily._dependencies,
        allTransitiveDependencies:
            UpgradeRecordListFamily._allTransitiveDependencies,
        vehicleId: vehicleId,
      );

  UpgradeRecordListProvider._internal(
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
    Stream<List<UpgradeRecord>> Function(UpgradeRecordListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpgradeRecordListProvider._internal(
        (ref) => create(ref as UpgradeRecordListRef),
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
  AutoDisposeStreamProviderElement<List<UpgradeRecord>> createElement() {
    return _UpgradeRecordListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpgradeRecordListProvider && other.vehicleId == vehicleId;
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
mixin UpgradeRecordListRef
    on AutoDisposeStreamProviderRef<List<UpgradeRecord>> {
  /// The parameter `vehicleId` of this provider.
  int get vehicleId;
}

class _UpgradeRecordListProviderElement
    extends AutoDisposeStreamProviderElement<List<UpgradeRecord>>
    with UpgradeRecordListRef {
  _UpgradeRecordListProviderElement(super.provider);

  @override
  int get vehicleId => (origin as UpgradeRecordListProvider).vehicleId;
}

String _$upgradeRecordsNotifierHash() =>
    r'2b20898a980cb066c23c3091de06d5cd9b2bec89';

/// See also [UpgradeRecordsNotifier].
@ProviderFor(UpgradeRecordsNotifier)
final upgradeRecordsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<UpgradeRecordsNotifier, void>.internal(
      UpgradeRecordsNotifier.new,
      name: r'upgradeRecordsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$upgradeRecordsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UpgradeRecordsNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
