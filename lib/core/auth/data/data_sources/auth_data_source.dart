import 'package:dio/dio.dart';
import 'package:mplus_app/core/user/data/models/user_dto.dart';
import 'package:mplus_app/injection.dart';

abstract class AuthDataSource {
  Future<UserDTO> signIn({required String username, required String password});
  Future<bool> signOut();
  Future<bool> signUpEmployee({
    required String employeeId,
    required String email,
    required String password,
  });
}

class AuthDataSourceImpl implements AuthDataSource {
  final _dio = service.get<Dio>();

  @override
  Future<UserDTO> signIn(
      {required String username, required String password}) async {
    try {
      final response = await _dio.post('/auth/signin', data: {
        // 'username': username,
        // 'password': password,
        'username': 'ChainarP',
        'password': 'Borneo@990556',
      });

      return UserDTO.fromJson(response.data);
    } catch (ex) {
      rethrow;
    }
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
