// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientLoginModel _$PatientLoginModelFromJson(Map<String, dynamic> json) =>
    PatientLoginModel(
      refreshToken: json['refresh_token'] as String,
      firebaseToken: json['firebase_token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      patientDetails: json['patient_details'] == null
          ? null
          : PatientDetails.fromJson(
              json['patient_details'] as Map<String, dynamic>),
      appointments: json['appointments'] as List<dynamic>?,
      // firebaseToken: json['firebase_token'],
    );

Map<String, dynamic> _$PatientLoginModelToJson(PatientLoginModel instance) {
  final val = <String, dynamic>{
    'refresh_token': instance.refreshToken,
    'user': instance.user,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('patient_details', instance.patientDetails);
  val['appointments'] = instance.appointments;
  val['firebase_token'] = instance.firebaseToken;
  return val;
}
