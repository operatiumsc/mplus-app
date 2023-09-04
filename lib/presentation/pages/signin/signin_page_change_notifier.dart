import 'package:flutter/material.dart';
import 'package:mplus_app/domain/usecases/auth/sign_in_usecase.dart';

enum SignInPageStatus { initial, loading, success, failed }

enum AuthStatus { unauthenticated, authenticating, authenticated, failed }

class SignInPageChangeNotifier extends ChangeNotifier {
  final SignInUseCase _signInUseCase;

  SignInPageChangeNotifier({required SignInUseCase signInUseCase})
      : _signInUseCase = signInUseCase;

  final signInFormKey = GlobalKey<FormState>();

  var pageStatus = SignInPageStatus.initial;
  var authStatus = AuthStatus.unauthenticated;

  Future performSignIn(
      {required String username, required String password}) async {
    try {
      authStatus = AuthStatus.authenticating;
      notifyListeners();

      // if (signInFormKey.currentState?.validate() ?? false) {
      debugPrint('signing in...');
      await _signInUseCase.call(username: username, password: password);
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      // }
    } catch (ex) {
      signInFormKey.currentState?.validate();
      authStatus = AuthStatus.failed;
      notifyListeners();

      debugPrint(ex.toString());
    }
  }
}
