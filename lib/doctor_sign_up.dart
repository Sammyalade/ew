import 'package:flutter/material.dart';

class DoctorSignUp extends StatelessWidget {
  const DoctorSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text(
        'Doctor Sign Up',
        style: TextStyle(
          fontSize: 20,
          
        ),
      ),
      centerTitle: true,
    ));
  }
}
