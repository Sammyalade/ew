import 'package:flutter/material.dart';
import 'package:health_eaze/services/login_api_service.dart';
import 'package:health_eaze/utils/utilities.dart';
import 'package:health_eaze/utils/utils.dart'; // Import your color utilities

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        labelText: 'email/phone number',
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

  Future<void> handleSignIn(BuildContext context) async{
    final emailOrPhoneNumber = emailController.text.trim();
    final password = passwordController.text.trim();

    if(emailOrPhoneNumber.isEmpty|| password.isEmpty){
      showError('Please enter email and password');
      return;
    }
    try{
      final response = await loginApiService.login(emailOrPhoneNumber, password);

      final token = response['token'];
      final role = response['role'];

      if(token != null){
        if(context.mounted){
          navigateBasedOnRole(role, context);
        }
        
      }else{
        showError('Invalid credentials');
      }

    }catch(e){
      if (e.toString().contains('401')) {
        showError('Invalid credentials. Please check your email/phone number and password.');
    } else {
        showError('Invalid login credentials');
    }    }
  }

   void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void navigateBasedOnRole(String role, BuildContext context){
     final routeName = {
      'patient': '/patient_dashboard',
      'doctor': '/doctor_dashboard',
      'pharmacy': '/pharm_dashboard',
      'lab': '/lab_dashboard',
    }[role];

    if (routeName != null) {
      Navigator.pushReplacementNamed(context, routeName);
    } else {
      showError('Unknown role: $role');
    }
  }
}
