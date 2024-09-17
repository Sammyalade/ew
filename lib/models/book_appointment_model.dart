import 'package:json_annotation/json_annotation.dart';

part 'book_appointment_model.g.dart';

@JsonSerializable(includeIfNull: false)
class AppointmentModel{
  final int id;
  @JsonKey(name: 'patient_id')
  final String patientId;
  @JsonKey(name: 'doctor_id')
  final String doctorId;
  @JsonKey(name: 'appointment_date')
  final String appointmentDate;
  final String? status;
  final String reason;
  @JsonKey(name: 'start_time')
  final String startTime;
  @JsonKey(name: 'end_time')
  final String endTime;


  AppointmentModel({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.appointmentDate,
    required this.status,
    required this.reason,
    required this.startTime,
    required this.endTime,
  });


factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}