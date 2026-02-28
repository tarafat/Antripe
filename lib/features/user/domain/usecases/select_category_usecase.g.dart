// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_category_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedCategory)
const selectedCategoryProvider = SelectedCategoryProvider._();

final class SelectedCategoryProvider
    extends $NotifierProvider<SelectedCategory, MapEntry<String, String>?> {
  const SelectedCategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCategoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCategoryHash();

  @$internal
  @override
  SelectedCategory create() => SelectedCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapEntry<String, String>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapEntry<String, String>?>(value),
    );
  }
}

String _$selectedCategoryHash() => r'37534b31a8a677a551cacb9e604d33360112aa7b';

abstract class _$SelectedCategory extends $Notifier<MapEntry<String, String>?> {
  MapEntry<String, String>? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<MapEntry<String, String>?, MapEntry<String, String>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapEntry<String, String>?, MapEntry<String, String>?>,
              MapEntry<String, String>?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
