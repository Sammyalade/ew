import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApiService{
  final String loginUrl = 'BASE_URL/users/login/';

  Future<Map<String, dynamic>> login(String emailOrPhoneNumber, String password) async{
    final response = await http.post(
      Uri.parse('$loginUrl'),
      headers:{
        'Content-Type': 'application/json',
      },body: json.encode({
        'emailOrPhoneNumber': emailOrPhoneNumber,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to log in');
    }
  }
}