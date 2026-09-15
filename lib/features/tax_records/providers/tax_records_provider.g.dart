// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(taxRecordList)
final taxRecordListProvider = TaxRecordListFamily._();

final class TaxRecordListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TaxRecord>>,
          List<TaxRecord>,
          Stream<List<TaxRecord>>
        >
    with $FutureModifier<List<TaxRecord>>, $StreamProvider<List<TaxRecord>> {
  TaxRecordListProvider._({
    required TaxRecordListFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'taxRecordListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$taxRecordListHash();

  @override
  String toString() {
    return r'taxRecordListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<TaxRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<TaxRecord>> create(Ref ref) {
    final argument = this.argument as int;
    return taxRecordList(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TaxRecordListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$taxRecordListHash() => r'4f2b8f17279d305dd81ebc09f1cbf1d5eea9e849';

final class TaxRecordListFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<TaxRecord>>, int> {
  TaxRecordListFamily._()
    : super(
        retry: null,
        name: r'taxRecordListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TaxRecordListProvider call(int vehicleId) =>
      TaxRecordListProvider._(argument: vehicleId, from: this);

  @override
  String toString() => r'taxRecordListProvider';
}

@ProviderFor(TaxRecordsNotifier)
final taxRecordsProvider = TaxRecordsNotifierProvider._();

final class TaxRecordsNotifierProvider
    extends $AsyncNotifierProvider<TaxRecordsNotifier, void> {
  TaxRecordsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taxRecordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taxRecordsNotifierHash();

  @$internal
  @override
  TaxRecordsNotifier create() => TaxRecordsNotifier();
}

String _$taxRecordsNotifierHash() =>
    r'd6796ec87a5f41bec70cf3f64b0cf636dd7825cd';

abstract class _$TaxRecordsNotifier extends $AsyncNotifier<void> {
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
