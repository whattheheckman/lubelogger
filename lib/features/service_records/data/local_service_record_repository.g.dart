// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_service_record_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localServiceRecordRepository)
final localServiceRecordRepositoryProvider =
    LocalServiceRecordRepositoryProvider._();

final class LocalServiceRecordRepositoryProvider
    extends
        $FunctionalProvider<
          LocalServiceRecordRepository,
          LocalServiceRecordRepository,
          LocalServiceRecordRepository
        >
    with $Provider<LocalServiceRecordRepository> {
  LocalServiceRecordRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localServiceRecordRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localServiceRecordRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocalServiceRecordRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalServiceRecordRepository create(Ref ref) {
    return localServiceRecordRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalServiceRecordRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalServiceRecordRepository>(value),
    );
  }
}

String _$localServiceRecordRepositoryHash() =>
    r'b7c191f86265927134a68165b35611cf12ded98e';
