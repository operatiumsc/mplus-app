import 'package:dartz/dartz.dart';
import 'package:mplus_app/data/failure.dart';
import 'package:mplus_app/data/models/auth/auth_response_model.dart';
import 'package:mplus_app/domain/repositories/auth_repository.dart';

import '../entities/signin_params.dart';

class SignInUseCase {
  SignInUseCase(this.authRepository);

  final AuthRepository authRepository;

  Future<Either<Failure, AuthResponse>> execute(SignInParams params) {
    return authRepository.signIn(params);
  }
}


