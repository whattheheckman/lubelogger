// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(vehicleList)
final vehicleListProvider = VehicleListProvider._();

final class VehicleListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Vehicle>>,
          List<Vehicle>,
          Stream<List<Vehicle>>
        >
    with $FutureModifier<List<Vehicle>>, $StreamProvider<List<Vehicle>> {
  VehicleListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vehicleListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vehicleListHash();

  @$internal
  @override
  $StreamProviderElement<List<Vehicle>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Vehicle>> create(Ref ref) {
    return vehicleList(ref);
  }
}

String _$vehicleListHash() => r'6269c80af4f79f3d1025092d6f6c43c8ca087b92';

@ProviderFor(VehiclesNotifier)
final vehiclesProvider = VehiclesNotifierProvider._();

final class VehiclesNotifierProvider
    extends $AsyncNotifierProvider<VehiclesNotifier, void> {
  VehiclesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vehiclesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vehiclesNotifierHash();

  @$internal
  @override
  VehiclesNotifier create() => VehiclesNotifier();
}

String _$vehiclesNotifierHash() => r'd18af589ec59711bc95f0f4308264228c5502d71';

abstract class _$VehiclesNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
