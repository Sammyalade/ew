import 'package:flutter/material.dart';
import 'package:health_eaze/doctor/doctor_reg_form.dart';
import '../../../widgets/doctor_specialties.dart'; // New utility file for specialty choices

class DoctorSpecialityChoices extends StatefulWidget {
  const DoctorSpecialityChoices({super.key});

  @override
  State<DoctorSpecialityChoices> createState() => _DoctorSpecialityChoicesState();
}

class _DoctorSpecialityChoicesState extends State<DoctorSpecialityChoices> {
  String _selectedChoice = ''; // Variable to store selected choice
  DateTime lastPressed = DateTime.now(); // For detecting double-clicks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Specialty'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Please select the specialty that best describes your practice:',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              SpecialityList(
                choices: specialtyChoices,
                selectedChoice: _selectedChoice,
                onSelectChoice: handleSpecialtySelection,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleSpecialtySelection(String choice) {
    final now = DateTime.now();
    if (_selectedChoice == choice && now.difference(lastPressed) < const Duration(seconds: 1)) {
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