import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(includeIfNull: false)
class UserModel{
  @JsonKey(name: 'uid')
  final String uid;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'display_name')
  final String fullName;

  UserModel({required this.uid, required this.email, required this.fullName});

  UserModel.defaultModel():
      uid = '',
      email = '',
      fullName = 'N/A';

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? 'error',
      email: json['email'] ?? 'error email',
      fullName: json['display_name'] ?? 'error name',
    );
  }

  // Factory constructor to create a UserModel from a Firebase User
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? 'No email',
      fullName: user.displayName ?? 'No name',
    );
  }
}
