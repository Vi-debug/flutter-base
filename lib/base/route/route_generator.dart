import 'package:flutter/material.dart';
import 'package:riverpod_example/base/route/route_const.dart';
import 'package:riverpod_example/presentation/login/login.dart';

import '../../presentation/home/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => MyHomePage(title: "title"));
      case Routes.homeRoute:
        if (args is String) {
          final title = args;
          return MaterialPageRoute(
              builder: (context) => MyHomePage(title: title));
        }
        return _buildErrorRoute();
      default:
        return _buildErrorRoute();
    }
  }

  static _buildErrorRoute() {
    return MaterialPageRoute(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
