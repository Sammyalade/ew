import 'package:health_eaze/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'register_doctor_model.g.dart';

@JsonSerializable(includeIfNull: false)
class RegisterDoctorModel {
  int id;
  @JsonKey(name: 'user_profile')
  int userProfile;
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
   @JsonKey(name: 'is_available')
  bool isAvailable;
  double rating;

  RegisterDoctorModel({
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

  RegisterDoctorModel.defaultModel()
      : id = 0,
        userProfile = 0,
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

   factory RegisterDoctorModel.fromJson(Map<String, dynamic> json) => _$RegisterDoctorModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterDoctorModelToJson(this);
}