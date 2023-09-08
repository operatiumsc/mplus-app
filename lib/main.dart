import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mplus_app/core/auth/data/data_sources/auth_data_source.dart';
import 'package:mplus_app/core/auth/data/repositories/auth_repository_impl.dart';
import 'package:mplus_app/core/auth/domain/usecases/sign_in_usecase.dart';
import 'package:mplus_app/core/auth/domain/usecases/sign_out_usecase.dart';
import 'package:mplus_app/injection.dart';
import 'package:mplus_app/app/home/presentation/providers/Home_page_change_notifier.dart';
import 'package:mplus_app/app/home/presentation/pages/home_page.dart';
import 'package:mplus_app/app/login/presentation/pages/signin_page.dart';
import 'package:mplus_app/app/login/presentation/providers/signin_page_change_notifier.dart';
import 'package:provider/provider.dart';

import 'core/storage/data/data_source/local_storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setUpLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SignInPageChangeNotifier(
            signInUseCase: SignInUseCase(
              authRepository: AuthRepositoryImpl(
                authDataSource: AuthDataSourceImpl(),
                localStorageService: service.get<LocalStorageService>(),
              ),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => HomePageChangeNotifier(
            signOutUseCase: SignOutUseCase(
              authRepository: AuthRepositoryImpl(
                authDataSource: AuthDataSourceImpl(),
                localStorageService: service.get<LocalStorageService>(),
              ),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
          statusBarColor: Colors.transparent,
        )),
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.notoSansThaiTextTheme(),
      ),
      home: Consumer<SignInPageChangeNotifier>(
        builder: (_, notifier, __) {
          if (notifier.authStatus == AuthStatus.authenticated) {
            return const HomePage();
          }

          return const LoginPage();
        },
      ),
    );
  }
}
