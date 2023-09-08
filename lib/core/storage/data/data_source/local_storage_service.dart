import 'dart:convert';

import 'package:mplus_app/core/user/data/models/user_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageKey {
  static const String user = 'user';
}

abstract class LocalStorageService {
  Future<LocalStorageService> init();
  UserDTO? getUser();
  Future cacheUser({required UserDTO user});
  Future clearCachedUser();
}

class LocalStorageServiceImpl implements LocalStorageService {
  final SharedPreferences sharedPreferences;

  LocalStorageServiceImpl({required this.sharedPreferences});

  @override
  Future<LocalStorageService> init() async {
    // sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  @override
  UserDTO? getUser() {
    final data = sharedPreferences.getString(LocalStorageKey.user);

    if (data == null) {
      return null;
    }

    final json = jsonDecode(data);
    return UserDTO.fromJson(json);
  }

  @override
  Future<void> cacheUser({required UserDTO user}) async {
    final json = jsonEncode(user);
    await sharedPreferences.setString(LocalStorageKey.user, json);
  }

  @override
  Future clearCachedUser() async {
    await sharedPreferences.remove(LocalStorageKey.user);
  }
}
