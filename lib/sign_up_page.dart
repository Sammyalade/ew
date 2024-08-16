// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_eaze/address_form.dart';
import 'package:health_eaze/doctor_sign_up.dart';
import 'package:health_eaze/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  Container slider(Color? sliderColor) {
    return Container(
        height: 4,
        width: 100,
        decoration: BoxDecoration(
          color: sliderColor,
          borderRadius: BorderRadius.circular(2),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          'Sign Up',
          style: TextStyle(
              color: Color.fromARGB(255, 55, 59, 68),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  slider(const Color.fromARGB(255, 117, 192, 195)),
                  SizedBox(width: 5),
                  slider(const Color.fromARGB(255, 231, 246, 251))
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Complete your Profile",
                style: TextStyle(
                  color: Color.fromARGB(255, 55, 59, 68),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Don't worry, only you can see your personal info, no one else will be able to see it.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              inputTextField(Icon(Icons.person_outline), 'Full name'),
              SizedBox(height: 10),
              inputTextField(Icon(Icons.phone_outlined), 'Phone'),
              SizedBox(height: 10),
              inputTextField(Icon(Icons.favorite_outline), 'Gender'),
              SizedBox(height: 10),
              inputTextField(Icon(Icons.email_outlined), 'Email'),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "By tapping “Next”, you agree to our Terms & Conditions and Privacy Policy.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 117, 192, 195),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DoctorSpecialityChoices()));
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
