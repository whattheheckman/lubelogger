// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taxRecordListHash() => r'6620a95d4294a9b7f2219b331522068761fec693';

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

/// See also [taxRecordList].
@ProviderFor(taxRecordList)
const taxRecordListProvider = TaxRecordListFamily();

/// See also [taxRecordList].
class TaxRecordListFamily extends Family<AsyncValue<List<TaxRecord>>> {
  /// See also [taxRecordList].
  const TaxRecordListFamily();

  /// See also [taxRecordList].
  TaxRecordListProvider call(int vehicleId) {
    return TaxRecordListProvider(vehicleId);
  }

  @override
  TaxRecordListProvider getProviderOverride(
    covariant TaxRecordListProvider provider,
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
  String? get name => r'taxRecordListProvider';
}

/// See also [taxRecordList].
class TaxRecordListProvider extends AutoDisposeStreamProvider<List<TaxRecord>> {
  /// See also [taxRecordList].
  TaxRecordListProvider(int vehicleId)
    : this._internal(
        (ref) => taxRecordList(ref as TaxRecordListRef, vehicleId),
        from: taxRecordListProvider,
        name: r'taxRecordListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$taxRecordListHash,
        dependencies: TaxRecordListFamily._dependencies,
        allTransitiveDependencies:
            TaxRecordListFamily._allTransitiveDependencies,
        vehicleId: vehicleId,
      );

  TaxRecordListProvider._internal(
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
    Stream<List<TaxRecord>> Function(TaxRecordListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TaxRecordListProvider._internal(
        (ref) => create(ref as TaxRecordListRef),
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
  AutoDisposeStreamProviderElement<List<TaxRecord>> createElement() {
    return _TaxRecordListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaxRecordListProvider && other.vehicleId == vehicleId;
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
mixin TaxRecordListRef on AutoDisposeStreamProviderRef<List<TaxRecord>> {
  /// The parameter `vehicleId` of this provider.
  int get vehicleId;
}

class _TaxRecordListProviderElement
    extends AutoDisposeStreamProviderElement<List<TaxRecord>>
    with TaxRecordListRef {
  _TaxRecordListProviderElement(super.provider);

  @override
  int get vehicleId => (origin as TaxRecordListProvider).vehicleId;
}

String _$taxRecordsNotifierHash() =>
    r'd6796ec87a5f41bec70cf3f64b0cf636dd7825cd';

/// See also [TaxRecordsNotifier].
@ProviderFor(TaxRecordsNotifier)
final taxRecordsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<TaxRecordsNotifier, void>.internal(
      TaxRecordsNotifier.new,
      name: r'taxRecordsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$taxRecordsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TaxRecordsNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
