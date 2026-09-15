// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_vehicle_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appDatabase)
final appDatabaseProvider = AppDatabaseProvider._();

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'4db1c5efe1a73afafa926c6e91d12e49a68b1abc';

@ProviderFor(localVehicleRepository)
final localVehicleRepositoryProvider = LocalVehicleRepositoryProvider._();

final class LocalVehicleRepositoryProvider
    extends
        $FunctionalProvider<
          LocalVehicleRepository,
          LocalVehicleRepository,
          LocalVehicleRepository
        >
    with $Provider<LocalVehicleRepository> {
  LocalVehicleRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localVehicleRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localVehicleRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocalVehicleRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalVehicleRepository create(Ref ref) {
    return localVehicleRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalVehicleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalVehicleRepository>(value),
    );
  }
}

String _$localVehicleRepositoryHash() =>
    r'866f93e5e585f907cceb1e2a2783bc6f1231699e';
