import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  final inputController = TextEditingController();

  MyInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
