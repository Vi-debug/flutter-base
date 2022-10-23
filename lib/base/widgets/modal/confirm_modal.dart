import 'package:flutter/material.dart';

class ConfirmModal extends StatelessWidget {

  final String title;
  final String content;
  final Function? onAccept;

  const ConfirmModal({Key? key, required this.title, required this.content, this.onAccept}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              if (onAccept != null) onAccept!();
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          )
        ],
      );
  }
}
