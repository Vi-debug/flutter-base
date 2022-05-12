import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/base/utils/common/common_utils.dart';

import '../models/base_error.dart';
import '../route/route_const.dart';

extension AsyncValueExtension on AsyncValue {
  // isLoading shorthand (AsyncLoading is a subclass of AsycValue)
  bool get isLoading => this is AsyncLoading;

  // implement what you want to show when an error happens
  void showWhenError(BuildContext context) => whenOrNull(
        error: (error, _) {
          if (error is String) {
            CommonUtils.showSnackBar(context, error);
          } else {
            CommonUtils.showSnackBar(
                context, BaseError.fromError(error, _).message);
          }
        },
      );
}
