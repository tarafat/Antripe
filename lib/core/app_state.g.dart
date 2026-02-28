// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppState)
const appStateProvider = AppStateProvider._();

final class AppStateProvider extends $NotifierProvider<AppState, AppStateData> {
  const AppStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appStateHash();

  @$internal
  @override
  AppState create() => AppState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppStateData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppStateData>(value),
    );
  }
}

String _$appStateHash() => r'19ce2c4e981a10b6b1bd984f0ff01c9bc759cc41';

abstract class _$AppState extends $Notifier<AppStateData> {
  AppStateData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppStateData, AppStateData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppStateData, AppStateData>,
              AppStateData,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
