import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/base/models/base_error.dart';

import '../base/config/config.dart';
import '../base/route/route_const.dart';
import '../repository/login_repository/login_repository.dart';

final loginProvider =
    StateNotifierProvider<LoginController, AsyncValue<void>>((ref) {
  return LoginController();
});

class LoginController extends StateNotifier<AsyncValue<void>> {
  LoginController() : super(const AsyncValue.data(null));

  final loginRepository = LoginRepository();

  final appAuth = const FlutterAppAuth();

  // remember config android and ios before implement login
  void login() async {
    try {
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
      final accessToken = result?.accessToken;
      if (accessToken != null) {
        loginRepository.saveAcessToken(accessToken);
        state = const AsyncValue.data(null);
      } else {
        state = const AsyncValue.error('Login Error');
      }
    } catch (e) {
      state = const AsyncValue.error('Login Error');
    }
  }
}
