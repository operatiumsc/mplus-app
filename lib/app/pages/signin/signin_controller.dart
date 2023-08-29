import 'package:flutter/material.dart';

import '../../../domain/usecases/signin_usecase.dart';

class SignInController extends ChangeNotifier {
  final SignInUseCase authUseCase;

  SignInController(this.authUseCase);
}
