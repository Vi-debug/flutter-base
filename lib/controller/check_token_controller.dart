import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/login_repository/login_repository.dart';

final checkTokenProvider =
    StateNotifierProvider<CheckTokenController, AsyncValue<bool>>((ref) {
  return CheckTokenController();
});

class CheckTokenController extends StateNotifier<AsyncValue<bool>> {
  CheckTokenController() : super(const AsyncValue.data(false));

  final loginRepository = LoginRepository();

  void checkHasToken() async {
    try {
      state = const AsyncValue.loading();
      final hasToken = await loginRepository.hasAcessToken();
      state = AsyncValue.data(hasToken);
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
