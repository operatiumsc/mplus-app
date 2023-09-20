import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mplus_app/app/user/domain/usecases/get_cached_user_usecase.dart';
import 'package:mplus_app/injection.dart';

class Rest {
  static const _baseUrl = 'http://10.0.2.2:3080/api';

  Dio get client => Dio()
    ..options = BaseOptions(
      baseUrl: _baseUrl,
      sendTimeout: 7000,
      receiveTimeout: 7000,
    )
    ..interceptors.add(_AuthInterceptor());

  Dio get clientWithRefreshAuth => Dio()
    ..options = BaseOptions(
      baseUrl: _baseUrl,
      sendTimeout: 7000,
      receiveTimeout: 7000,
    )
    ..interceptors.add(_RefreshAuthInterceptor());
}

class _AuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = service.get<GetCachedUserUseCase>().call().accessToken;

      if (token != null) {
        debugPrint('AUTHORIZATION TOKEN: $token');
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (ex) {
      debugPrint('Intercepter: Cached user was not found.');
    }

    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(err.message);
    super.onError(err, handler);
  }
}

class _RefreshAuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = service.get<GetCachedUserUseCase>().call().refreshToken;

      if (token != null) {
        debugPrint('AUTHORIZATION TOKEN: $token');
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (ex) {
      debugPrint('Intercepter: Cached user was not found.');
    }

    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(err.message);
    super.onError(err, handler);
  }
}
