import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health_eaze/onboarding/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBe8FP0uby1LMcT5E4ObpdYrOzY6PoZ8vo",
      appId: "1:915505110368:web:5b3fad0541fcdafdafd205",
      messagingSenderId: "915505110368",
      projectId: "health-ease-ae456",
      authDomain: "health-ease-ae456.firebaseapp.com",
      storageBucket: "health-ease-ae456.appspot.com",
      measurementId: "G-K64J56WPJ1"
    )
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
      //home:  const ChatScreen(chatRoomId: 'exampleChatRoomId'),
      //routes: {
        //'/chat': (context) => const ChatScreen(chatRoomId: 'exampleChatRoomId'),
      //},    
      
    );
  }
}
