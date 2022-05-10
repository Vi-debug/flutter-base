import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/base/models/base_error.dart';

extension AsyncValueExtension on AsyncValue {
  // isLoading shorthand (AsyncLoading is a subclass of AsycValue)
  bool get isLoading => this is AsyncLoading;

  // show a snackbar on error only
  void showSnackBarOnError(BuildContext context) => whenOrNull(
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(BaseError.fromError(error, _).message)),
          );
        },
      );
}