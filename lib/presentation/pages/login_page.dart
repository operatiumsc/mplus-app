import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mplus_app/presentation/pages/home_page.dart';
import 'package:mplus_app/presentation/pages/register_page.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            width: 400,
            padding: EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sign in',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  _gap,
                  TextFormField(
                    decoration:
                        InputDecoration(label: Text('Username or email')),
                  ),
                  _gap,
                  TextFormField(
                    decoration: InputDecoration(label: Text('Password')),
                  ),
                  _gap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox.adaptive(value: true, onChanged: (val) {}),
                          Text('Remember me'),
                        ],
                      ),
                      TextButton(
                          onPressed: () {}, child: Text('Forgot password'))
                    ],
                  ),
                  _gap,
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              CupertinoPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        icon: Icon(Icons.login),
                        label: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Sign in',
                          ),
                        ),
                      )),
                  _gap,
                  Text.rich(TextSpan(children: [
                    TextSpan(text: 'Have no account yet? '),
                    TextSpan(
                        text: 'Register here.',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) => RegisterPage()));
                          })
                  ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static const _gap = SizedBox(
    height: 16,
    width: 16,
  );
}
