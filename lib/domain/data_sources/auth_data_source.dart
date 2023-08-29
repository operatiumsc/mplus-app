import 'package:dartz/dartz.dart';

import '../../data/failure.dart';
import '../../data/models/auth/auth_request_model.dart';
import '../../data/models/auth/auth_response_model.dart';
import '../../data/models/auth/signup_employee_request_model.dart';

abstract class AuthDataSource {
  Future<Either<Failure, AuthResponse>> signIn(AuthRequest request);
  Future<Either<Failure, bool>> signUpEmployee(SignUpEmployeeRequest request);
}
