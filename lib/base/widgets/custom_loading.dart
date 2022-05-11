import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final bool visible;

  const Loading({Key? key, required this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Positioned.fill(
        child: Container(
          color: Colors.black26,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
