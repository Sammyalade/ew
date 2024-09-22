import 'package:flutter/material.dart';
import 'package:health_eaze/models/login_model.dart';
import 'package:health_eaze/patient/patient_dashboard.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_model.dart'; 
import 'patient_details_model.dart';
part 'patient.g.dart';

@JsonSerializable(includeIfNull: false)
class PatientLoginModel extends LoginModel {
 
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  final User user; 
  @JsonKey(name: 'patient_details')
  PatientDetails? patientDetails;
  final List<dynamic> appointments;
  @JsonKey(name: 'firebase_token')
  final String firebaseToken;
     PatientLoginModel({
    required this.refreshToken,
     required this.firebaseToken,
    required this.user,
    this.patientDetails,
    List<dynamic>? appointments, 
  }) : appointments = appointments ?? [];

  PatientLoginModel.defaultModel()
      : refreshToken = '',
        user = User.defaultUser(), 
        patientDetails = PatientDetails.defaultProfile(),
        firebaseToken = '',
        appointments = [];
  
  factory PatientLoginModel.fromJson(Map<String, dynamic> json) => _$PatientLoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$PatientLoginModelToJson(this);

 


  @override
  void goToDashboard(BuildContext context){
    Widget nextScreen;
    nextScreen = const PatientDashboard();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

 
}
