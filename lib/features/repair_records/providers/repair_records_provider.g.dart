// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(repairRecordList)
final repairRecordListProvider = RepairRecordListFamily._();

final class RepairRecordListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RepairRecord>>,
          List<RepairRecord>,
          Stream<List<RepairRecord>>
        >
    with
        $FutureModifier<List<RepairRecord>>,
        $StreamProvider<List<RepairRecord>> {
  RepairRecordListProvider._({
    required RepairRecordListFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'repairRecordListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$repairRecordListHash();

  @override
  String toString() {
    return r'repairRecordListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<RepairRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<RepairRecord>> create(Ref ref) {
    final argument = this.argument as int;
    return repairRecordList(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RepairRecordListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$repairRecordListHash() => r'dfdf4f803b5b7f3a499b017aa4dd50ceb9ec8547';

final class RepairRecordListFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<RepairRecord>>, int> {
  RepairRecordListFamily._()
    : super(
        retry: null,
        name: r'repairRecordListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RepairRecordListProvider call(int vehicleId) =>
      RepairRecordListProvider._(argument: vehicleId, from: this);

  @override
  String toString() => r'repairRecordListProvider';
}

@ProviderFor(RepairRecordsNotifier)
final repairRecordsProvider = RepairRecordsNotifierProvider._();

final class RepairRecordsNotifierProvider
    extends $AsyncNotifierProvider<RepairRecordsNotifier, void> {
  RepairRecordsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'repairRecordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$repairRecordsNotifierHash();

  @$internal
  @override
  RepairRecordsNotifier create() => RepairRecordsNotifier();
}

String _$repairRecordsNotifierHash() =>
    r'd07444187656ef0c0850380255c0c8eaff78909f';

abstract class _$RepairRecordsNotifier extends $AsyncNotifier<void> {
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
