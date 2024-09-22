// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_eaze/utils/toast_util.dart';
import 'package:health_eaze/widgets/doctor_specialties.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // Form controllers
  String? _selectedSpecialty;
  String? _rating;
  final TextEditingController _nameController = TextEditingController();
  RangeValues _feeRange = RangeValues(1000, 10000); // Consultation fee range

  final List<String> _specialties = specialtyChoices;
  final List<String> _ratings = ['1+', '2+', '3+', '4+', '5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Doctors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown for Specialty
            DropdownButtonFormField<String>(
              value: _selectedSpecialty,
              decoration: InputDecoration(
                labelText: 'Specialty',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _selectedSpecialty = value;
                });
              },
              items: _specialties.map((String specialty) {
                return DropdownMenuItem<String>(
                  value: specialty,
                  child: Text(specialty),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // Dropdown for Rating
            DropdownButtonFormField<String>(
              value: _rating,
              decoration: InputDecoration(
                labelText: 'Rating',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _rating = value;
                });
              },
              items: _ratings.map((String rating) {
                return DropdownMenuItem<String>(
                  value: rating,
                  child: Text(rating),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // Text field for Doctor's Name
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Doctor\'s Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // RangeSlider for Consultation Fee
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Consultation Fee: ₦${_feeRange.start.round()} - ₦${_feeRange.end.round()}'),
                RangeSlider(
                  values: _feeRange,
                  min: 1000,
                  max: 10000,
                  divisions: 100,
                  labels: RangeLabels(
                    _feeRange.start.round().toString(),
                    _feeRange.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _feeRange = values;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            // Apply Filters Button
            ElevatedButton(
              onPressed: () {
                // Trigger search or fetch with the selected filters
                _applyFilters();
              },
              child: Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }

  void _applyFilters() {
    // You can pass these filters to your API or logic
    final filters = {
      'specialty': _selectedSpecialty,
      'rating': _rating,
      'name': _nameController.text,
      'feeStart': _feeRange.start,
      'feeEnd': _feeRange.end,
    };

    ToastUtil.showCustomToast(
      context,
      "Filters applied successfully!",
      backgroundColor: Colors.green,
      icon: Icon(Icons.check, color: Colors.white),
    );
    Navigator.pop(context, filters);
  }
}

