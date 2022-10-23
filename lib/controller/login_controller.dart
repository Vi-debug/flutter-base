import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:riverpod_example/base/models/base_error.dart';
import 'package:riverpod_example/base/utils/common/common_utils.dart';

import '../base/config/config.dart';
import '../base/route/route_const.dart';
import '../repository/login_repository/login_repository.dart';

class LoginController extends ChangeNotifier {

  final loginRepository = LoginRepository();
  final appAuth = const FlutterAppAuth();
  bool isLoading = false;

  // remember config android and ios before implement login
  void login(BuildContext context) async {
    try {
      isLoading = true;
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
      } else {
        CommonUtils.showSnackBar(context, "No token");
      }
    } catch (e) {
      CommonUtils.showErrorModal(context, "Login Error", BaseError.fromError(e).message);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void checkHasToken(BuildContext context) async {
    try {
      isLoading = true;
      final hasToken = await loginRepository.hasAcessToken();
      if (hasToken) {
        Navigator.of(context)
              .pushNamed(Routes.homeRoute, arguments: 'From Home with token');
      }
    } catch (e) {
      CommonUtils.showErrorModal(context, "Token Error", BaseError.fromError(e).message);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
