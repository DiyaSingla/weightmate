import 'package:flutter/material.dart';
import 'package:weightmate/screens/home_screen.dart';
import 'package:weightmate/screens/signup_screen.dart';
import 'package:weightmate/utils/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo2.png"),
            // Email Field
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            // Password Field
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),

            // Sign In Button
            signInSignUpButton(context, true, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePage(idx: 0)));
            }),

            const SizedBox(
              height: 10,
            ),

            switchPage(context, true, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()));
            })
          ],
        ),
      ),
    );
  }
}
