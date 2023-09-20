import 'package:flutter/material.dart';
import 'package:mplus_app/app/auth/domain/usecases/refresh_auth_usecase.dart';
import 'package:mplus_app/app/auth/domain/usecases/sign_in_usecase.dart';

enum SignInPageStatus { initial, loading, success, failed }

enum AuthStatus { unauthenticated, authenticating, authenticated, failed }

class SignInPageChangeNotifier extends ChangeNotifier {
  final RefreshAuthUseCase _refreshAuthUseCase;
  final SignInUseCase _signInUseCase;

  SignInPageChangeNotifier(
      {required RefreshAuthUseCase refreshAuthUseCase,
      required SignInUseCase signInUseCase})
      : _refreshAuthUseCase = refreshAuthUseCase,
        _signInUseCase = signInUseCase;

  var pageStatus = SignInPageStatus.initial;
  var authStatus = AuthStatus.unauthenticated;

  bool isVisiblePassword = false;

  Future init() async {
    try {
      debugPrint('Authenticating');
      authStatus = AuthStatus.authenticating;
      notifyListeners();

      await _refreshAuthUseCase.call();

      authStatus = AuthStatus.authenticated;
      notifyListeners();
    } catch (ex) {
      authStatus = AuthStatus.authenticated;
      notifyListeners();

      debugPrint(ex.toString());
    }
  }

  Future performSignIn({
    required GlobalKey<FormState> formKey,
    required String username,
    required String password,
  }) async {
    try {
      FocusManager.instance.primaryFocus?.unfocus();
      authStatus = AuthStatus.authenticating;
      notifyListeners();

      if (formKey.currentState?.validate() ?? false) {
        debugPrint('signing in...');
        await _signInUseCase.call(username: username, password: password);
        authStatus = AuthStatus.authenticated;
        notifyListeners();
      }
    } catch (ex) {
      formKey.currentState?.validate();
      authStatus = AuthStatus.failed;
      notifyListeners();

      debugPrint(ex.toString());
    }
  }

  void toggleShowPassword() {
    isVisiblePassword = !isVisiblePassword;
    notifyListeners();
  }
}
