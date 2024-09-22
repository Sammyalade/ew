import 'package:flutter/material.dart';
import 'package:health_eaze/models/patient.dart';
import 'package:health_eaze/patient/home.dart';
import 'package:health_eaze/patient/messages.dart';
import 'package:health_eaze/patient/vitals.dart';
import 'package:health_eaze/patient/wallet.dart';
import 'package:health_eaze/providers/patient_model_provider.dart';
import 'package:health_eaze/widgets/navigation_bar.dart';
import 'package:health_eaze/utils/utilities.dart';
import 'package:provider/provider.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  int currentPageIndex = 0;
  String patientName = '';
  final String logo = 'asset/images/logos/sus2.png';

  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      final patientLoginModel = Provider.of<PatientLoginModelProvider>(context, listen: false).patientLoginModel;
      setState(() {
        patientName = patientLoginModel.user.firstName; // Set the patient name
      });
        });
  }

   void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Patient data is not available. Please log in again.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final patientLoginModel = Provider.of<PatientLoginModelProvider>(context).patientLoginModel;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: IndexedStack(
              index: currentPageIndex,
              children: [
                HomeScreen(
                  patientName: patientName,
                 patientLoginModel:  patientLoginModel
                ),
                const Vitals(),
                const Messages(),
                const Wallet(),
              ],
            ))
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentPageIndex,
      onTap: (index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      backgroundColor: primaryColorBlue,
      selectedItemColor: primaryColorBlue,
      unselectedItemColor: black,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Vitals',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.face_6_rounded),
          label: 'Profile',
        )
      ],
    );
  }
}
