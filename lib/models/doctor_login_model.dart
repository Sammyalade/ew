import 'package:flutter/material.dart';
import 'package:health_eaze/models/login_doctor_response.dart';
import 'package:health_eaze/models/login_model.dart';
import 'package:health_eaze/screens/introduction_pages/sign_up_page/doctor_reg_form.dart';
import 'package:health_eaze/screens/introduction_pages/sign_up_page/doctor_specialty_selection_page.dart';
import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart'; 
part 'doctor_login_model.g.dart';

@JsonSerializable(includeIfNull: false)
class DoctorLoginModel extends LoginModel{
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  final UserModel user; 
  @JsonKey(name: 'firebase_token')
  final String firebaseToken;
  final LoginDoctorResponse loginDoctor;

  DoctorLoginModel({
    required this.refreshToken,
    required this.user,
    required this.firebaseToken,
    required this.loginDoctor,
  });

  DoctorLoginModel.defaultModel()
      : refreshToken = "",
        user = UserModel.defaultUser(),
        firebaseToken = "",
        loginDoctor = LoginDoctorResponse.defaultInstance();


  factory DoctorLoginModel.fromJson(Map<String, dynamic> json) => _$DoctorLoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorLoginModelToJson(this);

  @override
  void goToDashboard(BuildContext context){
  Widget nextScreen;
    nextScreen = const DoctorSpecialityChoices();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );  }
}
