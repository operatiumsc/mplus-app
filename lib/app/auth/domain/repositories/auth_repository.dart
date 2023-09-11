import 'package:mplus_app/app/user/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> signIn({required String username, required String password});
  Future<User> refreshAuth({required String refreshToken});

  Future<bool> signOut();

  Future<bool> signUpEmployee({
    required String employeeId,
    required String email,
  });
}
