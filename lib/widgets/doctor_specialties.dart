import 'package:flutter/material.dart';
import 'package:health_eaze/utils/utils.dart';

const List<String> specialtyChoices = [
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

// Reusable Widget for displaying the list of specialties
class SpecialityList extends StatelessWidget {
  final List<String> choices;
  final String selectedChoice;
  final Function(String) onSelectChoice;

  const SpecialityList({
    super.key,
    required this.choices,
    required this.selectedChoice,
    required this.onSelectChoice,
  });

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
    super.key,
    required this.choice,
    required this.isSelected,
    required this.onPressed,
  });

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