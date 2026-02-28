// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CategoryController)
const categoryControllerProvider = CategoryControllerProvider._();

final class CategoryControllerProvider
    extends
        $AsyncNotifierProvider<
          CategoryController,
          List<category_entity.Category>
        > {
  const CategoryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryControllerHash();

  @$internal
  @override
  CategoryController create() => CategoryController();
}

String _$categoryControllerHash() =>
    r'1cc8c769bfea8208c2d6c1b7d94330cc2deee686';

abstract class _$CategoryController
    extends $AsyncNotifier<List<category_entity.Category>> {
  FutureOr<List<category_entity.Category>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<category_entity.Category>>,
              List<category_entity.Category>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<category_entity.Category>>,
                List<category_entity.Category>
              >,
              AsyncValue<List<category_entity.Category>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
