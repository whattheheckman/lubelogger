// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gas_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gasRecordList)
final gasRecordListProvider = GasRecordListFamily._();

final class GasRecordListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<GasRecord>>,
          List<GasRecord>,
          Stream<List<GasRecord>>
        >
    with $FutureModifier<List<GasRecord>>, $StreamProvider<List<GasRecord>> {
  GasRecordListProvider._({
    required GasRecordListFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'gasRecordListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gasRecordListHash();

  @override
  String toString() {
    return r'gasRecordListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<GasRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<GasRecord>> create(Ref ref) {
    final argument = this.argument as int;
    return gasRecordList(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GasRecordListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gasRecordListHash() => r'ccfe12e780fe726450d54e67a1c5f762af074868';

final class GasRecordListFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<GasRecord>>, int> {
  GasRecordListFamily._()
    : super(
        retry: null,
        name: r'gasRecordListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GasRecordListProvider call(int vehicleId) =>
      GasRecordListProvider._(argument: vehicleId, from: this);

  @override
  String toString() => r'gasRecordListProvider';
}

@ProviderFor(GasRecordsNotifier)
final gasRecordsProvider = GasRecordsNotifierProvider._();

final class GasRecordsNotifierProvider
    extends $AsyncNotifierProvider<GasRecordsNotifier, void> {
  GasRecordsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gasRecordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gasRecordsNotifierHash();

  @$internal
  @override
  GasRecordsNotifier create() => GasRecordsNotifier();
}

String _$gasRecordsNotifierHash() =>
    r'979ba60d7a4126b4a06a1bd461d534f68f76332b';

abstract class _$GasRecordsNotifier extends $AsyncNotifier<void> {
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
