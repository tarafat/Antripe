// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UsersController)
const usersControllerProvider = UsersControllerProvider._();

final class UsersControllerProvider
    extends $AsyncNotifierProvider<UsersController, UsersState> {
  const UsersControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersControllerHash();

  @$internal
  @override
  UsersController create() => UsersController();
}

String _$usersControllerHash() => r'c8a27a68516bfe36237a94ebac5b0ab790e71fcc';

abstract class _$UsersController extends $AsyncNotifier<UsersState> {
  FutureOr<UsersState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<UsersState>, UsersState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UsersState>, UsersState>,
              AsyncValue<UsersState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
