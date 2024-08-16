import 'package:flutter/material.dart';
import 'package:health_eaze/utils.dart';

TextField returnTextField(String labelText) {
  return TextField(
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(
        color: Colors.grey,
        
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: blackishColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: greenishColor),
      ),
      
    ),
  );
}
