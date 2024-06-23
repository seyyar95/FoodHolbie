import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodmania/src/core/storage/secure_storage.dart';
import 'package:foodmania/src/utils/constants/api_call_constants.dart';
import 'package:flutter/material.dart';

class AppInterceptor extends Interceptor {
  Dio? _dio;
  late FlutterSecureStorage _storage;
  String? accessToken;
  String? refreshToken;

  AppInterceptor() {
    _init();
  }

  Future<void> _init() async {
    _storage = const FlutterSecureStorage();
    _dio = Dio();
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    debugPrint("Requestumuz: $options");
    accessToken = await _storage.read(key: 'accessToken');
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    debugPrint("Errorumuz: $err");
    if (err.response?.statusCode == 401) {
      refreshToken = await _storage.read(key: 'refreshToken');
      if (refreshToken != null) {
        String? newAccessToken = await refreshAccessToken(refreshToken!);
        if (newAccessToken != null) {
          err.requestOptions.headers['Authorization'] =
              'Bearer $newAccessToken';
          return handler.resolve(
            await _retry(
              err.requestOptions,
            ),
          );
        }
      }
    }
    return handler.next(err);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    return _dio!.fetch<dynamic>(requestOptions);
  }

  Future<String?> refreshAccessToken(
    String refreshToken,
  ) async {
    final Dio dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $refreshToken';
    final response = await dio.post(
      baseUrl + refreshTokenEndPoint,
    );
    if (response.statusCode == 200) {
      String newAccessToken = response.data['access_token'];
      await SecureStorage.saveAccessToken(newAccessToken);
      return newAccessToken;
    } else {
      print('refresh token error');
    }
    return null;
  }
}
