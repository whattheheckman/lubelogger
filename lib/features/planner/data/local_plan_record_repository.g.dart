// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_plan_record_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localPlanRecordRepository)
final localPlanRecordRepositoryProvider = LocalPlanRecordRepositoryProvider._();

final class LocalPlanRecordRepositoryProvider
    extends
        $FunctionalProvider<
          LocalPlanRecordRepository,
          LocalPlanRecordRepository,
          LocalPlanRecordRepository
        >
    with $Provider<LocalPlanRecordRepository> {
  LocalPlanRecordRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localPlanRecordRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localPlanRecordRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocalPlanRecordRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalPlanRecordRepository create(Ref ref) {
    return localPlanRecordRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalPlanRecordRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalPlanRecordRepository>(value),
    );
  }
}

String _$localPlanRecordRepositoryHash() =>
    r'8c855bf7ef3bf251640dde6a3f2f99f35b3ef360';
