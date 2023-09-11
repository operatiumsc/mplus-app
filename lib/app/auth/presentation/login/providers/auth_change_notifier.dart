import 'package:flutter/foundation.dart';
import 'package:mplus_app/app/auth/domain/usecases/refresh_auth_usecase.dart';
import 'package:mplus_app/app/user/domain/usecases/get_cached_user_usecase.dart';

enum AuthStatus { unauthenticated, authenticating, authenticated, failed }

class AuthenticationChangeNotifier extends ChangeNotifier {

  final RefreshAuthUseCase _refreshAuthUseCase;

  AuthenticationChangeNotifier(
      {required GetCachedUserUseCase getCachedUserUseCase,
      required RefreshAuthUseCase refreshAuthUseCase})
      : 
        _refreshAuthUseCase = refreshAuthUseCase;

  AuthStatus status = AuthStatus.unauthenticated;

  Future<void> authenticate() async {
    try {

      await _refreshAuthUseCase.call();

      notifyListeners();
    } catch (ex) {
      status == AuthStatus.failed;
      notifyListeners();
    }
  }

  Future<void> requestSignOut() async {}
}
