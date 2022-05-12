import 'package:riverpod_example/base/utils/dio/dio_error_utils.dart';

class BaseError {
  final int? statusCode;
  final String message;

  BaseError({this.statusCode, required this.message});

  factory BaseError.fromError(Object error, StackTrace? stackTrace) {
    String errorContent = DioErrorUtil.handleError(error);
    return BaseError(message: errorContent);
  }
}
