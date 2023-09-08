import 'package:mplus_app/core/storage/data/data_source/local_storage_service.dart';
import 'package:mplus_app/core/auth/data/data_sources/auth_data_source.dart';
import 'package:mplus_app/core/user/data/models/user_dto.dart';
import 'package:mplus_app/core/user/domain/entities/user.dart';
import 'package:mplus_app/core/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDatasource;
  final LocalStorageService _localStorageService;

  AuthRepositoryImpl(
      {required AuthDataSource authDataSource,
      required LocalStorageService localStorageService})
      : _authDatasource = authDataSource,
        _localStorageService = localStorageService;

  @override
  Future<bool> signOut() async {
    await _localStorageService.clearCachedUser();
    return true;
  }

  @override
  Future<User> signIn(
      {required String username, required String password}) async {
    final userDTO =
        await _authDatasource.signIn(username: username, password: password);

    await _localStorageService.cacheUser(user: userDTO);
    
    final user = userDTO.toEntity();
    return user;
  }

  @override
  Future<bool> signUpEmployee(
      {required String employeeId,
      required String email,
      required String password}) {
    // TODO: implement signUpEmployee
    throw UnimplementedError();
  }
}
