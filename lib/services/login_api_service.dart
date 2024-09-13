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
      print('response is 200');
        final Map<String, dynamic> responseBody = json.decode(response.body);
        print(responseBody);
        print('response body gotten');
        var role = responseBody['user']['role'];
        print('role gotten');
        if (role == 'PATIENT') {

          print('role is patient');
          
          var patient = PatientLoginModel.fromJson(responseBody);
          print('patient from login service');
          print(patient.toString());
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