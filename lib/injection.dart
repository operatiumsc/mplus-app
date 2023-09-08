import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mplus_app/core/storage/data/data_source/local_storage_service.dart';
import 'package:mplus_app/core/rest/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

final service = GetIt.instance;

Future<void> setUpLocator() async {
  service.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  await service.isReady<SharedPreferences>();

  service.registerSingleton<LocalStorageService>(LocalStorageServiceImpl(
      sharedPreferences: service.get<SharedPreferences>()));

  if (kDebugMode) {
    //await service.get<LocalStorageService>().clearCachedUser();
  }

  service.registerSingleton<Dio>(Client.config());
}
