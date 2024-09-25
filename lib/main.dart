import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:health_eaze/firebase_options.dart';
import 'package:health_eaze/messages/chat_page.dart';
import 'package:health_eaze/providers/appointment_provider.dart';
import 'package:health_eaze/providers/booked_doctor.dart';
import 'package:health_eaze/providers/user_model_provider.dart';
import 'package:health_eaze/providers/user_provider.dart';
import 'package:health_eaze/providers/patient_provider.dart';
import 'package:provider/provider.dart';
import 'package:health_eaze/onboarding/splash_screen.dart';

import 'package:health_eaze/providers/patient_model_provider.dart';
import 'package:provider/provider.dart';
import 'package:health_eaze/patient/appointment/appointment.dart';
import 'package:health_eaze/patient/home.dart';
import 'package:health_eaze/patient/patient_dashboard.dart';

import 'models/patient.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PatientProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserModelProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PatientLoginModelProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookedDoctorProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppointmentProvider(),
        )
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
        // home: const SplashScreen(),
        // home: DoctorListingPage()
        // home: DoctorSpecialityChoices(),
        // home: PatientDashboard(patientLoginModel: PatientLoginModel.defaultModel(),),
        // home: AppointmentPage(),
        home: HomeScreen(
            patientName: 'Moh',
            patientLoginModel: PatientLoginModel.defaultModel()));
  }
}
