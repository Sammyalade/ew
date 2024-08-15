import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health_eaze/onboarding_screen.dart';
import 'package:health_eaze/welcome_screen.dart';
import 'utilities.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this, 
      duration: const Duration(seconds: 5),
      );

    _controller.forward().whenComplete((){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=> const WelcomeScreen()),
      );
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 7), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const OnboardingScreen()),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
            primaryColorBlue,
            black
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft
          )
        ),
          
        child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2)
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "HealthEase",
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                     Padding(padding: EdgeInsets.only(bottom: 50.0),
                      child: Text(
                        "Bringing health closer to you",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )             
                    )
                  ],
                ),
              ),
            ],
        ),
      ),
    );
  }
}