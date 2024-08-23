import 'package:flutter/material.dart';
import 'package:health_eaze/doctor/doctor_reg_form.dart';
import 'package:health_eaze/utils/form_fields.dart';
import 'package:health_eaze/utils/utils.dart';

class QualificationForm extends StatelessWidget {
  const QualificationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qualification Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            returnTextField('Qualification'),
            const SizedBox(height: 10),
            returnTextField('College / University'),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: returnTextField('Start Year'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: returnTextField('End Year'),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(500, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: greenishColor),
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
