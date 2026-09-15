// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(noteList)
final noteListProvider = NoteListFamily._();

final class NoteListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<NoteRecord>>,
          List<NoteRecord>,
          Stream<List<NoteRecord>>
        >
    with $FutureModifier<List<NoteRecord>>, $StreamProvider<List<NoteRecord>> {
  NoteListProvider._({
    required NoteListFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'noteListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$noteListHash();

  @override
  String toString() {
    return r'noteListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<NoteRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<NoteRecord>> create(Ref ref) {
    final argument = this.argument as int;
    return noteList(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is NoteListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$noteListHash() => r'b8217e35b746cd9ec238d55ef8466a656060936e';

final class NoteListFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<NoteRecord>>, int> {
  NoteListFamily._()
    : super(
        retry: null,
        name: r'noteListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NoteListProvider call(int vehicleId) =>
      NoteListProvider._(argument: vehicleId, from: this);

  @override
  String toString() => r'noteListProvider';
}

@ProviderFor(NotesNotifier)
final notesProvider = NotesNotifierProvider._();

final class NotesNotifierProvider
    extends $AsyncNotifierProvider<NotesNotifier, void> {
  NotesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notesNotifierHash();

  @$internal
  @override
  NotesNotifier create() => NotesNotifier();
}

String _$notesNotifierHash() => r'3f445b9171cde98ec5e23e0234afbce7080a5e7a';

abstract class _$NotesNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
