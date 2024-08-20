import 'package:flutter/material.dart';
import 'package:health_eaze/screens/introduction_pages/sign_up_page/doctor_reg_form.dart';
import 'package:health_eaze/utils/utils.dart';

class DoctorSpecialityChoices extends StatefulWidget {
  const DoctorSpecialityChoices({super.key});

  @override
  State<DoctorSpecialityChoices> createState() => _DoctorSpecialityChoicesState();
}

class _DoctorSpecialityChoicesState extends State<DoctorSpecialityChoices> {
  int _selectedChoiceIndex = 0;
  String _selectedChoice = ''; // Variable to store selected choice index
  DateTime lastPressed = DateTime.now();

  List<String> choices = [
    'Allergy and Immunology',
    'Anesthesiology',
    'Cardiology',
    'Dermatology',
    'Emergency Medicine',
    'Family Medicine',
    'Internal Medicine',
    'Medical Genetics',
    'Neurology',
    'Nuclear Medicine',
    'Obstetrics and Gynaecology',
    'Ophthalmology',
    'Pathology',
    'Paediatrics',
    'Psychiatry',
    'Surgery',
    'Urology',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Specialty'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Please select the specialty that best describes your practice:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              SpecialityList(
                choices: choices,
                selectedChoice: _selectedChoice,
                onSelectChoice: (choice) {
                  final now = DateTime.now();
                  if (_selectedChoice == choice && now.difference(lastPressed) < Duration(seconds: 1)) {
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable Widget for displaying the list of specialties
class SpecialityList extends StatelessWidget {
  final List<String> choices;
  final String selectedChoice;
  final Function(String) onSelectChoice;

  const SpecialityList({
    Key? key,
    required this.choices,
    required this.selectedChoice,
    required this.onSelectChoice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: choices.map((choice) {
        return SpecialityButton(
          choice: choice,
          isSelected: selectedChoice == choice,
          onPressed: () => onSelectChoice(choice),
        );
      }).toList(),
    );
  }
}

// Reusable Widget for each specialty button
class SpecialityButton extends StatelessWidget {
  final String choice;
  final bool isSelected;
  final VoidCallback onPressed;

  const SpecialityButton({
    Key? key,
    required this.choice,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0), // Space between buttons
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? greenishColor : greyishColor, // Change color when selected
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shadowColor: blackishColor,
        ),
        child: Text(choice),
      ),
    );
  }
}
