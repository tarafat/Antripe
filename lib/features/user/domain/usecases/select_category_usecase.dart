import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'select_category_usecase.g.dart';

@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  MapEntry<String, String>? build() {
    return null;
  }

  void setCategory(MapEntry<String, String> type) {
    state = type;
  }
}
