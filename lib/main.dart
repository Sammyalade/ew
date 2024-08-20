import 'package:flutter/material.dart';
import 'package:health_eaze/screens/introduction_pages/sign_up_page/doctor_sign_up.dart';
import 'package:health_eaze/screens/introduction_pages/login_page/sign_in_page.dart';
import 'package:health_eaze/screens/introduction_pages/sign_up_page/sign_up_page.dart';
import 'package:health_eaze/screens/introduction_pages/welcome_page/splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Ease',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const SplashScreen(),
    );
  }
}
