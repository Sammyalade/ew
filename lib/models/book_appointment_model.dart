import 'package:json_annotation/json_annotation.dart';

part 'book_appointment_model.g.dart';

@JsonSerializable(includeIfNull: false)
class AppointmentModel{
  final int id;
  @JsonKey(name: 'patient_id')
  final String patient;
  @JsonKey(name: 'doctor_id')
  final String doctor;
  @JsonKey(name: 'appointment_date')
  final String appointment_date;
  final String? status;
  final String reason;
  @JsonKey(name: 'start_time')
  final String start_time;
  @JsonKey(name: 'end_time')
  final String end_time;


  AppointmentModel({
    required this.id,
    required this.patient,
    required this.doctor,
    required this.appointment_date,
    required this.status,
    required this.reason,
    required this.start_time,
    required this.end_time,
  });


factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}