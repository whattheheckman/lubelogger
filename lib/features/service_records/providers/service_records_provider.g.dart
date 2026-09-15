// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_records_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(serviceRecordList)
final serviceRecordListProvider = ServiceRecordListFamily._();

final class ServiceRecordListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ServiceRecord>>,
          List<ServiceRecord>,
          Stream<List<ServiceRecord>>
        >
    with
        $FutureModifier<List<ServiceRecord>>,
        $StreamProvider<List<ServiceRecord>> {
  ServiceRecordListProvider._({
    required ServiceRecordListFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'serviceRecordListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$serviceRecordListHash();

  @override
  String toString() {
    return r'serviceRecordListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<ServiceRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ServiceRecord>> create(Ref ref) {
    final argument = this.argument as int;
    return serviceRecordList(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ServiceRecordListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$serviceRecordListHash() => r'503b4d2ee448226c76c79a598aab64d0772d9add';

final class ServiceRecordListFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<ServiceRecord>>, int> {
  ServiceRecordListFamily._()
    : super(
        retry: null,
        name: r'serviceRecordListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ServiceRecordListProvider call(int vehicleId) =>
      ServiceRecordListProvider._(argument: vehicleId, from: this);

  @override
  String toString() => r'serviceRecordListProvider';
}

@ProviderFor(ServiceRecordsNotifier)
final serviceRecordsProvider = ServiceRecordsNotifierProvider._();

final class ServiceRecordsNotifierProvider
    extends $AsyncNotifierProvider<ServiceRecordsNotifier, void> {
  ServiceRecordsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serviceRecordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serviceRecordsNotifierHash();

  @$internal
  @override
  ServiceRecordsNotifier create() => ServiceRecordsNotifier();
}

String _$serviceRecordsNotifierHash() =>
    r'd55d0ed711f4135622318e35be180f36a921ad12';

abstract class _$ServiceRecordsNotifier extends $AsyncNotifier<void> {
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
