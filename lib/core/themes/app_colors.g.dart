// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_colors.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appColors)
const appColorsProvider = AppColorsProvider._();

final class AppColorsProvider
    extends
        $FunctionalProvider<AppColorPalette, AppColorPalette, AppColorPalette>
    with $Provider<AppColorPalette> {
  const AppColorsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appColorsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appColorsHash();

  @$internal
  @override
  $ProviderElement<AppColorPalette> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppColorPalette create(Ref ref) {
    return appColors(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppColorPalette value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppColorPalette>(value),
    );
  }
}

String _$appColorsHash() => r'ddf8551db90fc91e056b1ce99ced0238d1ab1ce6';
