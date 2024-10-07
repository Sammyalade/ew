// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_doctor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDoctorResponse _$LoginDoctorResponseFromJson(Map<String, dynamic> json) =>
    LoginDoctorResponse(
      appointments: (json['appointments'] as List<dynamic>?)
          ?.map((e) => AppointmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      notifications: json['notifications'] as List<dynamic>?,
    );

Map<String, dynamic> _$LoginDoctorResponseToJson(
        LoginDoctorResponse instance) =>
    <String, dynamic>{
      'appointments': instance.appointments,
      'notifications': instance.notifications,
    };
