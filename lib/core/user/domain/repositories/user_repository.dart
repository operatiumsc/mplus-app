import 'package:mplus_app/core/user/domain/entities/user.dart';

abstract class UserRepository {
  /// Get user from remote data source.
  Future<User> getUser();

  User? getCachedUser();
  Future<bool> cachedUser({required User user});
  Future<bool> clearCachedUser();
}
