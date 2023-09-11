import 'package:mplus_app/app/user/data/models/user_model.dart';
import 'package:mplus_app/utils/helpers/exception.dart';
import 'package:mplus_app/utils/services/rest.dart';

abstract class AuthDataSource {
  Future<UserModel> signIn(
      {required String username, required String password});
  Future<bool> signOut();
  Future<bool> signUpEmployee({
    required String employeeId,
    required String email,
    required String password,
  });
}

class AuthDataSourceImpl implements AuthDataSource {
  final _dio = Rest.client;

  @override
  Future<UserModel> signIn(
      {required String username, required String password}) async {
    final response = await _dio.post(
      '/auth/signin',
      data: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 401) {
      throw UnauthorizedException(message: response.data);
    }

    return UserModel.fromJson(response.data);
  }

  @override
  Future<bool> signUpEmployee({
    required String employeeId,
    required String email,
    required String password,
  }) async {
    try {
      await _dio.put('/auth/signup', queryParameters: {
        'type': 'employee'
      }, data: {
        'employeeId': employeeId,
        'email': email,
        'password': password,
      });

      return true;
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<bool> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
