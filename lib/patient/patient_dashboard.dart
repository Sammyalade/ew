import 'package:flutter/material.dart';
import 'package:health_eaze/models/patient.dart';
import 'package:health_eaze/patient/home.dart';
import 'package:health_eaze/patient/messages.dart';
import 'package:health_eaze/patient/vitals.dart';
import 'package:health_eaze/patient/wallet.dart';
import 'package:health_eaze/widgets/navigation_bar.dart';
import 'package:health_eaze/utils/utilities.dart';

class PatientDashboard extends StatefulWidget {
  final PatientLoginModel patientLoginModel;
  const PatientDashboard({super.key, required this.patientLoginModel });

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
    patientName = widget.patientLoginModel.user.firstName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: IndexedStack(
              index: currentPageIndex,
              children: [
                HomeScreen(patientName: patientName),
                const Vitals(),
                const Messages(),
                const Wallet(),
              ],
            ))
          ],
        ),
      ),
      // bottomNavigationBar: const NavigationMenu(),
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
      selectedItemColor: primaryColorPink,
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
          icon: Icon(Icons.account_balance_wallet),
          label: 'Wallet',
        )
      ],
    );
  }
}
