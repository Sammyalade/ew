import 'package:flutter/material.dart';
import 'package:health_eaze/patient/home.dart';
import 'package:health_eaze/patient/messages.dart';
import 'package:health_eaze/patient/vitals.dart';
import 'package:health_eaze/patient/wallet.dart';
import 'package:health_eaze/utils/utilities.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  int currentPageIndex = 0;
  String patientName = 'John Doe';

  @override
  void initState(){
    super.initState();
    fetchPatientName();
  }

  void fetchPatientName() async{
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      patientName = 'Mohammed';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Patient Dashboard',
          style: TextStyle(
            color: black
          ),
        ),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          HomeScreen(patientName: patientName),
          const Vitals(),
          const Messages(),
          const Wallet(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (index){
          setState(() {
            currentPageIndex = index;
          });
        },
        items: const[
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
      ),
    );
  }
}