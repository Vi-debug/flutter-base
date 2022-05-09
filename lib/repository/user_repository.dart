import 'package:riverpod_example/api/app_api.dart';

import '../models/user.dart';

class UserRepository {

  final AppApi _appApi = AppApi.instance;

  final UserUltilities userUltilities = UserUltilities();

  Future<List<User>> getAllUsers() async {
    final data = await _appApi.sendGetRequest('https://randomuser.me/api/');
    final listUserJson = data['results'] as List;
    return listUserJson.map((json) => User.fromJson(json)).toList();
  }
}

class UserUltilities {
}
