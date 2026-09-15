// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(upgradeRecordList)
final upgradeRecordListProvider = UpgradeRecordListFamily._();

final class UpgradeRecordListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UpgradeRecord>>,
          List<UpgradeRecord>,
          Stream<List<UpgradeRecord>>
        >
    with
        $FutureModifier<List<UpgradeRecord>>,
        $StreamProvider<List<UpgradeRecord>> {
  UpgradeRecordListProvider._({
    required UpgradeRecordListFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'upgradeRecordListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$upgradeRecordListHash();

  @override
  String toString() {
    return r'upgradeRecordListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<UpgradeRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<UpgradeRecord>> create(Ref ref) {
    final argument = this.argument as int;
    return upgradeRecordList(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UpgradeRecordListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$upgradeRecordListHash() => r'7b6fd5bc136e6d82830d8ab90c14d6f3018a5224';

final class UpgradeRecordListFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<UpgradeRecord>>, int> {
  UpgradeRecordListFamily._()
    : super(
        retry: null,
        name: r'upgradeRecordListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UpgradeRecordListProvider call(int vehicleId) =>
      UpgradeRecordListProvider._(argument: vehicleId, from: this);

  @override
  String toString() => r'upgradeRecordListProvider';
}

@ProviderFor(UpgradeRecordsNotifier)
final upgradeRecordsProvider = UpgradeRecordsNotifierProvider._();

final class UpgradeRecordsNotifierProvider
    extends $AsyncNotifierProvider<UpgradeRecordsNotifier, void> {
  UpgradeRecordsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'upgradeRecordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$upgradeRecordsNotifierHash();

  @$internal
  @override
  UpgradeRecordsNotifier create() => UpgradeRecordsNotifier();
}

String _$upgradeRecordsNotifierHash() =>
    r'2b20898a980cb066c23c3091de06d5cd9b2bec89';

abstract class _$UpgradeRecordsNotifier extends $AsyncNotifier<void> {
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
