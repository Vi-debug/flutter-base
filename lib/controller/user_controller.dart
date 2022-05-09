import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/repository/user_repository.dart';

import '../models/user.dart';


class UserController extends StateNotifier<List<User>> {
  
  final UserRepository userRepository = UserRepository();

  UserController() : super([]);
  
  void getAllUsers() async {
    final newList = await userRepository.getAllUsers();
    state = newList;
  }

  void removeAllUser() {
    state = [];
  }
}

final listUserProvider = StateNotifierProvider<UserController, List<User>>((ref) {
  return UserController();
});