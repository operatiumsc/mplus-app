import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mplus_app/data/data_sources/remote/auth_data_source.dart';
import 'package:mplus_app/data/repositories/auth_repository_impl.dart';
import 'package:mplus_app/domain/usecases/auth/sign_in_usecase.dart';
import 'package:mplus_app/domain/usecases/auth/sign_out_usecase.dart';
import 'package:mplus_app/injection.dart';
import 'package:mplus_app/presentation/pages/home/Home_page_change_notifier.dart';
import 'package:mplus_app/presentation/pages/home/home_page.dart';
import 'package:mplus_app/presentation/pages/signin/signin_page.dart';
import 'package:mplus_app/presentation/pages/signin/signin_page_change_notifier.dart';
import 'package:provider/provider.dart';

import 'data/data_sources/local/local_storage_service.dart';

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
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.interTextTheme(),
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
