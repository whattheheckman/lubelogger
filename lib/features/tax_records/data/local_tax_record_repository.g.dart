// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_tax_record_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localTaxRecordRepository)
final localTaxRecordRepositoryProvider = LocalTaxRecordRepositoryProvider._();

final class LocalTaxRecordRepositoryProvider
    extends
        $FunctionalProvider<
          LocalTaxRecordRepository,
          LocalTaxRecordRepository,
          LocalTaxRecordRepository
        >
    with $Provider<LocalTaxRecordRepository> {
  LocalTaxRecordRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localTaxRecordRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localTaxRecordRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocalTaxRecordRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalTaxRecordRepository create(Ref ref) {
    return localTaxRecordRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalTaxRecordRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalTaxRecordRepository>(value),
    );
  }
}

String _$localTaxRecordRepositoryHash() =>
    r'7202e395f772920cc90f922bc1bc414fcb300e50';
