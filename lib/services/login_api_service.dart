import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApiService{
  final String loginUrl = 'http://127.0.0.1:8000/users/login/';

  Future<Map<String, dynamic>> login(String email, String password) async{
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
    if (response.statusCode == 200 ) {
    print('Login successful: ${response.body}');

      return json.decode(response.body);
      
    } else if(response.statusCode ==401){
      print(response.statusCode);
        throw Exception('Invalid credentials');
        
    }
    else {
      throw Exception('Failed to log in: Server error');
    }
    }catch(e){
      print(e);
      throw Exception('Failed to login: ${e.toString()}');
    }
  }

  // Future<Map<String, dynamic>> register (
  //   String fullName, String phoneNumber, String gender, String email, String password) async{

  // }
}