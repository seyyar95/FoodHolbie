import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodmania/src/core/storage/secure_storage.dart';
import 'package:foodmania/src/utils/constants/api_call_constants.dart';
import 'package:flutter/material.dart';

class CookieManager extends Interceptor {
  Dio? _dio;
  late FlutterSecureStorage _storage;
  String? accessToken;
  String? refreshToken;

  CookieManager() {
    _init();
  }

  Future<void> _init() async {
    _storage = const FlutterSecureStorage();
    if (await _storage.containsKey(key: 'accessToken') &&
        await _storage.containsKey(key: 'refreshToken')) {
      accessToken = await _storage.read(key: 'accessToken');
      refreshToken = await _storage.read(key: 'refreshToken');
    }
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
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio!.request<dynamic>(
      requestOptions.baseUrl + requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<String?> refreshAccessToken(
    String refreshToken,
  ) async {
    _dio!.options.headers['Cookie'] = 'refresh_token = $refreshToken';
    final response = await _dio!.post(
      baseUrl + loginEndPoint,
      data: {
        "refresh_token": refreshToken,
      },
    );
    if (response.statusCode == 200) {
      String newAccessToken = response.data['access_token'];
      String newRefreshToken = response.data['refresh_token'];
      await SecureStorage.saveAccessToken(newAccessToken);
      await SecureStorage.saveRefreshToken(newRefreshToken);
      return newAccessToken;
    } else {
      print('else');
    }
    return null;
  }
}
