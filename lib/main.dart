import 'package:flutter/material.dart';
import 'package:health_eaze/doctor_sign_up.dart';
import 'package:health_eaze/sign_in_page.dart';
import 'package:health_eaze/sign_up_page.dart';
import 'package:health_eaze/splash_screen.dart';
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
