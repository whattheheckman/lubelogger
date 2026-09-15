// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_supply_record_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localSupplyRecordRepository)
final localSupplyRecordRepositoryProvider =
    LocalSupplyRecordRepositoryProvider._();

final class LocalSupplyRecordRepositoryProvider
    extends
        $FunctionalProvider<
          LocalSupplyRecordRepository,
          LocalSupplyRecordRepository,
          LocalSupplyRecordRepository
        >
    with $Provider<LocalSupplyRecordRepository> {
  LocalSupplyRecordRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localSupplyRecordRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localSupplyRecordRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocalSupplyRecordRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalSupplyRecordRepository create(Ref ref) {
    return localSupplyRecordRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalSupplyRecordRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalSupplyRecordRepository>(value),
    );
  }
}

String _$localSupplyRecordRepositoryHash() =>
    r'65436a6812971fceb8c12f17d335476e8bd6f26c';
