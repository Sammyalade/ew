import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_eaze/messages/chat_page.dart';
import 'package:health_eaze/providers/user_provider.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:health_eaze/services/chat_service.dart';
import 'package:provider/provider.dart';
import '../models/doctor.dart';
import '../patient/book_an_appointment.dart';
import '../providers/patient_provider.dart';
import '../widgets/info_card.dart'; // Import the refactored InfoCard widget
import '../widgets/action_button.dart'; // Import the refactored ActionButton widget

class DoctorDetailPage extends StatelessWidget {
  final DoctorRequestModel doctor;

  const DoctorDetailPage({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '${doctor.userProfile.firstName} ${doctor.userProfile.lastName}',
        style: GoogleFonts.nunito(),
      )),
      body: ListView(
        padding: const  EdgeInsets.all(20.0),
        children: <Widget>[
          buildDoctorHeader(),
          const SizedBox(height: 20),
          buildDoctorInfoRow(),
          const SizedBox(height: 20),
          buildAboutSection(),
          const SizedBox(height: 15),
          buildCommunicationSection(context),
        ],
      ),
    );
  }

  Widget buildDoctorHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/doctor_avatar.png'),
        ),
        const SizedBox(height: 10),
        Text(
          '${doctor.userProfile.firstName} ${doctor.userProfile.lastName}',
          style: GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          doctor.specialty,
          style: GoogleFonts.nunito(fontSize: 18, color: Colors.grey),
        ),
      ],
    );
  }

  Widget buildDoctorInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InfoCard(
          value: '1000+',
          label: 'Patients',
          icon: Icons.people_outline_rounded,
          backgroundColor: Colors.blue[50],
          iconColor: Colors.blue,
        ),
        InfoCard(
          value: '10 Yrs',
          label: 'Experience',
          icon: Icons.verified,
          backgroundColor: Colors.pink[50],
          iconColor: Colors.pink,
        ),
        InfoCard(
          value: '${doctor.rating}',
          label: 'Rating',
          icon: Icons.star_border_outlined,
          backgroundColor: Colors.orange[50],
          iconColor: Colors.orange,
        ),
      ],
    );
  }

  Widget buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Doctor',
          style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          'Dr. ${doctor.userProfile.firstName} ${doctor.userProfile.lastName} is a top specialist. He has achieved several awards and recognition for his contribution and service in his field. He is available for private consultation.',
          style: GoogleFonts.nunito(fontSize: 16),
        ),
      ],
    );
  }

  Widget buildCommunicationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Communication',
          style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        ActionButton(
          icon: Icons.calendar_month_rounded,
          label: 'Book Appointment',
          content: 'Schedule an appointment',
          backgroundColor: Colors.orange[100],
          iconColor: Colors.orange,
          action: () {
           Navigator.push(
  context,
  MaterialPageRoute(
   builder: (context) => BookAnAppointment(doctor: doctor),
  ),
);

          },
        ),
        const SizedBox(height: 10),
        ActionButton(
          icon: Icons.message,
          label: 'Messaging',
          content: 'Chat me up, share photos',
          backgroundColor: Colors.pink[50],
          iconColor: Colors.pink,
          action: () {
            final patientProvider =
                Provider.of<PatientProvider>(context, listen: false);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  patientId: patientProvider.patient.user.id.toString(),
                  doctorId: doctor.userProfile.id.toString(),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        ActionButton(
          icon: Icons.phone,
          label: 'Audio Call',
          content: 'Call your doctor directly',
          backgroundColor: Colors.blue[100],
          iconColor: Colors.blue,
          action: () {
            // Handle Audio Call
          },
        ),
        const SizedBox(height: 10),
        ActionButton(
          icon: Icons.videocam,
          label: 'Video Call',
          content: 'See your doctor live',
          backgroundColor: Colors.yellow[100],
          iconColor: Colors.yellow,
          action: () {
            // Handle Video Call
          },
        ),
      ],
    );
  }
}
