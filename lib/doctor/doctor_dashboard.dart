import 'package:flutter/material.dart';
import 'package:health_eaze/models/doctor_model.dart';

class DoctorDashboard extends StatefulWidget {
  final DoctorLoginModel doctorLoginModel;
  const DoctorDashboard({super.key, required this.doctorLoginModel});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}