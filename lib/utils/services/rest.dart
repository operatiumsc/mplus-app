import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mplus_app/app/user/domain/usecases/get_cached_user_usecase.dart';
import 'package:mplus_app/injection.dart';

class Rest {
  static late Dio _dio;

  static void init() {
    _dio = Dio()
      ..options = BaseOptions(
        baseUrl: 'http://10.0.2.2:3080/api',
        sendTimeout: 7000,
        receiveTimeout: 7000,
      )
      ..interceptors.add(_AuthInterceptor());
  }

  static Dio get client => _dio;
}

class _AuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = service.get<GetCachedUserUseCase>().call().accessToken;

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      //TODO: send refresh token to acquire new auth token.
    }

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
