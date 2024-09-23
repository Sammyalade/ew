import 'dart:convert';

import 'package:health_eaze/services/url_links.dart';
import 'package:http/http.dart' as http;


class BookAppointmentService {
  final String bookAppointmentUrl = '$BASE_URL/appointments/appointment/';

  Future<Map<String, dynamic>?> bookAppointment(String patientId, String doctorId, String appointmentDate, String reason, String startTime, String endTime) async {
    try{
      final response = await http.post(
        Uri.parse(bookAppointmentUrl),
        headers: {
          'Content-Type': 'application/json'
        }, 
        body:  json.encode({
          'patient': patientId,
          'doctor': doctorId,
          'appointment_date': appointmentDate,
          'reason': reason,
          'start_time': startTime,
          'end_time': endTime,
        }),
       
      );
      
      if(response.statusCode == 200 || response.statusCode == 201){
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        print(responseBody);
        return  responseBody;
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
      throw Exception('Failed to book appointment: ${e.toString()}');
    }
  }
}