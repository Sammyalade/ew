import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApiService{
  final String loginUrl = 'https://health-ease-icy-violet-612.fly.dev//users/login/';

  Future<Map<String, dynamic>> login(String emailOrPhoneNumber, String password) async{
    try{
      final response = await http.post(
      Uri.parse(loginUrl),
      headers:{
        'Content-Type': 'application/json',
      },body: json.encode({
        'emailOrPhoneNumber': emailOrPhoneNumber,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if(response.statusCode ==401){
        throw Exception('Invalid credentials');
    }
    else {
      throw Exception('Failed to log in: Server error');
    }
    }catch(e){
      throw Exception('Failed to login: ${e.toString()}');
    }
  }

  // Future<Map<String, dynamic>> register (
  //   String fullName, String phoneNumber, String gender, String email, String password) async{

  // }
}