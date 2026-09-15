// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odometer_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(odometerRecordList)
final odometerRecordListProvider = OdometerRecordListFamily._();

final class OdometerRecordListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<OdometerRecord>>,
          List<OdometerRecord>,
          Stream<List<OdometerRecord>>
        >
    with
        $FutureModifier<List<OdometerRecord>>,
        $StreamProvider<List<OdometerRecord>> {
  OdometerRecordListProvider._({
    required OdometerRecordListFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'odometerRecordListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$odometerRecordListHash();

  @override
  String toString() {
    return r'odometerRecordListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<OdometerRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<OdometerRecord>> create(Ref ref) {
    final argument = this.argument as int;
    return odometerRecordList(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is OdometerRecordListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$odometerRecordListHash() =>
    r'5bf5414eb1970b60950ad5cac0d27814708d9d91';

final class OdometerRecordListFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<OdometerRecord>>, int> {
  OdometerRecordListFamily._()
    : super(
        retry: null,
        name: r'odometerRecordListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OdometerRecordListProvider call(int vehicleId) =>
      OdometerRecordListProvider._(argument: vehicleId, from: this);

  @override
  String toString() => r'odometerRecordListProvider';
}

@ProviderFor(OdometerRecordsNotifier)
final odometerRecordsProvider = OdometerRecordsNotifierProvider._();

final class OdometerRecordsNotifierProvider
    extends $AsyncNotifierProvider<OdometerRecordsNotifier, void> {
  OdometerRecordsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'odometerRecordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$odometerRecordsNotifierHash();

  @$internal
  @override
  OdometerRecordsNotifier create() => OdometerRecordsNotifier();
}

String _$odometerRecordsNotifierHash() =>
    r'43c257832835d89082a55c82264cdfd926bbe569';

abstract class _$OdometerRecordsNotifier extends $AsyncNotifier<void> {
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
