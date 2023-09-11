import 'package:mplus_app/app/user/domain/entities/user.dart';
import 'package:mplus_app/app/user/domain/repositories/user_repository.dart';

class GetCachedUserUseCase {
  final UserRepository _userRepository;

  GetCachedUserUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  User call() {
    return _userRepository.getCachedUser();
  }
}
