import 'package:dio/dio.dart';

class BaseError {
  final int statusCode;
  final String message;

  BaseError(this.statusCode, this.message);

  factory BaseError.fromError(Object error, StackTrace? stackTrace) {
    int statusCode = 0;
    String errorContent =
        'Không thể kết nối tới máy chủ\nQuý khách vui lòng kiểm tra lại kết nối mạng';
    if (error is DioError) {
      if (error.response != null) {
        statusCode = error.response!.statusCode ?? 0;
        switch (error.type) {
          case DioErrorType.connectTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.receiveTimeout:
            errorContent =
                'Không có phản hồi từ hệ thống, Quý khách vui lòng thử lại sau';
            break;
          case DioErrorType.response:
            switch (statusCode) {
              case 400:
                errorContent = 'Dữ liệu gửi đi không hợp lệ!';
                break;
              case 401:
                errorContent =
                    'Phiên đăng nhập đã hết hạn, quý khách vui lòng đăng nhập lại';
                break;
              case 404:
                errorContent =
                    'Không tìm thấy đường dẫn này, xin vui lòng liên hệ Admin';
                break;
              case 500:
                errorContent =
                    'Lỗi xử lý hệ thống\nXin vui lòng thử lại sau!!!';
                break;

              default:
                errorContent =
                    'Lỗi xử lý hệ thống\nXin vui lòng thử lại sau!!!';
            }
            break;
          default:
            errorContent =
                'Không thể kết nối tới máy chủ\nQuý khách vui lòng kiểm tra lại kết nối mạng';
        }
      }
    }

    return BaseError(statusCode, errorContent);
  }
}
