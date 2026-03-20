// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reminderListHash() => r'684cad56b3c368156d1ab14eb99abec1a2807a3d';

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

/// See also [reminderList].
@ProviderFor(reminderList)
const reminderListProvider = ReminderListFamily();

/// See also [reminderList].
class ReminderListFamily extends Family<AsyncValue<List<ReminderRecord>>> {
  /// See also [reminderList].
  const ReminderListFamily();

  /// See also [reminderList].
  ReminderListProvider call(int vehicleId) {
    return ReminderListProvider(vehicleId);
  }

  @override
  ReminderListProvider getProviderOverride(
    covariant ReminderListProvider provider,
  ) {
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
  String? get name => r'reminderListProvider';
}

/// See also [reminderList].
class ReminderListProvider
    extends AutoDisposeStreamProvider<List<ReminderRecord>> {
  /// See also [reminderList].
  ReminderListProvider(int vehicleId)
    : this._internal(
        (ref) => reminderList(ref as ReminderListRef, vehicleId),
        from: reminderListProvider,
        name: r'reminderListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$reminderListHash,
        dependencies: ReminderListFamily._dependencies,
        allTransitiveDependencies:
            ReminderListFamily._allTransitiveDependencies,
        vehicleId: vehicleId,
      );

  ReminderListProvider._internal(
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
    Stream<List<ReminderRecord>> Function(ReminderListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReminderListProvider._internal(
        (ref) => create(ref as ReminderListRef),
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
  AutoDisposeStreamProviderElement<List<ReminderRecord>> createElement() {
    return _ReminderListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReminderListProvider && other.vehicleId == vehicleId;
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
mixin ReminderListRef on AutoDisposeStreamProviderRef<List<ReminderRecord>> {
  /// The parameter `vehicleId` of this provider.
  int get vehicleId;
}

class _ReminderListProviderElement
    extends AutoDisposeStreamProviderElement<List<ReminderRecord>>
    with ReminderListRef {
  _ReminderListProviderElement(super.provider);

  @override
  int get vehicleId => (origin as ReminderListProvider).vehicleId;
}

String _$allRemindersHash() => r'84ff13273258f8c1d4e81367ec8395f238c8453d';

/// See also [allReminders].
@ProviderFor(allReminders)
final allRemindersProvider =
    AutoDisposeFutureProvider<List<ReminderRecord>>.internal(
      allReminders,
      name: r'allRemindersProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$allRemindersHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AllRemindersRef = AutoDisposeFutureProviderRef<List<ReminderRecord>>;
String _$remindersNotifierHash() => r'79d8ee6777c2d1cc6722071a1a109c187b8541dd';

/// See also [RemindersNotifier].
@ProviderFor(RemindersNotifier)
final remindersNotifierProvider =
    AutoDisposeAsyncNotifierProvider<RemindersNotifier, void>.internal(
      RemindersNotifier.new,
      name: r'remindersNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$remindersNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RemindersNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
