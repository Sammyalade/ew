// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorLoginModel _$DoctorLoginModelFromJson(Map<String, dynamic> json) =>
    DoctorLoginModel(
      refreshToken: json['refresh_token'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      firebaseToken: json['firebase_token'] as String,
      loginDoctor: LoginDoctorResponse.fromJson(
          json['loginDoctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorLoginModelToJson(DoctorLoginModel instance) =>
    <String, dynamic>{
      'refresh_token': instance.refreshToken,
      'user': instance.user,
      'firebase_token': instance.firebaseToken,
      'loginDoctor': instance.loginDoctor,
    };
