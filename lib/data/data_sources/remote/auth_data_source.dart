import 'package:dartz/dartz.dart';

import '../../../domain/data_sources/auth_data_source.dart';
import '../../exception.dart';
import '../../failure.dart';
import '../../models/auth/auth_request_model.dart';
import '../../models/auth/auth_response_model.dart';
import '../../models/auth/signup_employee_request_model.dart';
import 'rest_service.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final client = DioClient().init();

  @override
  Future<Either<Failure, AuthResponse>> signIn(AuthRequest request) async {
    try {
      final response =
          await client.post('/auth/signin', data: request.toJson());

      final authResponse = AuthResponse.fromJson(response.data);

      return Right(authResponse);
    } catch (e) {
      throw Left(handleException(e));
    }
  }

  @override
  Future<Either<Failure, bool>> signUpEmployee(
      SignUpEmployeeRequest request) async {
    try {
      await client.put('/auth/signup?type=employee', data: request.toJson());

      return const Right(true);
    } catch (e) {
      throw Left(handleException(e));
    }
  }
}
