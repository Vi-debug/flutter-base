import 'package:riverpod_example/services/api/app_api.dart';
import 'package:riverpod_example/services/secure_storage/secure_storage.dart';

import '../models/user.dart';

class UserRepository {

  final _appApi = AppApi.instance;

  final _secureStorage = SecureStorage.instance;

  final userUltilities = UserUltilities();

  Future<List<User>> getAllUsers() async {
    final data = await _appApi.sendGetRequest('https://randomuser.me/api/');
    final listUserJson = data['results'] as List;
    return listUserJson.map((json) => User.fromJson(json)).toList();
  }
}

class UserUltilities {
}
