import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'header_select_contoller.g.dart';

@riverpod
class ContactTabController extends _$ContactTabController {
  @override
  String build() => "contacts"; // default tab

  void changeTab(String tab) {
    if (state == tab) return;
    state = tab;
  }
}
