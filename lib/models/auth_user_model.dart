import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(includeIfNull: false)
class AuthUserModel{
  @JsonKey(name: 'uid')
  final String uid;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'display_name')
  final String fullName;


  AuthUserModel({required this.uid, required this.email, required this.fullName});

  AuthUserModel.defaultModel():
      uid = '',
      email = '',
      fullName = 'N/A';

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      uid: json['uid'] ?? 'error',
      email: json['email'] ?? 'error email',
      fullName: json['display_name'] ?? 'error name',
    );
  }

  // Factory constructor to create a UserModel from a Firebase User
  factory AuthUserModel.fromFirebaseUser(User user) {
    return AuthUserModel(
      uid: user.uid,
      email: user.email ?? 'No email',
      fullName: user.displayName ?? 'No name',
    );
  }
}
