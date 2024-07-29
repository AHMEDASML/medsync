import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:medsync/global/endpoints/url_api.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    // String lang = 'en',
    String? token,
  }) async {
    // dio.options.headers =
    // {
    //   'lang':lang,
    //   'Authorization': token??'',
    //   'Content-Type': 'application/json',
    // };

    dio.options.headers['x-auth-token'] = token;

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    dynamic data,
    Map<String, dynamic>? query,
    String? token,
  }) async {

    // اذاما زبطت .. حط شرط انه اذا نال لا ترسلا
    dio.options.headers = {
      'x-auth-token': token,
      'Content-Type': 'application/json'
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required dynamic data,
    Map<String, dynamic>? query,

    String? token,
  }) async {
    dio.options.headers = {
      'x-auth-token': token ?? '',
      'Content-Type': 'application/json',
    };

    return dio.put(
      url,
      // queryParameters: query,
      data: data,
    );
  }
}
