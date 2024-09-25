import 'package:health_eaze/models/UserProfile.dart';

class Doctor {
  int id;
  UserProfile userProfile;
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

  factory Doctor.defaultDoctor() {
    return Doctor(
      id: 0,
      userProfile: UserProfile.defaultProfile(),  // Default user profile
      signature: 'N/A',
      registrationNumber: 'N/A',
      registrationCouncil: 'N/A',
      registrationYear: 'N/A',
      specialty: 'General',
      consultationFee: 0,
      qualification: 'Unknown',
      college: 'Unknown',
      startYear: 'N/A',
      endYear: 'N/A',
      isAvailable: false,
      rating: 0.0,
    );
  }

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] ?? 0,  // Fallback to 0 if null
      userProfile: json['user_profile'] != null 
        ? UserProfile.fromJson(json['user_profile']) 
        : UserProfile.defaultProfile(),  // Provide default or null handling for UserProfile
      signature: json['signature'] ?? 'N/A',  // Fallback if signature is null
      registrationNumber: json['registration_number'] ?? 'N/A',  // Handle null
      registrationCouncil: json['registration_council'] ?? 'N/A',  // Handle null
      registrationYear: json['registration_year'] ?? 'N/A',  // Handle null
      specialty: json['specialty'] ?? 'General',  // Fallback specialty
      consultationFee: json['consultation_fee'] ?? 0,  // Default to 0 if null
      qualification: json['qualification'] ?? 'Unknown',  // Handle null
      college: json['college'] ?? 'Unknown',  // Handle null
      startYear: json['start_year'] ?? 'N/A',  // Handle null
      endYear: json['end_year'] ?? 'N/A',  // Handle null
      isAvailable: json['is_available'] ?? false,  // Default to false if null
      rating: json['rating'] ?? 0,
    );
  }
}
