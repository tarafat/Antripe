import 'package:antripe/features/user/data/repositories/contract_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/users.dart' as users_entity;

part 'user_controller.g.dart';

class UsersState {
  final List<users_entity.Contact> users;
  final MapEntry<String, String>? selectedCategory;
  final String searchQuery;

  UsersState({required this.users, this.selectedCategory, this.searchQuery = ""});

  UsersState copyWith({List<users_entity.Contact>? users, MapEntry<String, String>? selectedCategory, String? searchQuery}) {
    return UsersState(
      users: users ?? this.users,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

@riverpod
class UsersController extends _$UsersController {
  List<users_entity.Contact> _allUsers = [];

  @override
  Future<UsersState> build() async {
    final response = await ref.read(contractProvider).getContract();

    _allUsers = (response.data?.contacts ?? [])
        .map((e) => users_entity.Contact(id: e.id, name: e.name, phone: e.phone, categoryId: e.categoryId, avatarUrl: e.avatarUrl))
        .toList();

    return UsersState(users: _allUsers, selectedCategory: const MapEntry("all", "All"));
  }

  void selectCategory(MapEntry<String, String>? category) {
    final current = state.value!;
    state = AsyncData(current.copyWith(selectedCategory: category));
    _applyFilters();
  }

  void search(String query) {
    final current = state.value!;
    state = AsyncData(current.copyWith(searchQuery: query));
    _applyFilters();
  }

  void _applyFilters() {
    final current = state.value!;

    List<users_entity.Contact> filtered = _allUsers;

    // 1️⃣ Filter by category
    if (current.selectedCategory != null && current.selectedCategory!.key != "all") {
      filtered = filtered.where((u) => u.categoryId == current.selectedCategory!.key).toList();
    }

    // 2️⃣ Filter by search
    if (current.searchQuery.isNotEmpty) {
      final query = current.searchQuery.toLowerCase();

      filtered = filtered.where((u) {
        final name = u.name?.toLowerCase() ?? "";
        final phone = u.phone?.toLowerCase() ?? "";

        return name.contains(query) || phone.contains(query);
      }).toList();
    }

    state = AsyncData(current.copyWith(users: filtered));
  }
}
