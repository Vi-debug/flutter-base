import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/base/extension/widget_ref_extension.dart';
import 'package:riverpod_example/controller/check_token_controller.dart';

import '../../base/route/route_const.dart';
import '../../controller/login_controller.dart';

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  @override
  void initState() {
    checkHasToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ref.listenAsyncValue(loginProvider, context);

    ref.listenAsyncValue<AsyncValue<bool>>(
      checkTokenProvider,
      context,
      onFinishLoading: (prev, next) {
        if (next is AsyncData && next.value!) {
          Navigator.of(context)
              .pushNamed(Routes.homeRoute, arguments: 'From Home with token');
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            'Login',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          onPressed: () => login(context),
        ),
      ),
    );
  }

  void checkHasToken() async {
    ref.read(checkTokenProvider.notifier).checkHasToken();
  }

  void login(BuildContext context) async {
    ref.read(loginProvider.notifier).login();
  }
}
