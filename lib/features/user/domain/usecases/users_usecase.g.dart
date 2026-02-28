// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UsersUseCase)
const usersUseCaseProvider = UsersUseCaseProvider._();

final class UsersUseCaseProvider
    extends $AsyncNotifierProvider<UsersUseCase, List<users_entity.Contact>> {
  const UsersUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersUseCaseHash();

  @$internal
  @override
  UsersUseCase create() => UsersUseCase();
}

String _$usersUseCaseHash() => r'9e35c8388a3e6fb025daf6d68bd3f81ffbfab7a1';

abstract class _$UsersUseCase
    extends $AsyncNotifier<List<users_entity.Contact>> {
  FutureOr<List<users_entity.Contact>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<users_entity.Contact>>,
              List<users_entity.Contact>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<users_entity.Contact>>,
                List<users_entity.Contact>
              >,
              AsyncValue<List<users_entity.Contact>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
