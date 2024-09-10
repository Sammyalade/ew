import 'user_model.dart'; 
import 'patient_details_model.dart';

class PatientLoginModel {
  final String refreshToken;
  final User user; 
  PatientDetails? patientDetails;
  final List<dynamic> appointments;

   PatientLoginModel({
    required this.refreshToken,
    required this.user,
    this.patientDetails,
    List<dynamic>? appointments, 
  }) : appointments = appointments ?? [];

  PatientLoginModel.defaultModel()
      : refreshToken = '',
        user = User.defaultUser(), 
        patientDetails = PatientDetails.defaultProfile(), 
        appointments = [];

  factory PatientLoginModel.fromJson(Map<String, dynamic> json) {
    print("Received JSON for PatientLoginModel: $json");
    return PatientLoginModel(
      refreshToken: json['refresh_token'] ?? '', 
      user: json['user'] != null 
          ? User.fromJson(json['user'] ?? {}) 
          : User.defaultUser(), 
      patientDetails: (json['patient_details'] != null && json['patient_details'] is Map<String, dynamic>)
          ? PatientDetails.fromJson(json['patient_details']) 
          : PatientDetails.defaultProfile(), 
      appointments: json['appointments'] != null && json['appointments'] is List<dynamic> 
          ? json['appointments'] 
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'refresh_token': refreshToken,
      'user': user.toJson(), 
      'patient_details': patientDetails?.toJson(),
      'appointments': appointments,
    };
  }
}
