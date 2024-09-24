import 'package:health_eaze/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(includeIfNull: false)
class Doctor {
  int id;
  @JsonKey(name: 'user_profile')
  User userProfile;
  String signature;
  @JsonKey(name: 'registration_number')
  String registrationNumber;
  @JsonKey(name: 'registration_council')
  String registrationCouncil;
  @JsonKey(name: 'registration_year')
  String registrationYear;
  String specialty;
  @JsonKey(name: 'consultation_fee')
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
}