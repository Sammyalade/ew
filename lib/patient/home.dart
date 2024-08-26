import 'package:flutter/material.dart';
import 'package:health_eaze/patient/book_an_appointment.dart';
import 'package:health_eaze/utils/utilities.dart';

class HomeScreen extends StatelessWidget {
  final String patientName;
  final String logo = 'images/logos/sus2.png';
  
  const HomeScreen({super.key, required this.patientName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          buildHeader(),
          const SizedBox(height: 20,),
          buildAppointmentSection(context)
        ],
      ),
    );
  }

    Widget buildHeader(){
     return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            logo,
            height: 50,),
          const SizedBox(width: 10,),
          Text('Hi $patientName!',
            style: const TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold,
              color: black
            ),
          )
        ],
      ),
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
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: primaryColorBlue,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: primaryColorBlue.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ]
        ),
         child: const  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today, 
              color: Colors.white,
              size: 30,
            ),
             SizedBox(width: 10), 
            Expanded(
              child: Text(
                'Book an Appointment',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
               size: 24,
            )
          ],
        ),
      ),
    );
  }
}