import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
            Color.fromRGBO(117, 192, 195, 1.0),
            Color.fromRGBO(55,59,68, 1.0)
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