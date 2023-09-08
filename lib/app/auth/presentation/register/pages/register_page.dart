import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mplus_app/utils/constants/colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.navyBlue,
            AppColors.royalBlue,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: 400,
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
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            label: const Text('Employee ID'),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(12),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                        _gap,
                        TextFormField(
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            label: const Text('Work email'),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(36),
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z0-9_.@]')),
                          ],
                        ),
                        _gap,
                        RichText(
                          text: TextSpan(
                            style:
                                GoogleFonts.notoSansThai(color: Colors.black87),
                            children: [
                              const TextSpan(
                                  text:
                                      'By creating an account, you agree to '),
                              TextSpan(
                                text: 'Terms of Service',
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer(),
                              ),
                              const TextSpan(
                                  text:
                                      ' . For more information about Borneo Technical (Thailand) Limited\'s privacy practices, see the '),
                              TextSpan(
                                text: 'Privacy Statement',
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer(),
                              ),
                              const TextSpan(
                                  text:
                                      ' We\'ll occasionally send you account-related emails.'),
                            ],
                          ),
                        ),
                        _gap,
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor: AppColors.royalBlue,
                            ),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Submit',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
