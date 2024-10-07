// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      firstName: json['first_name'] as String,
      username: json['username'] as String,
      lastName: json['last_name'] as String,
      role: json['role'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$UserToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'first_name': instance.firstName,
      'username': instance.username,
      'last_name': instance.lastName,
      'role': instance.role,
      'gender': instance.gender,
    };
