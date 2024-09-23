import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _currentUser = userCredential.user;
      notifyListeners();
      return _currentUser;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Sign up
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _currentUser = userCredential.user;
      notifyListeners();
      return _currentUser;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
    _currentUser = null;
    notifyListeners();
  }

  Future<User?> signInAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      _currentUser = userCredential.user;
      notifyListeners();
      return _currentUser;
    } catch (e) {
      print('Failed to sign in: $e');
      return null;
    }
  }

  Future<User?> signInWithCustomToken(String token) async {
    try {
      UserCredential userCredential = await _auth.signInWithCustomToken(token);
      _currentUser = userCredential.user;
      notifyListeners();
      return _currentUser;
    } catch (e) {
      throw Exception('Error during sign-in: $e');

    }
  }

  // Future<U>
}
