
import 'package:flutter/cupertino.dart';
import 'package:riverpod_example/base/models/base_error.dart';
import 'package:riverpod_example/base/utils/common/common_utils.dart';

import '../models/user/user.dart';
import '../repository/user_repository/user_repository.dart';

class HomeController extends ChangeNotifier {
  final UserRepository userRepository = UserRepository();

  final List<User> listUser = [];
  bool isLoading = false;

  void getAllUsers(context) async {
    try {
      isLoading = true;
      notifyListeners();
      final newList = await userRepository.getAllUsers();
      listUser.addAll(newList);
    } catch (e) {
      CommonUtils.showSnackBar(context, BaseError.fromError(e).message);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void removeAllUser() {
    listUser.clear();
    notifyListeners();
  }
}
