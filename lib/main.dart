import 'package:flutter/material.dart';
import 'package:health_eaze/onboarding/splash_screen.dart';
import 'package:health_eaze/patient/appointment.dart';
import 'package:health_eaze/patient/patient_dashboard.dart';

import 'doctor/doctor_list.dart';
import 'doctor/doctor_sign_up.dart';
import 'models/patient.dart';

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
      // home:  const SplashScreen(),
      // home: DoctorListingPage()
      // home: DoctorSpecialityChoices(),
      // home: PatientDashboard(patientLoginModel: PatientLoginModel.defaultModel(),),
      home: AppointmentPage(),
    );
  }
}
