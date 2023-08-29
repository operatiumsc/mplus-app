import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

abstract class CachedService {
  Future init();
  Future setInt(String key, int value);
  Future setBool(String key, bool value);
  Future setDouble(String key, double value);
  Future setString(String key, String value);
  Future setListString(String key, List<String> value);
  int? getInt(String key);
  bool? getBool(String key);
  double? getDouble(String key);
  String? getString(String key);
  List<String>? getListString(String key);
  Future<bool> remove(String key);
}

class SharedPrefs implements CachedService {
  late SharedPreferences prefs;

  @override
  Future<SharedPreferences> init() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  @override
  Future setInt(String key, int value) async {
    await prefs.setInt(key, value);
  }

  @override
  Future setBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  @override
  Future setDouble(String key, double value) async {
    await prefs.setDouble(key, value);
  }

  @override
  Future setListString(String key, List<String> value) async {
    await prefs.setStringList(key, value);
  }

  @override
  Future setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  @override
  bool? getBool(String key) {
    return prefs.getBool(key);
  }

  @override
  double? getDouble(String key) {
    return prefs.getDouble(key);
  }

  @override
  int? getInt(String key) {
    return prefs.getInt(key);
  }

  @override
  List<String>? getListString(String key) {
    return prefs.getStringList(key);
  }

  @override
  String? getString(String key) {
    return prefs.getString(key);
  }

  @override
  Future<bool> remove(String key) async {
    await prefs.remove(key);
    return true;
  }
}
