// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_odometer_record_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localOdometerRecordRepository)
final localOdometerRecordRepositoryProvider =
    LocalOdometerRecordRepositoryProvider._();

final class LocalOdometerRecordRepositoryProvider
    extends
        $FunctionalProvider<
          LocalOdometerRecordRepository,
          LocalOdometerRecordRepository,
          LocalOdometerRecordRepository
        >
    with $Provider<LocalOdometerRecordRepository> {
  LocalOdometerRecordRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localOdometerRecordRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localOdometerRecordRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocalOdometerRecordRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalOdometerRecordRepository create(Ref ref) {
    return localOdometerRecordRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalOdometerRecordRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalOdometerRecordRepository>(
        value,
      ),
    );
  }
}

String _$localOdometerRecordRepositoryHash() =>
    r'dc8d236ec83c00d60e0c8d4a44d2618a35f1be34';
