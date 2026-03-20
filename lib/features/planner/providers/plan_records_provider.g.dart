// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$planRecordListHash() => r'2fee5ef6c6ecc271e0c2d05fbca822d08861b7ab';

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

/// See also [planRecordList].
@ProviderFor(planRecordList)
const planRecordListProvider = PlanRecordListFamily();

/// See also [planRecordList].
class PlanRecordListFamily extends Family<AsyncValue<List<PlanRecord>>> {
  /// See also [planRecordList].
  const PlanRecordListFamily();

  /// See also [planRecordList].
  PlanRecordListProvider call(int vehicleId) {
    return PlanRecordListProvider(vehicleId);
  }

  @override
  PlanRecordListProvider getProviderOverride(
    covariant PlanRecordListProvider provider,
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
  String? get name => r'planRecordListProvider';
}

/// See also [planRecordList].
class PlanRecordListProvider
    extends AutoDisposeStreamProvider<List<PlanRecord>> {
  /// See also [planRecordList].
  PlanRecordListProvider(int vehicleId)
    : this._internal(
        (ref) => planRecordList(ref as PlanRecordListRef, vehicleId),
        from: planRecordListProvider,
        name: r'planRecordListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$planRecordListHash,
        dependencies: PlanRecordListFamily._dependencies,
        allTransitiveDependencies:
            PlanRecordListFamily._allTransitiveDependencies,
        vehicleId: vehicleId,
      );

  PlanRecordListProvider._internal(
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
    Stream<List<PlanRecord>> Function(PlanRecordListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlanRecordListProvider._internal(
        (ref) => create(ref as PlanRecordListRef),
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
  AutoDisposeStreamProviderElement<List<PlanRecord>> createElement() {
    return _PlanRecordListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlanRecordListProvider && other.vehicleId == vehicleId;
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
mixin PlanRecordListRef on AutoDisposeStreamProviderRef<List<PlanRecord>> {
  /// The parameter `vehicleId` of this provider.
  int get vehicleId;
}

class _PlanRecordListProviderElement
    extends AutoDisposeStreamProviderElement<List<PlanRecord>>
    with PlanRecordListRef {
  _PlanRecordListProviderElement(super.provider);

  @override
  int get vehicleId => (origin as PlanRecordListProvider).vehicleId;
}

String _$planRecordsNotifierHash() =>
    r'2d6ebf5a92fa725c0943f7e0401825831e9c9aaf';

/// See also [PlanRecordsNotifier].
@ProviderFor(PlanRecordsNotifier)
final planRecordsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<PlanRecordsNotifier, void>.internal(
      PlanRecordsNotifier.new,
      name: r'planRecordsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$planRecordsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PlanRecordsNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
