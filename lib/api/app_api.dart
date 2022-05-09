import 'package:dio/dio.dart';

import '../const/api_url.dart';

const connectionTimeOut = 5000;

class AppApi {

  static Dio dio = Dio();

  static final instance = AppApi._();

  AppApi._() {
    dio.options.connectTimeout = connectionTimeOut;
    dio.options.baseUrl = ApiUrl.baseUrl;
  }

  Future<dynamic> sendGetRequest(String path, {dynamic queryParams}) async {
    late Response response;
    response = await dio.get(
      path,
      queryParameters: queryParams,
      options: Options(headers: await _getBaseHeader()),
    );
    return response.data;
  }

  Future<dynamic> sendPostRequest(String path,
      {dynamic body,
      Map<String, dynamic>? param,
      bool sendHeader = true}) async {
    late Response response;
    response = await dio.post(
      path,
      data: body,
      queryParameters: param,
      options: Options(
        headers: sendHeader ? await _getBaseHeader() : null,
      ),
    );
    return response.data;
  }

  Future<dynamic> sendPutRequest(String path,
      {Map<String, dynamic>? param, dynamic body}) async {
    late Response response;
    response = await dio.put(path,
        queryParameters: param,
        data: body,
        options: Options(headers: await _getBaseHeader()));
    return response.data;
  }

  Future<dynamic> sendDeleteRequest(String path,
      {Map<String, dynamic>? queryParams}) async {
    late Response response;
    response = await dio.delete(path,
        queryParameters: queryParams,
        options: Options(headers: await _getBaseHeader()));
    return response.data;
  }

  Future<Map<String, dynamic>> _getBaseHeader() async {
    // final String token = await StorageApp.getTokenAuthen();
    Map<String, String> map = {
      // 'Authorization': 'Bearer $token',
    };
    return map;
  }
}