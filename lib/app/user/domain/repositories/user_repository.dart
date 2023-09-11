import 'package:mplus_app/app/user/domain/entities/user.dart';

abstract class UserRepository {
  /// Get user from remote data source.
  Future<User> getRemoteUser();

  User getCachedUser();
  Future<bool> cachedUser({required User user});
  Future<bool> clearCachedUser();
}
