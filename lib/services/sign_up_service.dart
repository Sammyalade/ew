import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class SignUpService {
  final Uri signUpUrl = Uri.parse('http://127.0.0.1:8000/auth/users/');

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String phone,
    required String gender,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      var response = await http.post(
        signUpUrl,
        headers:<String, String> {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'first_name': firstName,
          'last_name': lastName,
          'phone_number': phone,
          'gender': gender,
          'email': email,
          'password': password,
          'username': email,
          'role': role,
        }),
      );

      if (response.statusCode == 201 || response.statusCode==200) {
        log('Sign-up successful: ${response.body}');
        print('Sign-up successful: ${response.body}');
      } else {
        log('Error Status: ${response.statusCode}');
        log('Error Body: ${response.body}');
        throw Exception('Failed to sign up: ${response.body}');
      }
    } catch (e) {
      print(e);
      log('Exception: $e');
      throw Exception('Failed to sign up');
    }
  }
}
