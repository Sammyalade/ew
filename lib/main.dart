import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:health_eaze/doctor/doctor_dashboard.dart';
import 'package:health_eaze/firebase_options.dart';
import 'package:health_eaze/models/doctor_login_model.dart';
import 'package:health_eaze/providers/doctor_model_provider.dart';
import 'package:health_eaze/providers/doctor_provider.dart';
import 'package:health_eaze/providers/user_model_provider.dart';
import 'package:health_eaze/providers/user_provider.dart';
import 'package:health_eaze/providers/patient_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:health_eaze/onboarding/splash_screen.dart';

import 'package:health_eaze/providers/patient_model_provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // if (FirebaseChatCore.instance == null) {
  //   print('FirebaseChatCore is not initialized');
  // }

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
          create: (context)=> DoctorLoginModelProvider(),
        ),
        ChangeNotifierProvider(
          create: (context)=> DoctorProvider(),
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
    print('UserProvider state: ${Provider.of<UserProvider>(context).user}');
    var user = const types.User(id: '3');
    return MaterialApp(
      title: 'Health Ease',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const SplashScreen(),
      home: DoctorDashboard(doctorLoginModel: DoctorLoginModel.defaultModel(),),
      // home: DoctorSpecialityChoices(),
      // home: PatientDashboard(patientLoginModel: PatientLoginModel.defaultModel(),),
      // home: AppointmentPage(),
    );
  }
}
