class PatientDetails {
  final int id;
  final String? medicalRecords;
  final List<dynamic> newlyPrescribedMedicine;
  final List<dynamic> doctorsNotes;
  final DateTime? dateOfBirth;
  final String bloodGroup;
  final String genotype;
  final String emergencyContactName;
  final String emergencyContactPhone;
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
        dateOfBirth = DateTime.now(), 
        bloodGroup = "",
        genotype = "",
        emergencyContactName = "",
        emergencyContactPhone = "",
        userProfile = 0;

  factory PatientDetails.fromJson(Map<String, dynamic> json) {
  return PatientDetails(
    id: json['id'] ?? 0,
    medicalRecords: json['medical_records'] != null && json['medical_records'] != "null"
        ? json['medical_records'] 
        : "", 
    newlyPrescribedMedicine: json['newly_prescribed_medicine'] ?? [],
    doctorsNotes: json['doctors_notes'] ?? [],
    dateOfBirth: (json['date_of_birth'] != null && json['date_of_birth'] != "null")
        ? json['date_of_birth'] 
        : "", 
    bloodGroup: json['blood_group'] ?? "",
    genotype: json['genotype'] ?? "",
    emergencyContactName: (json['emergency_contact_name'] != null && json['emergency_contact_name'] != "null")
        ? json['emergency_contact_name'] 
        : "",
    emergencyContactPhone: json['emergency_contact_phone'] ?? "",
    userProfile: json['user_profile'] ?? 0,
  );
}


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'medical_records': medicalRecords,
      'newly_prescribed_medicine': newlyPrescribedMedicine,
      'doctors_notes': doctorsNotes,
      'date_of_birth': dateOfBirth,
      'blood_group': bloodGroup,
      'genotype': genotype,
      'emergency_contact_name': emergencyContactName,
      'emergency_contact_phone': emergencyContactPhone,
      'user_profile': userProfile,
    };
  }
}