// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_gas_record_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localGasRecordRepository)
final localGasRecordRepositoryProvider = LocalGasRecordRepositoryProvider._();

final class LocalGasRecordRepositoryProvider
    extends
        $FunctionalProvider<
          LocalGasRecordRepository,
          LocalGasRecordRepository,
          LocalGasRecordRepository
        >
    with $Provider<LocalGasRecordRepository> {
  LocalGasRecordRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localGasRecordRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localGasRecordRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocalGasRecordRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalGasRecordRepository create(Ref ref) {
    return localGasRecordRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalGasRecordRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalGasRecordRepository>(value),
    );
  }
}

String _$localGasRecordRepositoryHash() =>
    r'4010c7533b525892143190c437421e3a2d849d4f';
