import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_eaze/services/auth_service.dart';
import 'package:health_eaze/services/url_links.dart';
import 'package:http/http.dart' as http;
import 'package:health_eaze/models/patient.dart';
import 'package:health_eaze/models/doctor_model.dart';
import 'package:provider/provider.dart';

import '../providers/patient_provider.dart';

class LoginApiService {
  final AuthService authService = AuthService();
  final String loginUrl = '$BASE_URL/users/login/';

  Future<dynamic> login(String email, String password, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        var user = await authService.signInWithCustomToken(responseBody['firebase_token']);
        print("User is not working well $user");

        var role = responseBody['user']['role'];
        if (role == 'PATIENT') {
          var patient = PatientLoginModel.fromJson(responseBody);
          Provider.of<PatientProvider>(context, listen: false)
              .updatePatient(patient);

          return patient;
        } else if (role == 'DOCTOR') {
          var doctor = DoctorLoginModel.fromJson(responseBody);
          return doctor;
        } else {
          throw Exception('Unknown role');
        }

      } else if (response.statusCode == 401) {
        throw Exception('Invalid credentials');
      } else {
        throw Exception('Failed to log in: Server error');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to login: ${e.toString()}');
    }
  }
}
