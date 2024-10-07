import 'package:flutter/material.dart';
import 'package:health_eaze/models/doctor_login_model.dart';

class DoctorLoginModelProvider with ChangeNotifier{
  DoctorLoginModel _doctorLoginModel = DoctorLoginModel.defaultModel();

  DoctorLoginModel get doctorLoginModel => _doctorLoginModel;

  void setDoctorLoginModel(DoctorLoginModel model){
    _doctorLoginModel = model;
    notifyListeners();
  }
}