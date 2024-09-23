import 'dart:convert';
import 'dart:developer';import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:health_eaze/services/url_links.dart';
import 'package:http/http.dart' as http;

import 'auth_service.dart';

class SignUpService {
  final AuthService _authService = AuthService();
  final Uri signUpUrl = Uri.parse('$BASE_URL/auth/users/');

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
        // Sign up the user in Firebase Authentication
        UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await FirebaseChatCore.instance.createUserInFirestore(
          types.User(
            id: credential.user!.uid,  // Firebase UID
            firstName: firstName,
            lastName: lastName,
            imageUrl: 'https://i.pravatar.cc/300', // Default avatar, you can change this
          ),
        );

        print('Firebase and Firestore setup completed successfully.');
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
