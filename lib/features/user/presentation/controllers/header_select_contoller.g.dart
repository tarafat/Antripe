// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_select_contoller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ContactTabController)
const contactTabControllerProvider = ContactTabControllerProvider._();

final class ContactTabControllerProvider
    extends $NotifierProvider<ContactTabController, String> {
  const ContactTabControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contactTabControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contactTabControllerHash();

  @$internal
  @override
  ContactTabController create() => ContactTabController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$contactTabControllerHash() =>
    r'3dee28c7421afa70b162182a73538be9aff4f990';

abstract class _$ContactTabController extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
