import 'package:mplus_app/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future call({required String username, required String password}) {
    return _authRepository.signIn(username: username, password: password);
  }
}
