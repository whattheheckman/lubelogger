// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(planRecordList)
final planRecordListProvider = PlanRecordListFamily._();

final class PlanRecordListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PlanRecord>>,
          List<PlanRecord>,
          Stream<List<PlanRecord>>
        >
    with $FutureModifier<List<PlanRecord>>, $StreamProvider<List<PlanRecord>> {
  PlanRecordListProvider._({
    required PlanRecordListFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'planRecordListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$planRecordListHash();

  @override
  String toString() {
    return r'planRecordListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<PlanRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<PlanRecord>> create(Ref ref) {
    final argument = this.argument as int;
    return planRecordList(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PlanRecordListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$planRecordListHash() => r'43f1ffdf08604097324496bad89737f09c20d435';

final class PlanRecordListFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<PlanRecord>>, int> {
  PlanRecordListFamily._()
    : super(
        retry: null,
        name: r'planRecordListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlanRecordListProvider call(int vehicleId) =>
      PlanRecordListProvider._(argument: vehicleId, from: this);

  @override
  String toString() => r'planRecordListProvider';
}

@ProviderFor(PlanRecordsNotifier)
final planRecordsProvider = PlanRecordsNotifierProvider._();

final class PlanRecordsNotifierProvider
    extends $AsyncNotifierProvider<PlanRecordsNotifier, void> {
  PlanRecordsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'planRecordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$planRecordsNotifierHash();

  @$internal
  @override
  PlanRecordsNotifier create() => PlanRecordsNotifier();
}

String _$planRecordsNotifierHash() =>
    r'2d6ebf5a92fa725c0943f7e0401825831e9c9aaf';

abstract class _$PlanRecordsNotifier extends $AsyncNotifier<void> {
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
