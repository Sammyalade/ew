import 'package:flutter/material.dart';
import 'package:health_eaze/doctor/doctor_sign_up.dart';
import 'package:health_eaze/patient/book_an_appointment.dart';
import 'package:health_eaze/patient/patient_dashboard.dart';
import 'package:health_eaze/widgets/sign_in_page.dart';
import 'package:health_eaze/widgets/sign_up_page.dart';
import 'package:health_eaze/onboarding/splash_screen.dart';
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
