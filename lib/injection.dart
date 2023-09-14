import 'package:get_it/get_it.dart';
import 'package:mplus_app/app/auth/data/data_sources/auth_data_source.dart';
import 'package:mplus_app/app/auth/data/repositories/auth_repository_impl.dart';
import 'package:mplus_app/app/auth/domain/repositories/auth_repository.dart';
import 'package:mplus_app/app/auth/domain/usecases/refresh_auth_usecase.dart';
import 'package:mplus_app/app/invoices/data/data_sources/invoice_data_source.dart';
import 'package:mplus_app/app/invoices/data/repositories/invoice_repository_impl.dart';
import 'package:mplus_app/app/invoices/domain/repositories/invoice_repository.dart';
import 'package:mplus_app/app/orders/data/data_sources/purchase_orders_data_source.dart';
import 'package:mplus_app/app/orders/data/repositories/purchase_orders_repository_impl.dart';
import 'package:mplus_app/app/orders/domain/repositories/purchase_orders_repository.dart';
import 'package:mplus_app/app/user/data/data_sources/local_user_data_source.dart';
import 'package:mplus_app/app/user/data/data_sources/remote_iser_data_source.dart';
import 'package:mplus_app/app/user/data/repositories/user_repository_impl.dart';
import 'package:mplus_app/app/user/domain/repositories/user_repository.dart';
import 'package:mplus_app/app/user/domain/usecases/get_cached_user_usecase.dart';

final service = GetIt.instance;

void setUpLocator() {
  // Repositories
  service.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      localUserDataSource: LocalUserDataSourceImpl(),
      authDataSource: AuthDataSourceImpl(),
    ),
  );
  service.registerLazySingleton<InvoiceRepository>(
    () => InvoiceRepositoryImpl(
      invoiceDataSource: InvoiceDataSourceImpl(),
    ),
  );
  service.registerLazySingleton<PurchaseOrdersRepository>(
    () => PurchaseOrdersRepositoryImpl(
      purchaseOrdersDataSource: PurchaseOrdersDataSourceImpl(),
    ),
  );
  service.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      localUserDataSource: LocalUserDataSourceImpl(),
      remoteUserDataSource: RemoteUserDataSourceImpl(),
    ),
  );

  // Use cases
  service.registerSingleton<GetCachedUserUseCase>(
    GetCachedUserUseCase(
      userRepository: service.get<UserRepository>(),
    ),
  );
  service.registerLazySingleton<RefreshAuthUseCase>(
    () => RefreshAuthUseCase(
      authRepository: service.get<AuthRepository>(),
      userRepository: service.get<UserRepository>(),
    ),
  );
}
