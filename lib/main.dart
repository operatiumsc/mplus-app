import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mplus_app/app/auth/domain/repositories/auth_repository.dart';
import 'package:mplus_app/app/auth/domain/usecases/refresh_auth_usecase.dart';
import 'package:mplus_app/app/auth/domain/usecases/sign_in_usecase.dart';
import 'package:mplus_app/app/auth/domain/usecases/sign_out_usecase.dart';
import 'package:mplus_app/app/auth/presentation/splash/splash_screen.dart';
import 'package:mplus_app/app/user/domain/repositories/user_repository.dart';
import 'package:mplus_app/injection.dart';
import 'package:mplus_app/app/home/presentation/providers/home_page_change_notifier.dart';
import 'package:mplus_app/app/home/presentation/pages/home_page.dart';
import 'package:mplus_app/app/auth/presentation/login/pages/signin_page.dart';
import 'package:mplus_app/app/auth/presentation/login/providers/signin_page_change_notifier.dart';
import 'package:mplus_app/utils/constants/colors.dart';
import 'package:mplus_app/utils/services/persistent_storage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PersistentStorage.init();
  setUpLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SignInPageChangeNotifier(
            refreshAuthUseCase: RefreshAuthUseCase(
              authRepository: service.get<AuthRepository>(),
              userRepository: service.get<UserRepository>(),
            ),
            signInUseCase: SignInUseCase(
              authRepository: service.get<AuthRepository>(),
              userRepository: service.get<UserRepository>(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => HomePageChangeNotifier(
            signOutUseCase: SignOutUseCase(
              authRepository: service.get<AuthRepository>(),
            ),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SignInPageChangeNotifier>().init();
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
            statusBarColor: Colors.transparent,
          ),
        ),
        primaryColor: AppColors.royalBlue,
        textTheme: GoogleFonts.notoSansThaiTextTheme(),
      ),
      home: Consumer<SignInPageChangeNotifier>(
        builder: (_, notifier, __) {
          if (notifier.authStatus == AuthStatus.authenticating) {
            return const SplashScreen();
          } else if (notifier.authStatus == AuthStatus.authenticated) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
