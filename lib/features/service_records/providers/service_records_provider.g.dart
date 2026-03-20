// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serviceRecordListHash() => r'cc6533f0e9260207c8b9e594c501a678b36651f2';

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

/// See also [serviceRecordList].
@ProviderFor(serviceRecordList)
const serviceRecordListProvider = ServiceRecordListFamily();

/// See also [serviceRecordList].
class ServiceRecordListFamily extends Family<AsyncValue<List<ServiceRecord>>> {
  /// See also [serviceRecordList].
  const ServiceRecordListFamily();

  /// See also [serviceRecordList].
  ServiceRecordListProvider call(int vehicleId) {
    return ServiceRecordListProvider(vehicleId);
  }

  @override
  ServiceRecordListProvider getProviderOverride(
    covariant ServiceRecordListProvider provider,
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
  String? get name => r'serviceRecordListProvider';
}

/// See also [serviceRecordList].
class ServiceRecordListProvider
    extends AutoDisposeStreamProvider<List<ServiceRecord>> {
  /// See also [serviceRecordList].
  ServiceRecordListProvider(int vehicleId)
    : this._internal(
        (ref) => serviceRecordList(ref as ServiceRecordListRef, vehicleId),
        from: serviceRecordListProvider,
        name: r'serviceRecordListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$serviceRecordListHash,
        dependencies: ServiceRecordListFamily._dependencies,
        allTransitiveDependencies:
            ServiceRecordListFamily._allTransitiveDependencies,
        vehicleId: vehicleId,
      );

  ServiceRecordListProvider._internal(
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
    Stream<List<ServiceRecord>> Function(ServiceRecordListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ServiceRecordListProvider._internal(
        (ref) => create(ref as ServiceRecordListRef),
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
  AutoDisposeStreamProviderElement<List<ServiceRecord>> createElement() {
    return _ServiceRecordListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ServiceRecordListProvider && other.vehicleId == vehicleId;
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
mixin ServiceRecordListRef
    on AutoDisposeStreamProviderRef<List<ServiceRecord>> {
  /// The parameter `vehicleId` of this provider.
  int get vehicleId;
}

class _ServiceRecordListProviderElement
    extends AutoDisposeStreamProviderElement<List<ServiceRecord>>
    with ServiceRecordListRef {
  _ServiceRecordListProviderElement(super.provider);

  @override
  int get vehicleId => (origin as ServiceRecordListProvider).vehicleId;
}

String _$serviceRecordsNotifierHash() =>
    r'd55d0ed711f4135622318e35be180f36a921ad12';

/// See also [ServiceRecordsNotifier].
@ProviderFor(ServiceRecordsNotifier)
final serviceRecordsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ServiceRecordsNotifier, void>.internal(
      ServiceRecordsNotifier.new,
      name: r'serviceRecordsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$serviceRecordsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ServiceRecordsNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
