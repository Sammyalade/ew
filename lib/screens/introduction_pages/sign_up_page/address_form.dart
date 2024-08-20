import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_eaze/utils/utils.dart';

class AddressForm extends StatelessWidget {
  const AddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Street Address
              TextField(
                decoration: InputDecoration(
                  labelText: 'Street Address',
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: blackishColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: greenishColor),
                  ),
                ),
              ),
              const SizedBox(height: 10),
        
              // City
              TextField(
                decoration: InputDecoration(
                  labelText: 'City',
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: blackishColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: greenishColor),
                  ),
                ),
              ),
              const SizedBox(height: 10),
        
              // State
              TextField(
                decoration: InputDecoration(
                  labelText: 'State/Province',
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: blackishColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: greenishColor),
                  ),
                ),
              ),
              const SizedBox(height: 10),
        
              // Postal Code
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Postal Code',
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: blackishColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: greenishColor),
                  ),
                ),
              ),
              const SizedBox(height: 10),
        
              // Country
              TextField(
                decoration: InputDecoration(
                  labelText: 'Country',
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: blackishColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: greenishColor),
                  ),
                ),
              ),
              SizedBox(height: 10),
        
              buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}
