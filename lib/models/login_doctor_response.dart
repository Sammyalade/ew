import 'package:json_annotation/json_annotation.dart';
import 'package:health_eaze/models/book_appointment_model.dart';

part 'login_doctor_response.g.dart';

@JsonSerializable(includeIfNull: false)
class LoginDoctorResponse {
  final List<AppointmentModel> appointments;
  final List<dynamic> notifications;

  LoginDoctorResponse({
    List<AppointmentModel>? appointments,
    List<dynamic>? notifications,
  })  : appointments = appointments ?? [],
        notifications = notifications ?? [];
  
    factory LoginDoctorResponse.defaultInstance() {
    return LoginDoctorResponse(
      appointments: <AppointmentModel>[],
      notifications: <dynamic>[],
    );
  }

  factory LoginDoctorResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginDoctorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDoctorResponseToJson(this);
}
