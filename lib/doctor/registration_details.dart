import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_eaze/utils/form_fields.dart';
import 'package:health_eaze/utils/utils.dart';

class RegistrationDetails extends StatelessWidget {
  const RegistrationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            returnTextField('Registration Number'),
            const SizedBox(height: 10),
            returnTextField('Registration Council'),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),  // Limits to 4 digits
              ],
              decoration: InputDecoration(
                labelText: 'Registration Year (YYYY)',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: blackishColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: greenishColor),
                ),
              ),
              // Additional validation logic can be added here
              onChanged: (value) {
                if (value.length == 4) {
                  int? year = int.tryParse(value);
                  if (year != null && (year < 1900 || year > DateTime.now().year)) {
                    // Show an error or handle invalid year input
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter a valid year between 1900 and ${DateTime.now().year}')),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
