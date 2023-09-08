import 'dart:convert';

import 'package:mplus_app/core/user/data/models/user_model.dart';
import 'package:mplus_app/injection.dart';
import 'package:mplus_app/utils/constants/local_storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalUserDataSource {
  UserModel? getCachedUser();
  Future<bool> cacheUser({required UserModel user});
  Future<bool> clearCachedUser();
}

class LocalUserDataSourceImpl implements LocalUserDataSource {
  final _prefs = service.get<SharedPreferences>();

  @override
  Future<bool> cacheUser({required UserModel user}) async {
    final json = jsonEncode(user);
    final response = await _prefs.setString(LocalStorageKeys.user, json);
    return response;
  }

  @override
  Future<bool> clearCachedUser() async {
    final response = await _prefs.remove(LocalStorageKeys.user);
    return response;
  }

  @override
  UserModel? getCachedUser() {
    final data = _prefs.getString(LocalStorageKeys.user);

    if (data == null) {
      return null;
    }

    final json = jsonDecode(data);
    return UserModel.fromJson(json);
  }
}
