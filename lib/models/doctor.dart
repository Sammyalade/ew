import 'package:health_eaze/models/UserProfile.dart';
import 'package:health_eaze/models/user_model.dart';

class Doctor {
  int id;
  User userProfile;
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

  Doctor({
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

  Doctor.defaultModel()
      : id = 0,
        userProfile = User.defaultUser(),
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


  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] ?? 0,  
      userProfile: json['user_profile'] != null 
        ? User.fromJson(json['user_profile']) 
        : User.defaultUser(),  
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
