// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_reminder_record_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localReminderRecordRepository)
final localReminderRecordRepositoryProvider =
    LocalReminderRecordRepositoryProvider._();

final class LocalReminderRecordRepositoryProvider
    extends
        $FunctionalProvider<
          LocalReminderRecordRepository,
          LocalReminderRecordRepository,
          LocalReminderRecordRepository
        >
    with $Provider<LocalReminderRecordRepository> {
  LocalReminderRecordRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localReminderRecordRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localReminderRecordRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocalReminderRecordRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalReminderRecordRepository create(Ref ref) {
    return localReminderRecordRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalReminderRecordRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalReminderRecordRepository>(
        value,
      ),
    );
  }
}

String _$localReminderRecordRepositoryHash() =>
    r'e8f7e03cba164c54248a72f40961efbd2c097e22';
