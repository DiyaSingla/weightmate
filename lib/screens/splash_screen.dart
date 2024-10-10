import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weightmate/screens/signin_screen.dart';
import 'package:weightmate/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3), // Duration of the splash screen
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const SignInPage(),
          ),
        );
      },
    );

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
