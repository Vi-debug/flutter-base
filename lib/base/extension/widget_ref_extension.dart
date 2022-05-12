import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/base/extension/async_value_extension.dart';

extension WidgetRefExtension on WidgetRef {
  void listenAsyncValue<T>(
    StateNotifierProvider<dynamic, T> provider,
    BuildContext context, {
    Function(T, T)? onFinishLoading,
  }) {
    listen<T>(provider, (previous, next) {
      if (next is AsyncValue) {
        next.showWhenError(context);
        if (previous is AsyncLoading &&
            next is AsyncData &&
            onFinishLoading != null) {
          onFinishLoading(previous, next);
        }
      }
    });
  }
}