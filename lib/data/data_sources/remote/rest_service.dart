import 'package:dio/dio.dart';
import 'package:mplus_app/data/constants.dart';
import 'package:mplus_app/data/data_sources/local/cached_service.dart';

abstract class RestService {
  init();
}

class DioClient implements RestService {
  @override
  Dio init() {
    final dio = Dio();

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      sendTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );

    dio.interceptors.add(AuthInterceptor());

    return dio;
  }
}

class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final sharedPrefs = SharedPrefs();
    final token = sharedPrefs.getString(Constants.authToken);

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    
    if (response.statusCode == 401) {
      //TODO: send refresh token to acquire new auth token.
    }

    super.onResponse(response, handler);
  }
}
