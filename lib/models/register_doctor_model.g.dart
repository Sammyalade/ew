// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDoctorModel _$RegisterDoctorModelFromJson(Map<String, dynamic> json) =>
    RegisterDoctorModel(
      id: (json['id'] as num).toInt(),
      userProfile: (json['user_profile'] as num).toInt(),
      signature: json['signature'] as String,
      registrationNumber: json['registration_number'] as String,
      registrationCouncil: json['registration_council'] as String,
      registrationYear: json['registration_year'] as String,
      specialty: json['specialty'] as String,
      consultationFee: (json['consultation_fee'] as num).toInt(),
      qualification: json['qualification'] as String,
      college: json['college'] as String,
      startYear: json['startYear'] as String,
      endYear: json['endYear'] as String,
      isAvailable: json['is_available'] as bool,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$RegisterDoctorModelToJson(
        RegisterDoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_profile': instance.userProfile,
      'signature': instance.signature,
      'registration_number': instance.registrationNumber,
      'registration_council': instance.registrationCouncil,
      'registration_year': instance.registrationYear,
      'specialty': instance.specialty,
      'consultation_fee': instance.consultationFee,
      'qualification': instance.qualification,
      'college': instance.college,
      'startYear': instance.startYear,
      'endYear': instance.endYear,
      'is_available': instance.isAvailable,
      'rating': instance.rating,
    };
