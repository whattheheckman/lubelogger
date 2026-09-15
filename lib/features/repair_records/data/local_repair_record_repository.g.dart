// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_repair_record_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localRepairRecordRepository)
final localRepairRecordRepositoryProvider =
    LocalRepairRecordRepositoryProvider._();

final class LocalRepairRecordRepositoryProvider
    extends
        $FunctionalProvider<
          LocalRepairRecordRepository,
          LocalRepairRecordRepository,
          LocalRepairRecordRepository
        >
    with $Provider<LocalRepairRecordRepository> {
  LocalRepairRecordRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localRepairRecordRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localRepairRecordRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocalRepairRecordRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepairRecordRepository create(Ref ref) {
    return localRepairRecordRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepairRecordRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepairRecordRepository>(value),
    );
  }
}

String _$localRepairRecordRepositoryHash() =>
    r'e04539c06db1ed819dfbdd5eba06c943a307c7cc';
