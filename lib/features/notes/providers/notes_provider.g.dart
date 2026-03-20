// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noteListHash() => r'c9bd7725a1b8492a09ee77918166873dbcd41db9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [noteList].
@ProviderFor(noteList)
const noteListProvider = NoteListFamily();

/// See also [noteList].
class NoteListFamily extends Family<AsyncValue<List<NoteRecord>>> {
  /// See also [noteList].
  const NoteListFamily();

  /// See also [noteList].
  NoteListProvider call(int vehicleId) {
    return NoteListProvider(vehicleId);
  }

  @override
  NoteListProvider getProviderOverride(covariant NoteListProvider provider) {
    return call(provider.vehicleId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'noteListProvider';
}

/// See also [noteList].
class NoteListProvider extends AutoDisposeStreamProvider<List<NoteRecord>> {
  /// See also [noteList].
  NoteListProvider(int vehicleId)
    : this._internal(
        (ref) => noteList(ref as NoteListRef, vehicleId),
        from: noteListProvider,
        name: r'noteListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$noteListHash,
        dependencies: NoteListFamily._dependencies,
        allTransitiveDependencies: NoteListFamily._allTransitiveDependencies,
        vehicleId: vehicleId,
      );

  NoteListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.vehicleId,
  }) : super.internal();

  final int vehicleId;

  @override
  Override overrideWith(
    Stream<List<NoteRecord>> Function(NoteListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NoteListProvider._internal(
        (ref) => create(ref as NoteListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        vehicleId: vehicleId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<NoteRecord>> createElement() {
    return _NoteListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NoteListProvider && other.vehicleId == vehicleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, vehicleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NoteListRef on AutoDisposeStreamProviderRef<List<NoteRecord>> {
  /// The parameter `vehicleId` of this provider.
  int get vehicleId;
}

class _NoteListProviderElement
    extends AutoDisposeStreamProviderElement<List<NoteRecord>>
    with NoteListRef {
  _NoteListProviderElement(super.provider);

  @override
  int get vehicleId => (origin as NoteListProvider).vehicleId;
}

String _$notesNotifierHash() => r'3f445b9171cde98ec5e23e0234afbce7080a5e7a';

/// See also [NotesNotifier].
@ProviderFor(NotesNotifier)
final notesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<NotesNotifier, void>.internal(
      NotesNotifier.new,
      name: r'notesNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$notesNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$NotesNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
