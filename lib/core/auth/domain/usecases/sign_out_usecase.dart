import 'package:mplus_app/core/auth/domain/repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository _authRepository;

  SignOutUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<bool> call() {
    return _authRepository.signOut();
  }
}
