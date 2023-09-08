import 'package:mplus_app/app/auth/data/data_sources/auth_data_source.dart';
import 'package:mplus_app/app/auth/domain/repositories/auth_repository.dart';
import 'package:mplus_app/core/user/data/data_sources/local_user_data_source.dart';
import 'package:mplus_app/core/user/data/models/user_model.dart';
import 'package:mplus_app/core/user/domain/entities/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDatasource;
  final LocalUserDataSource _localUserDataSource;

  AuthRepositoryImpl(
      {required AuthDataSource authDataSource,
      required LocalUserDataSource localUserDataSource})
      : _authDatasource = authDataSource,
        _localUserDataSource = localUserDataSource;

  @override
  Future<bool> signOut() async {
    await _localUserDataSource.clearCachedUser();
    return true;
  }

  @override
  Future<User> signIn(
      {required String username, required String password}) async {
    final userDTO =
        await _authDatasource.signIn(username: username, password: password);

    await _localUserDataSource.cacheUser(user: userDTO);

    final user = userDTO.toEntity();
    return user;
  }

  @override
  Future<bool> signUpEmployee(
      {required String employeeId, required String email}) {
    // TODO: implement signUpEmployee
    throw UnimplementedError();
  }
}
