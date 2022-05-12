import 'package:flutter/material.dart';

class CommonUtils {
  CommonUtils._();

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
