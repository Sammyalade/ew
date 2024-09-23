import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart'; // Import your AuthService

class UserProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;

  User? get user => _user;

  void setUser(User? user){
    _user = user;
    notifyListeners();
  }

  // Login function
  Future<void> login(String email, String password) async {
    try {
      _user = await _authService.signIn(email, password);
      notifyListeners(); // Notify listeners that user state has changed
    } catch (e) {
      print('Login failed: $e');
    }
  }

  // Sign-up function
  Future<void> signUp(String email, String password) async {
    try {
      _user = await _authService.signUp(email, password);
      notifyListeners(); // Notify listeners that user state has changed
    } catch (e) {
      print('Sign-up failed: $e');
    }
  }

  // Sign out function
  Future<void> signOut() async {
    try {
      await _authService.signOut();
      _user = null;
      notifyListeners(); // Notify listeners that user state has changed
    } catch (e) {
      print('Sign out failed: $e');
    }
  }

  Future<void> signInWithToken(String token) async{
    try{
      _user = await _authService.signInWithCustomToken(token);
      notifyListeners();
    }catch(e){
      print('Sign in failed');
    }
  }


}
