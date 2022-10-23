import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base/route/route_const.dart';
import '../../controller/login_controller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  void initState() {
    getController().checkHasToken(context);
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
          onPressed: () => login(context),
        ),
      ),
    );
  }


  void login(BuildContext context) async {
    getController().login(context);
  }

  LoginController getController() {
    return Provider.of<LoginController>(context, listen: false);
  }
}
