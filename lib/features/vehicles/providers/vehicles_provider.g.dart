// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vehicleListHash() => r'0160c06e7f67616ab94ac27fdfa011de76e3c13f';

/// See also [vehicleList].
@ProviderFor(vehicleList)
final vehicleListProvider = AutoDisposeStreamProvider<List<Vehicle>>.internal(
  vehicleList,
  name: r'vehicleListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehicleListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VehicleListRef = AutoDisposeStreamProviderRef<List<Vehicle>>;
String _$vehiclesNotifierHash() => r'd18af589ec59711bc95f0f4308264228c5502d71';

/// See also [VehiclesNotifier].
@ProviderFor(VehiclesNotifier)
final vehiclesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<VehiclesNotifier, void>.internal(
      VehiclesNotifier.new,
      name: r'vehiclesNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$vehiclesNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$VehiclesNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
