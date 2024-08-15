import 'package:flutter/material.dart';
import 'package:health_eaze/onboarding_screen.dart';
import 'package:health_eaze/utilities.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  final String logo = 'images/logos/sus.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildLogo(),
              const SizedBox(height: 20,),
              buildBigText('Your everyday Doctor Appointment Medical app'),
              const SizedBox(height: 10,),
              buildSmallText('Book appointments, Talk to doctors, get list of pharmacies and labs near you with ease'),
              const SizedBox(height: 40,),
              buildLoginButton(context),
              const SizedBox(height: 20,),
              buildSignUpButton(context,)
            ],
          ),),
      ),
    );
  }


  Widget buildLogo(){
    return Image.asset(logo);
  }

  Widget buildBigText(String text){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: black,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildSmallText(String text){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: black,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildLoginButton(BuildContext context){
    return ElevatedButton(onPressed:(){ navigateToLoginPage(context);},
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(300, 60),
    )
    , child: const Text('Login', style: TextStyle(fontSize: 18),
    )
    );
  }

   Widget buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        navigateToOnboardingPage(context);
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 60), // Full-width button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: const Text(
        'Sign Up',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  void navigateToOnboardingPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OnboardingScreen()),
    );
  }

  void navigateToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DummyLoginPage()),
    );
  }

}

class DummyLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const Center(
        child: Text('SLogin Page'),
      ),
    );
  }

}
