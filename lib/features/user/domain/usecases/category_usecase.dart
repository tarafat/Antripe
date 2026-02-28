import 'package:antripe/features/user/data/repositories/contract_repository.dart';
import 'package:antripe/features/user/domain/entities/category.dart' as category_entity;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_usecase.g.dart';

@riverpod
class AllCategory extends _$AllCategory {
  @override
  Future<List<category_entity.Category>> build() async {
    final response = await ref.watch(contractProvider).getContract();

    final contacts = response.data?.contacts ?? [];

    return contacts.map((e) => category_entity.Category(id: e.categoryId, name: e.name)).toList();
  }
}
