import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_eaze/utils/utils.dart';

class OTPVerificationPage extends StatelessWidget {
  final String phoneNumber;

  const OTPVerificationPage({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Instruction Text
            Text(
              'Enter the OTP sent to $phoneNumber',
              style: const TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // OTP Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOTPField(context),
                _buildOTPField(context),
                _buildOTPField(context),
                _buildOTPField(context),
                _buildOTPField(context),
                _buildOTPField(context),
              ],
            ),
            const SizedBox(height: 20),

            // Verify Button
            ElevatedButton(
              onPressed: () {
                // Implement OTP verification logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: greenishColor,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text(
                'Verify OTP',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),

            // Resend OTP option
            TextButton(
              onPressed: () {
                // Implement resend OTP logic here
              },
              child: const Text(
                'Resend OTP',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each OTP field
  Widget _buildOTPField(BuildContext context) {
    return SizedBox(
      width: 40,
      child: TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: greyishColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: greenishColor),
          ),
        ),
      ),
    );
  }
}
