import 'package:flutter/material.dart';
import 'package:weightmate/utils/colors.dart';

Widget signInSignUpButton(
    BuildContext context, bool isSignIn, Function() onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      minimumSize: const Size(150, 50),
    ),
    child: Text(
      (isSignIn ? "Sign In" : "Sign Up"),
      style: const TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
  );
}

Row switchPage(BuildContext context, bool isSignIn, Function() onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text((isSignIn ? "Don't have an account? " : "Already have an account? "),
          style: const TextStyle(color: primaryColor)),
      GestureDetector(
        onTap: onTap,
        child: Text(
          (isSignIn ? "Sign Up" : "Sign In"),
          style:
              const TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
