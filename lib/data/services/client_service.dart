import 'package:dio/dio.dart';
import 'package:mplus_app/data/constants.dart';

class ClientService {
  static Dio init() {
    final dio = Dio();
    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      sendTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );

    return dio;
  }
}
