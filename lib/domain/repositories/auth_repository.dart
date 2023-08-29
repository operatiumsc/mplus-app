import 'package:dartz/dartz.dart';
import 'package:mplus_app/data/failure.dart';
import 'package:mplus_app/data/models/auth/auth_response_model.dart';

import '../entities/signin_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> signIn(SignInParams params);

  Future<Either<Failure, bool>> signUpEmployee(
      String employeeId, String email, String password);
}
