// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AllCategory)
const allCategoryProvider = AllCategoryProvider._();

final class AllCategoryProvider
    extends
        $AsyncNotifierProvider<AllCategory, List<category_entity.Category>> {
  const AllCategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allCategoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allCategoryHash();

  @$internal
  @override
  AllCategory create() => AllCategory();
}

String _$allCategoryHash() => r'f00d11dd9a7cd07c943f7c513d8e6e61f342e277';

abstract class _$AllCategory
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
