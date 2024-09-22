import 'package:flutter/material.dart';
import 'package:health_eaze/onboarding/splash_screen.dart';

import 'package:health_eaze/providers/patient_model_provider.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
     MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PatientLoginModelProvider()
        ),
      ],
      child: const MyApp(),
    ),
  );
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
      // home: DoctorListingPage()
      // home: DoctorSpecialityChoices(),
      // home: PatientDashboard(patientLoginModel: PatientLoginModel.defaultModel(),),
      // home: AppointmentPage(),
    );
  }
}
