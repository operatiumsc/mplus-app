import 'package:mplus_app/app/auth/domain/repositories/auth_repository.dart';
import 'package:mplus_app/app/user/domain/repositories/user_repository.dart';

class SignInUseCase {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  SignInUseCase(
      {required AuthRepository authRepository,
      required UserRepository userRepository})
      : _authRepository = authRepository,
        _userRepository = userRepository;

  Future call({required String username, required String password}) async {
    final user =
        await _authRepository.signIn(username: username, password: password);

    final result = await _userRepository.cachedUser(user: user);
    return result;
  }
}
