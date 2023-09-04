import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mplus_app/data/data_sources/remote/client.dart';
import 'package:mplus_app/injection.dart';

void main() {
  setUp(() {
    setUpLocator();
  });

  test('Dio should connect to the server.', () async {
    final dio = GetIt.I.get<Dio>();

    final response = await dio.get('/');

    expect(response.statusCode, 200);
  });
}
