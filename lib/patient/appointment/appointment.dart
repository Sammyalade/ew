import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_eaze/doctor/doctor_list.dart';
import 'package:health_eaze/widgets/doctor_specialties.dart';
import 'package:health_eaze/widgets/specialty_select.dart';

class AppointmentPage extends StatelessWidget {
        
  const AppointmentPage({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            buildReasonTitle(),
            const SizedBox(height: 10),
            buildReasonGrid(context),
            const SizedBox(height: 20),
            buildEmergencyNotice(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Abstracted AppBar
  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'Book an Appointment',
        style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w800),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    );
  }

  Widget buildReasonTitle() {
    return Text(
      "What’s the main reason for your appointment?",
      style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }


  void navigateToNextPage(BuildContext context, String specialty) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorListingPage(specialty: specialty),
      ),
    );
  }

  Widget buildReasonGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        buildReasonCard(
          "New Health Concern",
          "Find a Doctor",
          Colors.red[100],
              () => navigateToNextPage(context, 'Family Medicine'),
        ),
        buildReasonCard(
          "Routine checkup, Follow-up or Screening",
          "Find a Doctor",
          Colors.blue[100],
              () => navigateToNextPage(context, 'Family Medicine'),
        ),
        buildReasonCard(
          "Existing or Chronic condition",
          "Talk to a Specialist",
          Colors.green[100],
              () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SpecialtySelect(
                  title: 'Doctors Specialties',
                  instruction: 'Select the specialty of the doctor you would like to book',
                  specialties: specialtyChoices,
                  onSelectSpecialty: (specialty) => navigateToNextPage(context, specialty),
                ),
              ),
            );
          },
        ),
        buildReasonCard(
          "Prescriptions or Refills",
          "Talk to a Pharmacist",
          Colors.purple[100],
              () {},
        ),
        buildReasonCard(
          "General Mental Health Concerns",
          "Find a Doctor",
          Colors.blue[200],
              () => navigateToNextPage(context, 'Psychiatry'),
        ),
        buildReasonCard(
          "COVID-19 Symptoms",
          "Find a Doctor",
          Colors.yellow[100],
              () => navigateToNextPage(context, 'Emergency Medicine'),
        ),
        buildReasonCard(
          "Sex Health Education",
          "Find a Doctor",
          Colors.pink[100],
              () => navigateToNextPage(context, 'Obstetrics and Gynaecology'),
        ),
        buildReasonCard(
          "Other Medical Reasons",
          "Find a Doctor",
          Colors.grey[200],
              () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DoctorListingPage()),
          ),
        ),
      ],
    );
  }

  Widget buildReasonCard(
      String title, String subtitle, Color? color, Function() nextPage) {
    return GestureDetector(
      onTap: nextPage,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.nunito(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                subtitle,
                style: GoogleFonts.nunito(fontSize: 14, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildEmergencyNotice() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "For medical emergencies, please call 112 (or your local emergency number) or go to the nearest emergency hospital.",
          textAlign: TextAlign.center,
          style: GoogleFonts.sora(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
