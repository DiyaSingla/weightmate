import 'package:flutter/material.dart';
import 'package:weightmate/screens/splash_screen.dart';
import 'package:weightmate/utils/colors.dart';
import 'services/notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weight Mate',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: primaryColor, foregroundColor: Colors.white),
          colorSchemeSeed: primaryColor,
          useMaterial3: true),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
