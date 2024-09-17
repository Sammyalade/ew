import 'dart:convert';

import 'package:health_eaze/models/book_appointment_model.dart';
import 'package:http/http.dart' as http;


class BookAppointmentService {
  final String bookAppointmentUrl = 'http://127.0.0.1:8000/appointments/appointment/';

  Future<AppointmentModel?> bookAppointment(AppointmentModel appointmentModel) async {
    try{
      final response = await http.post(
        Uri.parse(bookAppointmentUrl),
        headers: {
          'Content-Type': 'application/json'
        }, 
        body: jsonEncode(appointmentModel.toJson()),
      );

      if(response.statusCode == 200 || response.statusCode == 201){
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        return  AppointmentModel.fromJson(responseBody);
      }
      else if(response.statusCode == 400){
        throw Exception('Bad request: ${response.body}');
      }
      else if (response.statusCode == 401){
        throw Exception('Unauthorized: ${response.body}');
      }
      else if (response.statusCode == 500){
        throw Exception('Server error ${response.body}');
      }
      else{
        throw Exception('Unexpected error: ${response.statusCode}');
      }
    }
    catch(e){
      print(e);
      throw Exception('Failed to book appointment: ${e.toString()}');
    }
  }
}