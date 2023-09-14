import 'package:flutter/material.dart';
import 'package:mplus_app/utils/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: const Center(
          child: Text(
            'Authenticating',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
