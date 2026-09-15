// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_note_record_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localNoteRecordRepository)
final localNoteRecordRepositoryProvider = LocalNoteRecordRepositoryProvider._();

final class LocalNoteRecordRepositoryProvider
    extends
        $FunctionalProvider<
          LocalNoteRecordRepository,
          LocalNoteRecordRepository,
          LocalNoteRecordRepository
        >
    with $Provider<LocalNoteRecordRepository> {
  LocalNoteRecordRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localNoteRecordRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localNoteRecordRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocalNoteRecordRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalNoteRecordRepository create(Ref ref) {
    return localNoteRecordRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalNoteRecordRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalNoteRecordRepository>(value),
    );
  }
}

String _$localNoteRecordRepositoryHash() =>
    r'1c631089dc91942928baa87bac336a58018295e5';
