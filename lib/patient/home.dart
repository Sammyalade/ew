
import 'package:flutter/material.dart';
import 'package:health_eaze/lab/lab_listing.dart';
import 'package:health_eaze/models/patient.dart';
import 'package:health_eaze/patient/appointment.dart';
import 'package:health_eaze/patient/upcoming_appointments.dart';
import 'package:health_eaze/pharmacy/pharmacyListing.dart';
import 'package:health_eaze/providers/patient_model_provider.dart';
import 'package:health_eaze/utils/utilities.dart';
import 'package:provider/provider.dart';
import '../doctor/doctor_list.dart';

class HomeScreen extends StatelessWidget {
  final String patientName;
  final PatientLoginModel patientLoginModel;
  final String logo = 'asset/images/logos/sus2.png';
  
  const HomeScreen({super.key, required this.patientName, required this.patientLoginModel});



 @override
Widget build(BuildContext context) {
  final patientLoginModel = Provider.of<PatientLoginModelProvider>(context).patientLoginModel;
  return Scaffold(
    backgroundColor: Colors.white.withOpacity(0.9),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          buildHeader(patientLoginModel.user.firstName),
          const SizedBox(height: 20,),
          buildAppointmentSection(context),
          const SizedBox(height: 20,),
          buildTalkToDoctorSection(context),
          const SizedBox(height: 20,),
          buildLocatePharmacySection(context),
          const SizedBox(height: 20,),
          buildBookLabSection(context),
        ],
      ),
    ),
  );
}


    Widget buildHeader(String patientName){
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
      onTap: () => _navigateTo(context, const AppointmentPage()),
      child: _buildBookAppointmentContainer(context, 'Book an Appointment', Icons.calendar_today) ,
    );
  }
  Widget _buildBookAppointmentContainer(BuildContext context, String text, IconData icon){
    return Container(
      width: MediaQuery.of(context).size.width -40,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: _buildContainerDecoration(pastelBlue),
      child: _buildContainerContent(text, icon, pastelBlue),
    );
  }


Widget buildTalkToDoctorSection(BuildContext context,) {
  return GestureDetector(
    onTap: () => _navigateTo(context, const DoctorListingPage()),
    child: _buildTalkToDoctorContainer(context, 'Talk to a Doctor', Icons.person_outline),
  );
}

Widget _buildTalkToDoctorContainer(BuildContext context, String text, IconData icon) {
  return Container(
    width: MediaQuery.of(context).size.width - 40,
    height: 100,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.all(16),
    decoration: _buildContainerDecoration(pastelPink ),
    child: _buildContainerContent(text, icon, pastelPink),
  );
}

Widget buildLocatePharmacySection(BuildContext context){
  return GestureDetector(
    onTap: ()=> _navigateTo(context, const PharmacyListing()),
    child: _buildLocatePharmacyContainer(context,'Locate a Pharmacy', Icons.medication_liquid_sharp ),
  );
}
Widget _buildLocatePharmacyContainer(BuildContext context, String text, IconData icon){
  return Container(
    width: MediaQuery.of(context).size.width - 40,
    height: 100,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.all(16),
    decoration: _buildContainerDecoration(pastelPurple ),
    child: _buildContainerContent(text, icon, pastelPurple),
  );
}
Widget buildBookLabSection(BuildContext context){
  return GestureDetector(
    onTap: ()=> _navigateTo(context, const LabListing()),
    child: _buildBookLabContainer(context,'Book a lab session', Icons.biotech_outlined),
  );
}
Widget _buildBookLabContainer(BuildContext context, String text, IconData icon){
  return Container(
    width: MediaQuery.of(context).size.width - 40,
    height: 100,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.all(16),
    decoration: _buildContainerDecoration(pastelGreen ),
    child: _buildContainerContent(text, icon, pastelGreen),
  );
}

Widget _buildContainerContent(String text, IconData icon, Color iconColor) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: iconColor,
        size: 30,
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: black,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      const Icon(
        Icons.arrow_forward_ios,
        color: black,
        size: 24,
      ),
    ],
  );
}

BoxDecoration _buildContainerDecoration(Color borderColor) {
  return BoxDecoration(
    color: Colors.white.withOpacity(0.7),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: borderColor, width: 2),
    boxShadow: [
      BoxShadow(
        color: borderColor.withOpacity(0.1),
        spreadRadius: 4,
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );
}

Widget upcomingAppointments(BuildContext context){
  return GestureDetector(
    onTap: () => _navigateTo(context, const UpcomingAppointments()),
    child: _buildUpcomingAppointmentContainer(context, '', '', Icons.calendar_month),
  );
}

Widget _buildUpcomingAppointmentContainer(BuildContext context, String bigText, String smallText, IconData icon){
  return Container(
    width: MediaQuery.of(context).size.width - 40,
    height: 100,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.all(16),
    decoration: _buildContainerDecoration(pastelGreen ),
    child: _buildUpcomingAppointmentsContainerContent(bigText, smallText, icon, pastelGreen),
  );
}

Widget  _buildUpcomingAppointmentsContainerContent (String bigText, String smallText, IconData icon, Color iconColor){
  return const Row(

  );
}

void _navigateTo(BuildContext context, Widget page ) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}


}