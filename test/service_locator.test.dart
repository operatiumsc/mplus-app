import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mplus_app/data/data_sources/remote/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Test service locator', () {
    final serviceLocator = GetIt.instance;

    setUpAll(() async {
      SharedPreferences.setMockInitialValues;

      serviceLocator.registerSingleton<Dio>(Client.config());
    });

    test('Service locator should register Dio.', () async {
      final dio = serviceLocator.get<Dio>();

      final response = await dio.get('/test');

      expect(response.statusCode, 200);
    });
  });
}
