// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_upgrade_record_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localUpgradeRecordRepository)
final localUpgradeRecordRepositoryProvider =
    LocalUpgradeRecordRepositoryProvider._();

final class LocalUpgradeRecordRepositoryProvider
    extends
        $FunctionalProvider<
          LocalUpgradeRecordRepository,
          LocalUpgradeRecordRepository,
          LocalUpgradeRecordRepository
        >
    with $Provider<LocalUpgradeRecordRepository> {
  LocalUpgradeRecordRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localUpgradeRecordRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localUpgradeRecordRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocalUpgradeRecordRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalUpgradeRecordRepository create(Ref ref) {
    return localUpgradeRecordRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalUpgradeRecordRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalUpgradeRecordRepository>(value),
    );
  }
}

String _$localUpgradeRecordRepositoryHash() =>
    r'67131238c11e84089dad9f8ce6a967b909003db0';
