// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(supplyRecordList)
final supplyRecordListProvider = SupplyRecordListFamily._();

final class SupplyRecordListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SupplyRecord>>,
          List<SupplyRecord>,
          Stream<List<SupplyRecord>>
        >
    with
        $FutureModifier<List<SupplyRecord>>,
        $StreamProvider<List<SupplyRecord>> {
  SupplyRecordListProvider._({
    required SupplyRecordListFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'supplyRecordListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$supplyRecordListHash();

  @override
  String toString() {
    return r'supplyRecordListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<SupplyRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<SupplyRecord>> create(Ref ref) {
    final argument = this.argument as int;
    return supplyRecordList(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SupplyRecordListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$supplyRecordListHash() => r'246e6f28ff3f37bc8508004a6343fb8fe769b703';

final class SupplyRecordListFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<SupplyRecord>>, int> {
  SupplyRecordListFamily._()
    : super(
        retry: null,
        name: r'supplyRecordListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SupplyRecordListProvider call(int vehicleId) =>
      SupplyRecordListProvider._(argument: vehicleId, from: this);

  @override
  String toString() => r'supplyRecordListProvider';
}

@ProviderFor(SupplyRecordsNotifier)
final supplyRecordsProvider = SupplyRecordsNotifierProvider._();

final class SupplyRecordsNotifierProvider
    extends $AsyncNotifierProvider<SupplyRecordsNotifier, void> {
  SupplyRecordsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supplyRecordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supplyRecordsNotifierHash();

  @$internal
  @override
  SupplyRecordsNotifier create() => SupplyRecordsNotifier();
}

String _$supplyRecordsNotifierHash() =>
    r'22d49da37031f53d871d8e5e2929923eb020efbe';

abstract class _$SupplyRecordsNotifier extends $AsyncNotifier<void> {
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
