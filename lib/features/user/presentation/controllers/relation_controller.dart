import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'relation_controller.g.dart';

@riverpod
class RelationController extends _$RelationController {
  @override
  String? build() {
    return "all"; // initial value
  }

  void updateSelectedRelation(String relationCode) {
    state = relationCode;
  }
}
