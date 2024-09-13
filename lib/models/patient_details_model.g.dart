// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientDetails _$PatientDetailsFromJson(Map<String, dynamic> json) =>
    PatientDetails(
      id: (json['id'] as num).toInt(),
      medicalRecords: json['medical_records'] as String?,
      newlyPrescribedMedicine:
          json['newly_prescribed_medicine'] as List<dynamic>,
      doctorsNotes: json['doctors_notes'] as List<dynamic>,
      dateOfBirth: json['date_of_birth'] as String?,
      bloodGroup: json['blood_group'] as String,
      genotype: json['genotype'] as String,
      emergencyContactName: json['emergency_contact_name'] as String,
      emergencyContactPhone: json['emergency_contact_phone'] as String,
      userProfile: (json['user_profile'] as num).toInt(),
    );

Map<String, dynamic> _$PatientDetailsToJson(PatientDetails instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('medical_records', instance.medicalRecords);
  val['newly_prescribed_medicine'] = instance.newlyPrescribedMedicine;
  val['doctors_notes'] = instance.doctorsNotes;
  writeNotNull('date_of_birth', instance.dateOfBirth);
  val['blood_group'] = instance.bloodGroup;
  val['genotype'] = instance.genotype;
  val['emergency_contact_name'] = instance.emergencyContactName;
  val['emergency_contact_phone'] = instance.emergencyContactPhone;
  val['user_profile'] = instance.userProfile;
  return val;
}
