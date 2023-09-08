import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mplus_app/core/rest/client.dart';
import 'package:mplus_app/core/user/data/data_sources/local_user_data_source.dart';
import 'package:mplus_app/core/user/data/data_sources/remote_iser_data_source.dart';
import 'package:mplus_app/core/user/data/repositories/user_repository_impl.dart';
import 'package:mplus_app/core/user/domain/usecases/get_cached_user_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final service = GetIt.instance;

// Services
Future<void> setUpLocator() async {
  service.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  await service.isReady<SharedPreferences>();

  service.registerSingleton<Dio>(Client.config());

  // Use cases
  service.registerLazySingleton<GetCachedUserUseCase>(
    () => GetCachedUserUseCase(
      userRepository: UserRepositoryImpl(
        localUserDataSource: LocalUserDataSourceImpl(),
        remoteUserDataSource: RemoteUserDataSourceImpl(),
      ),
    ),
  );
}
