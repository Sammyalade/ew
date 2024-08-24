import 'package:flutter/material.dart';
import 'package:health_eaze/patient/book_an_appointment.dart';

class HomeScreen extends StatelessWidget {
  final String patientName;
  final String logo = 'images/logos/sus.png';
  
  const HomeScreen({super.key, required this.patientName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          buildLogo(),
          const SizedBox(height: 20),
          buildGreetingText(),
        ],
      ),
    );
  }

  Widget buildLogo(){
     return Image.asset(logo, height: 100,);
  }

  Widget buildGreetingText(){
    return Text('Hey, $patientName!',
     style: const TextStyle(
      fontSize: 24, 
      fontWeight: FontWeight.bold),
    );
  }

  Widget buildAppointmentSection(BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context)=> const BookAnAppointment(),
          ),
        );
      },
    );
  }
}