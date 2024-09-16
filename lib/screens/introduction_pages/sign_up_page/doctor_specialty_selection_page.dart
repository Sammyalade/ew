import 'package:flutter/material.dart';
import 'package:health_eaze/doctor/doctor_reg_form.dart';
import '../../../widgets/doctor_specialties.dart';
import '../../../widgets/specialty_select.dart'; // New utility file for specialty choices

class DoctorSpecialityChoices extends StatefulWidget {
  const DoctorSpecialityChoices({super.key});

  @override
  State<DoctorSpecialityChoices> createState() =>
      _DoctorSpecialityChoicesState();
}

class _DoctorSpecialityChoicesState extends State<DoctorSpecialityChoices> {
  String _selectedChoice = ''; // Variable to store selected choice
  DateTime lastPressed = DateTime.now(); // For detecting double-clicks

  @override
  Widget build(BuildContext context) {
    Widget nextPage = SpecialtySelect(
      title: 'Doctor Specialty',
      instruction:
          'Please select the specialty that best describes your practice:',
      specialties: specialtyChoices,
      onSelectSpecialty: handleSpecialtySelection,
    );
    return nextPage;
  }

  void handleSpecialtySelection(String choice) {
    final now = DateTime.now();
    if (_selectedChoice == choice &&
        now.difference(lastPressed) < const Duration(seconds: 1)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegistrationForm(specialty: choice),
        ),
      );
    } else {
      setState(() {
        _selectedChoice = choice;
        lastPressed = now;
      });
    }
  }
}
