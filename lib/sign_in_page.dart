import 'package:flutter/material.dart';
import 'package:health_eaze/utils.dart'; // Import your color utilities

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // "Hello there!" Text
            const Text(
              'Hello there!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),

            // Email/Phone number input
            TextField(
              decoration: InputDecoration(
                labelText: 'Email/Phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Password input with toggle visibility
            TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Sign In button
            ElevatedButton(
              onPressed: () {
                // Implement your sign-in logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: greenishColor, // Use your defined color
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // "Change Password" text button
            TextButton(
              onPressed: () {
                // Implement your change password logic here
              },
              child: const Text(
                'Change Password',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // // Fingerprint icon
            // Center(
            //   child: IconButton(
            //     icon: Icon(
            //       Icons.fingerprint,
            //       size: 60,
            //       color: greenishColor, // Use your defined color
            //     ),
            //     onPressed: () {
            //       // Implement fingerprint login logic here
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
