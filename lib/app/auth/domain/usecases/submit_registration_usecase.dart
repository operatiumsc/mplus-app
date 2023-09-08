import 'package:mplus_app/app/auth/domain/repositories/auth_repository.dart';

class SubmitRegistrationUseCase {
  final AuthRepository _authRepository;

  SubmitRegistrationUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future call({required String employeeId, required String email}) {
    return _authRepository.signUpEmployee(employeeId: employeeId, email: email);
  }
}
