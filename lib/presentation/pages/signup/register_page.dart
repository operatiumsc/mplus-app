import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RegisterPage extends HookWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                    'Registration',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  _gap,
                  TextFormField(
                    decoration: InputDecoration(label: Text('Employee ID')),
                  ),
                  _gap,
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Submit',
                          ),
                        ),
                      )),
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
