import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mplus_app/app/auth/data/data_sources/auth_data_source.dart';
import 'package:mplus_app/app/auth/data/repositories/auth_repository_impl.dart';
import 'package:mplus_app/app/auth/domain/repositories/auth_repository.dart';
import 'package:mplus_app/app/user/data/data_sources/local_user_data_source.dart';
import 'package:mplus_app/utils/helpers/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('Auth repository test', () {
    WidgetsFlutterBinding.ensureInitialized();
 

    late AuthRepository authRepository;

    setUp(() {
      authRepository = AuthRepositoryImpl(
          authDataSource: AuthDataSourceImpl(),
          localUserDataSource: LocalUserDataSourceImpl());
    });

    test('Should sign in successfully.', () async {
      final user = await authRepository.signIn(
          username: 'PornsudN', password: 'Borneo@990990');

      expect(user.typeRefId, '990990');
    });

    test('Should fail to sign in ', () async {
      try {
        final user = await authRepository.signIn(
            username: 'ABC', password: '1212312121');
      } catch (ex) {
        expect(ex ,isA<UnauthorizedException>);
      }
    });
  });
}
