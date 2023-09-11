import 'dart:convert';

import 'package:mplus_app/app/user/data/models/user_model.dart';
import 'package:mplus_app/utils/helpers/exception.dart';
import 'package:mplus_app/injection.dart';
import 'package:mplus_app/utils/constants/local_storage_keys.dart';
import 'package:mplus_app/utils/services/persistent_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalUserDataSource {
  UserModel getCachedUser();
  Future<bool> cacheUser({required UserModel user});
  Future<bool> clearCachedUser();
}

class LocalUserDataSourceImpl implements LocalUserDataSource {
  final _storage = PersistentStorage.instance;

  @override
  Future<bool> cacheUser({required UserModel user}) async {
    final json = jsonEncode(user);
    final response = await _storage.setString(LocalStorageKeys.user, json);
    return response;
  }

  @override
  Future<bool> clearCachedUser() async {
    final response = await _storage.remove(LocalStorageKeys.user);
    return response;
  }

  @override
  UserModel getCachedUser() {
    final data = _storage.getString(LocalStorageKeys.user);

    if (data == null) {
      throw UserNotFoundException();
    }

    final json = jsonDecode(data);
    return UserModel.fromJson(json);
  }
}
