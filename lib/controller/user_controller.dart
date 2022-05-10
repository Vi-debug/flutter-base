import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/repository/user_repository.dart';

import '../models/user.dart';

final listUserProvider =
    StateNotifierProvider<UserController, AsyncValue<List<User>>>((ref) {
  return UserController();
});

class UserController extends StateNotifier<AsyncValue<List<User>>> {
  final UserRepository userRepository = UserRepository();

  UserController() : super(const AsyncValue.data([]));

  Future<void> getAllUsers() async {
    try {
      state = const AsyncValue.loading();
      final newList = await userRepository.getAllUsers();
      state = AsyncValue.data(newList);
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }

  void removeAllUser() {
    state = const AsyncValue.data([]);
  }
}
