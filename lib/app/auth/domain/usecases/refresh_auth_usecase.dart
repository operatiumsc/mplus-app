import 'package:mplus_app/app/auth/domain/repositories/auth_repository.dart';
import 'package:mplus_app/app/user/domain/repositories/user_repository.dart';
import 'package:mplus_app/utils/helpers/exception.dart';

class RefreshAuthUseCase {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  RefreshAuthUseCase(
      {required AuthRepository authRepository,
      required UserRepository userRepository})
      : _authRepository = authRepository,
        _userRepository = userRepository;

  Future<bool> call() async {
    final cachedUser = _userRepository.getCachedUser();

    if (cachedUser.refreshToken == null) {
      throw UnauthorizedException();
    }

    final user = await _authRepository.refreshAuth(
        refreshToken: cachedUser.refreshToken!);
    final result = await _userRepository.cachedUser(user: user);
    return result;
  }
}
