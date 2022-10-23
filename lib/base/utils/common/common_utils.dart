import 'package:flutter/material.dart';
import '../../widgets/modal/alert_modal.dart';
import '../../widgets/modal/confirm_modal.dart';
import '../../widgets/modal/error_modal.dart';

class CommonUtils {
  CommonUtils._();

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showErrorModal(
      BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => ErrorModal(
        content: content,
        title: title,
      ),
    );
  }

  static void showAleartModal(
      BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertModal(title: title, content: content),
    );
  }

  static void showConfirmModal(
      BuildContext context, String title, String content, Function? onAccept) {
    showDialog(
      context: context,
      builder: (context) => ConfirmModal(
        title: title,
        content: content,
        onAccept: onAccept,
      ),
    );
  }
}
