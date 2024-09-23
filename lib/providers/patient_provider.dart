import 'package:flutter/material.dart';
import 'package:health_eaze/models/patient.dart';

class PatientProvider with ChangeNotifier {
  PatientLoginModel _patient = PatientLoginModel.defaultModel();

  PatientLoginModel get patient => _patient;

  void updatePatient(PatientLoginModel newPatient) {
    _patient = newPatient;
    notifyListeners();
  }

  void clearPatient() {
    _patient = PatientLoginModel.defaultModel();
    notifyListeners();
  }
}
