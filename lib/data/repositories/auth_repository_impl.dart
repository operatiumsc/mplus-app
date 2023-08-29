import 'package:dartz/dartz.dart';

import 'package:mplus_app/data/failure.dart';
import 'package:mplus_app/data/models/auth/auth_request_model.dart';
import 'package:mplus_app/data/models/auth/auth_response_model.dart';
import 'package:mplus_app/data/models/auth/signup_employee_request_model.dart';
import 'package:mplus_app/domain/repositories/auth_repository.dart';

import '../../domain/data_sources/auth_data_source.dart';
import '../../domain/entities/signin_params.dart';


class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.authDataSource);
  final AuthDataSource authDataSource;

  @override
  Future<Either<Failure, AuthResponse>> signIn(SignInParams params) async {
    final authRequest =
        AuthRequest(username: params.username, password: params.password);

    return authDataSource.signIn(authRequest);
  }

  @override
  Future<Either<Failure, bool>> signUpEmployee(
      String employeeId, String email, String password) async {
    final request = SignUpEmployeeRequest(
        employeeId: employeeId, email: email, password: password);

    return authDataSource.signUpEmployee(request);
  }
}
