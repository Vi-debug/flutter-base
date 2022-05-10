import 'package:flutter/material.dart';
import 'package:riverpod_example/base/route/route_const.dart';
import 'package:riverpod_example/features/home/screens/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
            builder: (context) => const MyHomePage(title: 'Base flutter'));
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
