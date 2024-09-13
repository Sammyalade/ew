import 'package:json_annotation/json_annotation.dart';
part 'patient_details_model.g.dart';

@JsonSerializable(includeIfNull: false)
class PatientDetails {
  final int id;
  @JsonKey(name: 'medical_records')
  final String? medicalRecords;
  @JsonKey(name: 'newly_prescribed_medicine')
  final List<dynamic> newlyPrescribedMedicine;
  @JsonKey(name: 'doctors_notes')
  final List<dynamic> doctorsNotes;
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @JsonKey(name: 'blood_group')
  final String bloodGroup;
  final String genotype;
  @JsonKey(name: 'emergency_contact_name')
  final String emergencyContactName;
  @JsonKey(name: 'emergency_contact_phone')
  final String emergencyContactPhone;
  @JsonKey(name: 'user_profile')
  final int userProfile;

  PatientDetails({
    required this.id,
    this.medicalRecords,
    required this.newlyPrescribedMedicine,
    required this.doctorsNotes,
    this.dateOfBirth,
    required this.bloodGroup,
    required this.genotype,
    required this.emergencyContactName,
    required this.emergencyContactPhone,
    required this.userProfile,
  });

  PatientDetails.defaultProfile()
      : id = 0,
        medicalRecords = "",
        newlyPrescribedMedicine = [],
        doctorsNotes = [],
        dateOfBirth = "", 
        bloodGroup = "",
        genotype = "",
        emergencyContactName = "",
        emergencyContactPhone = "",
        userProfile = 0;
  
  Map<String, dynamic> toJson() => _$PatientDetailsToJson(this);
  factory PatientDetails.fromJson(Map<String, dynamic> json) => _$PatientDetailsFromJson(json);



//   factory PatientDetails.fromJson(Map<String, dynamic> json) {
//   return PatientDetails(
//     id: json['id'] ?? 0,
//     medicalRecords: json['medical_records'] != null && json['medical_records'] != "null"
//         ? json['medical_records'] 
//         : "", 
//     newlyPrescribedMedicine: json['newly_prescribed_medicine'] ?? [],
//     doctorsNotes: json['doctors_notes'] ?? [],
//     dateOfBirth: (json['date_of_birth'] != null && json['date_of_birth'] != "null")
//         ? json['date_of_birth'] 
//         : "", 
//     bloodGroup: json['blood_group'] ?? "",
//     genotype: json['genotype'] ?? "",
//     emergencyContactName: (json['emergency_contact_name'] != null && json['emergency_contact_name'] != "null")
//         ? json['emergency_contact_name'] 
//         : "",
//     emergencyContactPhone: json['emergency_contact_phone'] ?? "",
//     userProfile: json['user_profile'] ?? 0,
//   );
// }


//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'medical_records': medicalRecords,
//       'newly_prescribed_medicine': newlyPrescribedMedicine,
//       'doctors_notes': doctorsNotes,
//       'date_of_birth': dateOfBirth,
//       'blood_group': bloodGroup,
//       'genotype': genotype,
//       'emergency_contact_name': emergencyContactName,
//       'emergency_contact_phone': emergencyContactPhone,
//       'user_profile': userProfile,
//     };
//   }
}