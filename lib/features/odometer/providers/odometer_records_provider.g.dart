// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odometer_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$odometerRecordListHash() =>
    r'f5be74e6f720a5eb40822c5962229ec6d851cd2b';

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

/// See also [odometerRecordList].
@ProviderFor(odometerRecordList)
const odometerRecordListProvider = OdometerRecordListFamily();

/// See also [odometerRecordList].
class OdometerRecordListFamily
    extends Family<AsyncValue<List<OdometerRecord>>> {
  /// See also [odometerRecordList].
  const OdometerRecordListFamily();

  /// See also [odometerRecordList].
  OdometerRecordListProvider call(int vehicleId) {
    return OdometerRecordListProvider(vehicleId);
  }

  @override
  OdometerRecordListProvider getProviderOverride(
    covariant OdometerRecordListProvider provider,
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
  String? get name => r'odometerRecordListProvider';
}

/// See also [odometerRecordList].
class OdometerRecordListProvider
    extends AutoDisposeStreamProvider<List<OdometerRecord>> {
  /// See also [odometerRecordList].
  OdometerRecordListProvider(int vehicleId)
    : this._internal(
        (ref) => odometerRecordList(ref as OdometerRecordListRef, vehicleId),
        from: odometerRecordListProvider,
        name: r'odometerRecordListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$odometerRecordListHash,
        dependencies: OdometerRecordListFamily._dependencies,
        allTransitiveDependencies:
            OdometerRecordListFamily._allTransitiveDependencies,
        vehicleId: vehicleId,
      );

  OdometerRecordListProvider._internal(
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
    Stream<List<OdometerRecord>> Function(OdometerRecordListRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OdometerRecordListProvider._internal(
        (ref) => create(ref as OdometerRecordListRef),
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
  AutoDisposeStreamProviderElement<List<OdometerRecord>> createElement() {
    return _OdometerRecordListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OdometerRecordListProvider && other.vehicleId == vehicleId;
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
mixin OdometerRecordListRef
    on AutoDisposeStreamProviderRef<List<OdometerRecord>> {
  /// The parameter `vehicleId` of this provider.
  int get vehicleId;
}

class _OdometerRecordListProviderElement
    extends AutoDisposeStreamProviderElement<List<OdometerRecord>>
    with OdometerRecordListRef {
  _OdometerRecordListProviderElement(super.provider);

  @override
  int get vehicleId => (origin as OdometerRecordListProvider).vehicleId;
}

String _$odometerRecordsNotifierHash() =>
    r'43c257832835d89082a55c82264cdfd926bbe569';

/// See also [OdometerRecordsNotifier].
@ProviderFor(OdometerRecordsNotifier)
final odometerRecordsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<OdometerRecordsNotifier, void>.internal(
      OdometerRecordsNotifier.new,
      name: r'odometerRecordsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$odometerRecordsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$OdometerRecordsNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
