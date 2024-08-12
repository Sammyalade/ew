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
          )),
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "HealthEase",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 50.0),
                child: Text("data"),
              )
                
              
              
            ],
        ),
      ),
    );
  }
}