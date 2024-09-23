// doctor_model.dart
import 'package:flutter/material.dart';
import 'package:health_eaze/models/login_model.dart';

import 'user_model.dart'; // Import the User model

class DoctorLoginModel extends LoginModel{
  final String refreshToken;
  final User user; // Use the imported User model
  final List<dynamic> appointments;
  final List<dynamic> notifications;
  final String firebaseToken;

  DoctorLoginModel({
    required this.refreshToken,
    required this.user,
    required this.appointments,
    required this.notifications,
    required this.firebaseToken,
  });

  DoctorLoginModel.defaultUser()
      : refreshToken = "",
        user = User.defaultUser(),
        appointments = [],
        firebaseToken = "",
        notifications = [];

  factory DoctorLoginModel.fromJson(Map<String, dynamic> json) {
    return DoctorLoginModel(
      refreshToken: json['refresh_token'],
      user: User.fromJson(json['user']), // Call the fromJson method of User
      appointments: json['doctor']['appointments'] ?? [],
      notifications: json['doctor']['notifications'] ?? [],
      firebaseToken: json['firebase_token']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'refresh_token': refreshToken,
      'firebase_token': firebaseToken,
      'user': user.toJson(), // Call the toJson method of User
      'doctor': {
        'appointments': appointments,
        'notifications': notifications,
      },
    };
  }
  @override
  void goToDashboard(BuildContext context){

    print("doctors dashboard");
  }
}
