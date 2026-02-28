import 'package:antripe/features/user/data/repositories/contract_repository.dart';
import 'package:antripe/features/user/domain/entities/users.dart' as users_entity show Contact;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_usecase.g.dart';

@riverpod
class UsersUseCase extends _$UsersUseCase {
  @override
  Future<List<users_entity.Contact>> build() async {
    final response = await ref.read(contractProvider).getContract();

    final contacts = response.data?.contacts ?? [];

    return contacts
        .map((e) => users_entity.Contact(id: e.id, name: e.name, phone: e.phone, categoryId: e.categoryId, avatarUrl: e.avatarUrl))
        .toList();
  }
}
