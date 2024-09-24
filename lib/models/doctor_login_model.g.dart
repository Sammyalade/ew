// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorLoginModel _$DoctorLoginModelFromJson(Map<String, dynamic> json) =>
    DoctorLoginModel(
      refreshToken: json['refresh_token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      appointments: json['appointments'] as List<dynamic>,
      notifications: json['notifications'] as List<dynamic>,
      firebaseToken: json['firebase_token'] as String,
    );

Map<String, dynamic> _$DoctorLoginModelToJson(DoctorLoginModel instance) =>
    <String, dynamic>{
      'refresh_token': instance.refreshToken,
      'user': instance.user,
      'appointments': instance.appointments,
      'notifications': instance.notifications,
      'firebase_token': instance.firebaseToken,
    };
