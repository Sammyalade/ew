import 'package:health_eaze/models/UserProfile.dart';
import 'package:health_eaze/models/user_model.dart';

class DoctorRequestModel {
  int id;
  UserModel userProfile;
  String signature;
  String registrationNumber;
  String registrationCouncil;
  String registrationYear;
  String specialty;
  int consultationFee;
  String qualification;
  String college;
  String startYear;
  String endYear;
  bool isAvailable;
  double rating;

  DoctorRequestModel({
    required this.id,
    required this.userProfile,
    required this.signature,
    required this.registrationNumber,
    required this.registrationCouncil,
    required this.registrationYear,
    required this.specialty,
    required this.consultationFee,
    required this.qualification,
    required this.college,
    required this.startYear,
    required this.endYear,
    required this.isAvailable,
    required this.rating,
  });

  DoctorRequestModel.defaultModel()
      : id = 0,
        userProfile = UserModel.defaultUser(),
        signature = "",
        registrationNumber = "",
        registrationCouncil = "",
        registrationYear = "",
        specialty = "",
        consultationFee = 0,
        qualification = "",
        college = "",
        startYear = "",
        endYear = "",
        isAvailable = false,
        rating = 3.0;


  factory DoctorRequestModel.fromJson(Map<String, dynamic> json) {
    return DoctorRequestModel(
      id: json['id'] ?? 0,  
      userProfile: json['user_profile'] != null 
        ? UserModel.fromJson(json['user_profile']) 
        : UserModel.defaultUser(),  
      signature: json['signature'] ?? 'N/A',  
      registrationNumber: json['registration_number'] ?? 'N/A',  
      registrationCouncil: json['registration_council'] ?? 'N/A',  
      registrationYear: json['registration_year'] ?? 'N/A',  
      specialty: json['specialty'] ?? 'General',  
      consultationFee: json['consultation_fee'] ?? 0, 
      qualification: json['qualification'] ?? 'Unknown',  
      college: json['college'] ?? 'Unknown',  
      startYear: json['start_year'] ?? 'N/A',  
      endYear: json['end_year'] ?? 'N/A',  
      isAvailable: json['is_available'] ?? false,  
      rating: json['rating'] ?? 0,
    );
  }
}
