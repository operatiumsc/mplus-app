import 'package:mplus_app/core/user/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> signIn({required String username, required String password});

  Future<bool> signOut();

  Future<bool> signUpEmployee({
    required String employeeId,
    required String email,
  });
}
