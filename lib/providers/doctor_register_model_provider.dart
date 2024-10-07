import 'package:flutter/material.dart';
import 'package:health_eaze/models/register_doctor_model.dart';

class DoctorRegisterModelProvider with ChangeNotifier{
  RegisterDoctorModel _registerDoctorModel = RegisterDoctorModel.defaultModel();

  RegisterDoctorModel get registerDoctorModel => _registerDoctorModel;

  void setDoctor(RegisterDoctorModel model){
    _registerDoctorModel = model;
    notifyListeners();
  }

  void setUserProfile(int id){
    _registerDoctorModel.userProfile = id;
    notifyListeners();
  }

  void setSpecialty(String specialty){
    _registerDoctorModel.specialty = specialty;
    notifyListeners();
  }
}