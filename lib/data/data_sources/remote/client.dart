import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mplus_app/data/data_sources/local/local_storage_service.dart';
import 'package:mplus_app/data/data_sources/remote/config.dart';
import 'package:mplus_app/injection.dart';

class Client {
  static Dio config() {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: Config.baseUrl,
        sendTimeout: 5000,
        receiveTimeout: 5000,
      )
      ..interceptors.add(_AuthInterceptor());

    return dio;
  }

  Future<bool> test() async {
    try {
      final dio = Client.config();
      await dio.get('/test');
      return true;
    } catch (ex) {
      rethrow;
    }
  }
}

class _AuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = service.get<LocalStorageService>().getUser()?.accessToken;

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
