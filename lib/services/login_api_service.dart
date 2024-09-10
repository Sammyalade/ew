import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:health_eaze/models/patient.dart';
import 'package:health_eaze/models/doctor_model.dart';


class LoginApiService{
  final String loginUrl = 'http://127.0.0.1:8000/users/login/';

  Future<dynamic> login(String email, String password) async{
    try{
      final response = await http.post(
      Uri.parse(loginUrl),
      headers:{
        'Content-Type': 'application/json',
      },body: json.encode({
        'email': email,
        'password': password,
      }),
    );
if (response.statusCode == 200) {
        print('Login successful: ${response.body}');
        final responseBody = json.decode(response.body);
        final role = responseBody['user']['role'];
        print(role);
        if (role == 'PATIENT') {
          print("it works at this point");
          print("it works at this point");
          var patient = PatientLoginModel.fromJson(responseBody['PATIENT']);
          print(patient);
          return patient;
        } else if (role == 'DOCTOR') {
          return DoctorLoginModel.fromJson(responseBody['DOCTOR']);
        } else {
          print("it works at this point");
          throw Exception('Unknown role');
        }
      } else if (response.statusCode == 401) {
        print(response.statusCode);
        throw Exception('Invalid credentials');
      } else {
        throw Exception('Failed to log in: Server error');
      }
    } catch (e) {
      print("something went wrong here ; ${e}");
      throw Exception('Failed to login: ${e.toString()}');
    }
  }

}