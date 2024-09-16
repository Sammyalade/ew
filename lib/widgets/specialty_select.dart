import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../doctor/doctor_sign_up.dart';

class SpecialtySelect extends StatefulWidget {
  final String title; // Page title
  final String instruction; // Instruction text
  final List<String> specialties; // List of specialties
  final Function(String) onSelectSpecialty; // Callback on specialty selection

  const SpecialtySelect({
    super.key,
    required this.title,
    required this.instruction,
    required this.specialties,
    required this.onSelectSpecialty,
  });

  @override
  _SpecialtySelectState createState() => _SpecialtySelectState();
}

class _SpecialtySelectState extends State<SpecialtySelect> {
  String _selectedChoice = ''; // Variable to store selected choice
  DateTime lastPressed = DateTime.now(); // Track time of last press

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title, // Use the title passed to the widget
          style: GoogleFonts.nunito(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.instruction, // Use the instruction passed to the widget
                style: GoogleFonts.nunito(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              SpecialityList(
                choices: widget.specialties, // Use the specialties passed to the widget
                selectedChoice: _selectedChoice,
                onSelectChoice: handleSpecialtySelection,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Handle specialty selection with double-tap detection
  void handleSpecialtySelection(String choice) {
    final now = DateTime.now();
    if (_selectedChoice == choice && now.difference(lastPressed) < const Duration(seconds: 1)) {
      widget.onSelectSpecialty(choice); // Trigger the callback with the selected choice
    } else {
      // Update selected choice and track the time of selection
      setState(() {
        _selectedChoice = choice;
        lastPressed = now;
      });
    }
  }
}
//
// class SpecialityList extends StatelessWidget {
//   final List<String> choices;
//   final String selectedChoice;
//   final Function(String) onSelectChoice;
//
//   const SpecialityList({
//     Key? key,
//     required this.choices,
//     required this.selectedChoice,
//     required this.onSelectChoice,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 8.0,
//       runSpacing: 8.0,
//       children: choices.map((choice) {
//         return ChoiceChip(
//           label: Text(choice),
//           selected: selectedChoice == choice,
//           onSelected: (_) => onSelectChoice(choice),
//         );
//       }).toList(),
//     );
//   }
// }
