// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RelationController)
const relationControllerProvider = RelationControllerProvider._();

final class RelationControllerProvider
    extends $NotifierProvider<RelationController, String?> {
  const RelationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'relationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$relationControllerHash();

  @$internal
  @override
  RelationController create() => RelationController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$relationControllerHash() =>
    r'934a9b4cb774e9936b3b1df7f7ae333e1720280e';

abstract class _$RelationController extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
