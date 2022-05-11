import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/base/route/route_const.dart';
import 'package:riverpod_example/controller/login_controller/login_controller.dart';
import 'package:riverpod_example/services/secure_storage/secure_storage.dart';

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
          onPressed: () {
            ref.read(loginProvider.notifier).login();
          },
        ),
      ),
    );
  }

  void checkHasToken() async {
    final token = await SecureStorage.instance.getTokenAuthen();
    if (token != null) {
      Navigator.of(context)
          .pushNamed(Routes.homeRoute, arguments: 'From Login');
    }
  }
}
