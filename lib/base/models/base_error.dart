import 'package:riverpod_example/base/utils/dio/dio_error_utils.dart';

class BaseError {
  final int statusCode;
  final String message;

  BaseError(this.statusCode, this.message);

  factory BaseError.fromError(Object error, StackTrace? stackTrace) {
    int statusCode = 0;
    String errorContent = DioErrorUtil.handleError(error);
    return BaseError(statusCode, errorContent);
  }
}
