import 'package:flutter/material.dart';
import 'package:health_eaze/doctor/doctor_dashboard.dart';
import 'package:health_eaze/lab/lab_dashboard.dart';
import 'package:health_eaze/models/patient.dart';
import 'package:health_eaze/models/doctor_model.dart';
import 'package:health_eaze/patient/patient_dashboard.dart';
import 'package:health_eaze/pharmacy/pharm_dashboard.dart';
import 'package:health_eaze/services/login_api_service.dart';
import 'package:health_eaze/utils/utilities.dart';
import 'dart:convert';
// Import your color utilities

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginApiService loginApiService = LoginApiService();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildWelcomeText(),
              const SizedBox(height: 40,),
              buildEmailField(),
              const SizedBox(height: 20,),
              buildPasswordField(),
              const SizedBox(height: 20,),
              buildSignInButton(),
              const SizedBox(height: 20,),
              buildChangePasswordButton(),
              const SizedBox(height: 20,),

            ],
          ),
        )
      )
    );
  }

  Widget buildWelcomeText(){
    return const Text(
      'Hello there!',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildEmailField(){
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
    );
  }

  Widget buildPasswordField(){
    return TextField(
      controller: passwordController,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          onPressed: togglePasswordVisibility,
          icon: Icon(
            obscureText? Icons.visibility_off: Icons.visibility,
          )
        )
      ),
    );
  }

   Widget buildChangePasswordButton() {
    return TextButton(
      onPressed: () {
        // Implement your change password logic here
      },
      child: const Text(
        'Change Password',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  void togglePasswordVisibility(){
    setState(() {
      obscureText = !obscureText;
    });
  }

  Widget buildSignInButton(){
    return ElevatedButton(
      onPressed: ()=> handleSignIn(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColorBlue,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
      child: const Text(
        'Sign In',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      )
    );
  }

  Future<void> handleSignIn(BuildContext context) async {
  final email = emailController.text.trim();
  final password = passwordController.text.trim();
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  if (email.isEmpty || password.isEmpty) {
    showError('Please enter email and password');
    return;
  }

  if (!emailRegex.hasMatch(email)) {
    showError('Please enter a valid email address');
    return;
  }

  print("This is working here");
  try {
    final response = await loginApiService.login(email, password);
    print("This is working here");
    if (response.statusCode == 200) {
      print(response);
      validateAndNavigate(context, response.body); // Call the validation method
    } else {
      print(response);
      showError('Login failed with status: ${response.statusCode}');
    }

  } catch (e) {
    if (e.toString().contains('401')) {
      print(e);
      showError('Invalid credentials. Please check your email/phone number and password.');
    } else {
      showError('An unexpected error occurred during login');
    }
  }
}

void validateAndNavigate(BuildContext context, String responseBody) {
  try {
    final loginModel = PatientLoginModel.fromJson(jsonDecode(responseBody));
    print('Parsed login model: $loginModel');

    if (loginModel is PatientLoginModel) {
      navigateToDashboard(context, loginModel);
    } else if (loginModel is DoctorLoginModel) {
      navigateToDashboard(context, loginModel);
    } else {
      showError('Invalid role received');
    }

  } catch (e) {
    print('Error parsing login model: $e');
    showError('Error processing login data. Please try again.');
  }
}

   void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void navigateToDashboard(BuildContext context, dynamic model) {
    Widget nextScreen;

   if (model is PatientLoginModel) {
      nextScreen = PatientDashboard(patientLoginModel: model);
    } else if (model is DoctorLoginModel) {
      nextScreen = DoctorDashboard(doctorLoginModel: model);
    } else {
      showError('Unknown model type');
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

   
  
}
