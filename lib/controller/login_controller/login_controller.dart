import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/base/config/config.dart';
import 'package:riverpod_example/services/secure_storage/secure_storage.dart';

final loginProvider =
    StateNotifierProvider<LoginController, AsyncValue<void>>((ref) {
  return LoginController();
});

class LoginController extends StateNotifier<AsyncValue<void>> {
  LoginController() : super(const AsyncValue.data(null));

  // remember config android and ios before implement login
  final appAuth = const FlutterAppAuth();

  void login() async {
    try {
      print(clientID);
      state = const AsyncValue.loading();
      final result = await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clientID,
          redirectUrl,
          issuer: host,
          scopes: ['openid', 'profile', 'offline_access'],
          // promptValues: ['login']
        ),
      );
      final accessToken = result?.accessToken ?? '';
      await SecureStorage.instance.setTokenAuthen(accessToken);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
