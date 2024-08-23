import 'package:flutter/material.dart';
import 'package:health_eaze/utils/utilities.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  int pageIndex = 0;
  String patientName = 'Susannah';

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
    );
  }
}