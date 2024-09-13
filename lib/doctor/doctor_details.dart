// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/doctor.dart';
import '../utils/navigation_bar.dart';

class DoctorDetailPage extends StatelessWidget {
  final Doctor doctor;

  DoctorDetailPage({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${doctor.userProfile.firstName} ${doctor.userProfile.lastName}',
        ),
      ),
      // bottomNavigationBar: buildBottomNavigationBar(0, (index) {
        // Handle navigation in DoctorDetailPage
      // }),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          buildDoctorHeader(),
          SizedBox(height: 20),
          buildDoctorInfoRow(),
          SizedBox(height: 20),
          buildAboutSection(),
          SizedBox(height: 15),
          buildCommunicationSection(),
        ],
      ),
    );
  }

  Widget buildDoctorHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/doctor_avatar.png'),
          // Placeholder for avatar image
        ),
        SizedBox(height: 10),
        Text(
          '${doctor.userProfile.firstName} ${doctor.userProfile.lastName}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          doctor.specialty,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ],
    );
  }

  Widget buildDoctorInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildInfoCard(
            '1000+', 'Patients', Icons.people_outline_rounded,
            Colors.blue[50], Colors.blue),
        buildInfoCard('10 Yrs', 'Experience', Icons.verified,
            Colors.pink[50], Colors.pink),
        buildInfoCard(
            '${doctor.rating}', 'Rating', Icons.star_border_outlined,
            Colors.orange[50], Colors.orange),
      ],
    );
  }

  Widget buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Doctor',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Dr. ${doctor.userProfile.firstName} ${doctor.userProfile.lastName} is a top specialist. He has achieved several awards and recognition for his contribution and service in his field. He is available for private consultation.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget buildCommunicationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Communication',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        buildActionButtons(),
      ],
    );
  }

  Widget buildActionButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildActionButton(Icons.message, 'Messaging', 'Chat me up, share photos', Colors.pink[50], Colors.pink),
        SizedBox(height: 10),
        buildActionButton(Icons.phone, 'Audio Call', 'Call your doctor directly', Colors.blue[100], Colors.blue),
        SizedBox(height: 10),
        buildActionButton(Icons.videocam, 'Video Call', 'See your doctor live', Colors.amber[50], Colors.amber[400]),
      ],
    );
  }

  Widget buildInfoCard(String value, String label, IconData icon, Color? backgroundColor, Color iconColor) {
    return Container(
      decoration: buildCardDecoration(),
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildCardIcon(icon, backgroundColor, iconColor),
          SizedBox(height: 10),
          buildCardValueText(value),
          SizedBox(height: 5),
          buildCardLabelText(label),
        ],
      ),
    );
  }

  BoxDecoration buildCardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    );
  }

  Widget buildCardIcon(IconData icon, Color? backgroundColor, Color iconColor) {
    return Container(
      width: 50,
      height: 70,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 30,
      ),
    );
  }

  Widget buildCardValueText(String value) {
    return Text(
      value,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildCardLabelText(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }

  Widget buildActionButton(IconData icon, String label, String content, Color? backgroundColor, Color? iconColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildIconBox(icon, backgroundColor, iconColor),
        SizedBox(width: 10),
        Expanded(
          child: buildTextColumn(label, content),
        ),
      ],
    );
  }

  Widget buildIconBox(IconData icon, Color? backgroundColor, Color? iconColor) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }

  Widget buildTextColumn(String label, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildButtonLabelText(label),
        buildButtonContentText(content),
      ],
    );
  }

  Widget buildButtonLabelText(String label) {
    return Text(
      label,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildButtonContentText(String content) {
    return Text(
      content,
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.grey),
    );
  }
}
