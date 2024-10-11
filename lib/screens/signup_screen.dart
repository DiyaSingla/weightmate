import 'package:flutter/material.dart';
import 'package:weightmate/screens/home_screen.dart';
import 'package:weightmate/screens/signin_screen.dart';
import '../services/notification_service.dart';
import '../utils/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  TimeOfDay? _notificationTime;

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/logo2.png"),
            // Name Field
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

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

            // Notification Time Picker
            GestureDetector(
              onTap: () {
                selectNotificationTime(context);
              },
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: _notificationTime == null
                        ? 'Notification Time'
                        : 'Notification Time: ${_notificationTime!.format(context)}',
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Sign Up Button
            signInSignUpButton(context, false, () {
              NotificationService().scheduleNotification(_notificationTime!);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePage(
                            idx: 0,
                          )));
            }),
            const SizedBox(
              height: 10,
            ),

            switchPage(context, false, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignInPage()));
            })
          ],
        ),
      ),
    );
  }

  Future<void> selectNotificationTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _notificationTime) {
      setState(() {
        _notificationTime = picked;
      });
    }
  }
}
