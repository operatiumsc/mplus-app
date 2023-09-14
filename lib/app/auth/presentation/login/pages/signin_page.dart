import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mplus_app/app/auth/presentation/login/providers/signin_page_change_notifier.dart';
import 'package:mplus_app/app/home/presentation/pages/home_page.dart';
import 'package:mplus_app/app/auth/presentation/register/pages/register_page.dart';
import 'package:mplus_app/utils/constants/colors.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SignInPageChangeNotifier>().init();
    });

    final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
    final signInFormKey = GlobalKey<FormState>();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(16),
              child: Form(
                key: signInFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Sign in',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    _gap,
                    TextFormField(
                      controller: usernameController,
                      decoration: _inputDecoration.copyWith(
                        label: const Text('Username or email'),
                      ),
                      autofillHints: const [AutofillHints.newUsername],
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp('[a-zA-Z0-9._@]'),
                        ),
                        LengthLimitingTextInputFormatter(32),
                      ],
                    ),
                    _gap,
                    Consumer<SignInPageChangeNotifier>(
                      builder: (_, notifier, __) {
                        return TextFormField(
                          obscureText: !notifier.isVisiblePassword,
                          controller: passwordController,
                          decoration: _inputDecoration.copyWith(
                            label: const Text('Password'),
                            suffixIcon: IconButton(
                              icon: notifier.isVisiblePassword
                                  ? const Icon(FontAwesomeIcons.eye)
                                  : const Icon(FontAwesomeIcons.eyeSlash),
                              onPressed: () => notifier.toggleShowPassword(),
                            ),
                          ),
                          autofillHints: const [AutofillHints.newPassword],
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp('[a-zA-Z0-9!@#\$]'),
                            ),
                            LengthLimitingTextInputFormatter(32),
                          ],
                        );
                      },
                    ),
                    _gap,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox.adaptive(value: true, onChanged: (val) {}),
                            const Text('Remember me'),
                          ],
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text('Forgot password'))
                      ],
                    ),
                    _gap,
                    SizedBox(
                      width: double.infinity,
                      child: Consumer<SignInPageChangeNotifier>(
                        builder: (_, notifier, __) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.royalBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () async {
                            TextInput.finishAutofillContext();
                            await notifier.performSignIn(
                              formKey: signInFormKey,
                              username: usernameController.text,
                              password: passwordController.text,
                            );

                            if (context.mounted &&
                                notifier.authStatus ==
                                    AuthStatus.authenticated) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  CupertinoPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                  (route) => false);
                            }
                          },
                          child: notifier.authStatus ==
                                  AuthStatus.authenticating
                              ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator.adaptive(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  ),
                                )
                              : const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.login),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Sign in'),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                    _gap,
                    Consumer<SignInPageChangeNotifier>(
                      builder: (_, notifier, __) {
                        if (notifier.authStatus == AuthStatus.authenticating) {
                          return const Text('Signing In...');
                        } else if (notifier.authStatus == AuthStatus.failed) {
                          return const Text(
                            'Failed to sign in.',
                            style: TextStyle(color: Colors.red),
                          );
                        }

                        return const SizedBox();
                      },
                    ),
                    _gap,
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: 'Have no account yet? '),
                          TextSpan(
                            text: 'Register here.',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  CupertinoPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static final InputDecoration _inputDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    isDense: true,
  );

  static const _gap = SizedBox(
    height: 16,
    width: 16,
  );
}
