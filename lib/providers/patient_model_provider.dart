import 'package:flutter/material.dart';
import 'package:health_eaze/models/patient.dart';

class PatientLoginModelProvider with ChangeNotifier{
  PatientLoginModel _patientLoginModel = PatientLoginModel.defaultModel();

  PatientLoginModel get patientLoginModel => _patientLoginModel;

  void setPatientLoginModel(PatientLoginModel model){
    _patientLoginModel = model;
    notifyListeners();
  }
}