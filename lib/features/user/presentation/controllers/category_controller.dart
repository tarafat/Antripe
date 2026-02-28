import 'package:antripe/features/user/data/repositories/contract_repository.dart';
import 'package:antripe/features/user/domain/entities/category.dart' as category_entity;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  List<category_entity.Category> _allCategories = [];
  @override
  Future<List<category_entity.Category>> build() async {
    final response = await ref.read(contractProvider).getContract();

    final categories = response.data?.categories ?? [];

    // Remove duplicates using Map
    final Map<String, category_entity.Category> uniqueMap = {};

    for (final category in categories) {
      if (category.id == null) continue;

      uniqueMap.putIfAbsent(category.id!, () => category_entity.Category(id: category.id, name: category.name ?? ''));
    }

    _allCategories = uniqueMap.values.toList();

    return _allCategories;
  }
}
