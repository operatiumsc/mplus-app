import 'package:mplus_app/app/user/data/data_sources/local_user_data_source.dart';
import 'package:mplus_app/app/user/data/data_sources/remote_iser_data_source.dart';
import 'package:mplus_app/app/user/data/models/user_model.dart';
import 'package:mplus_app/app/user/domain/entities/user.dart';
import 'package:mplus_app/app/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final LocalUserDataSource _localUserDataSource;
  final RemoteUserDataSource _remoteUserDataSource;

  UserRepositoryImpl({
    required LocalUserDataSource localUserDataSource,
    required RemoteUserDataSource remoteUserDataSource,
  })  : _localUserDataSource = localUserDataSource,
        _remoteUserDataSource = remoteUserDataSource;

  @override
  Future<bool> cachedUser({required User user}) async {
    final response = await _localUserDataSource.cacheUser(user: user.toModel());
    return response;
  }

  @override
  Future<bool> clearCachedUser() async {
    final response = await _localUserDataSource.clearCachedUser();
    return response;
  }

  @override
  User getCachedUser() {
    final user = _localUserDataSource.getCachedUser();
    return user.toEntity();
  }

  @override
  Future<User> getRemoteUser() async {
    final user = await _remoteUserDataSource.getUser();
    return user.toEntity();
  }
}
