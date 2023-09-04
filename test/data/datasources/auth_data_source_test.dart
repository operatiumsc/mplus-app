import 'package:flutter_test/flutter_test.dart';
import 'package:mplus_app/data/data_sources/remote/auth_data_source.dart';
import 'package:mplus_app/data/data_sources/remote/client.dart';
import 'package:mplus_app/injection.dart';

void main() {
  group('Auth data source test', () {
    setUp(() {
      setUpLocator();
    });

    test('Should sign in successfully.', () async {
      final authDataSourceImpl = AuthDataSourceImpl();

      final user = await authDataSourceImpl.signIn(
          username: 'PornsudN', password: 'Borneo@990990');

      expect(user.typeRefId, '990990');
    });
  });
}
