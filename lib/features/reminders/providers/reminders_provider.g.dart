// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reminderList)
final reminderListProvider = ReminderListFamily._();

final class ReminderListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ReminderRecord>>,
          List<ReminderRecord>,
          Stream<List<ReminderRecord>>
        >
    with
        $FutureModifier<List<ReminderRecord>>,
        $StreamProvider<List<ReminderRecord>> {
  ReminderListProvider._({
    required ReminderListFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'reminderListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reminderListHash();

  @override
  String toString() {
    return r'reminderListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<ReminderRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ReminderRecord>> create(Ref ref) {
    final argument = this.argument as int;
    return reminderList(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ReminderListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reminderListHash() => r'3da0ad45037199e97cfc99543d59cf9aeaa47ca7';

final class ReminderListFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<ReminderRecord>>, int> {
  ReminderListFamily._()
    : super(
        retry: null,
        name: r'reminderListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReminderListProvider call(int vehicleId) =>
      ReminderListProvider._(argument: vehicleId, from: this);

  @override
  String toString() => r'reminderListProvider';
}

@ProviderFor(allReminders)
final allRemindersProvider = AllRemindersProvider._();

final class AllRemindersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ReminderRecord>>,
          List<ReminderRecord>,
          FutureOr<List<ReminderRecord>>
        >
    with
        $FutureModifier<List<ReminderRecord>>,
        $FutureProvider<List<ReminderRecord>> {
  AllRemindersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allRemindersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allRemindersHash();

  @$internal
  @override
  $FutureProviderElement<List<ReminderRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ReminderRecord>> create(Ref ref) {
    return allReminders(ref);
  }
}

String _$allRemindersHash() => r'9846ebfb4921a27656f6640920671f643cc341fc';

@ProviderFor(RemindersNotifier)
final remindersProvider = RemindersNotifierProvider._();

final class RemindersNotifierProvider
    extends $AsyncNotifierProvider<RemindersNotifier, void> {
  RemindersNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remindersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remindersNotifierHash();

  @$internal
  @override
  RemindersNotifier create() => RemindersNotifier();
}

String _$remindersNotifierHash() => r'79d8ee6777c2d1cc6722071a1a109c187b8541dd';

abstract class _$RemindersNotifier extends $AsyncNotifier<void> {
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
