import 'package:flutter/material.dart';
import 'package:health_eaze/models/doctor.dart';

class DoctorProvider with ChangeNotifier{
  Doctor _doctor = Doctor.defaultModel();

  Doctor get doctor => _doctor;

  void setDoctor(Doctor model){
    _doctor = model;
    notifyListeners();
  }
}