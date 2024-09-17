// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      id: (json['id'] as num).toInt(),
      patientId: json['patient_id'] as String,
      doctorId: json['doctor_id'] as String,
      appointmentDate: json['appointment_date'] as String,
      status: json['status'] as String?,
      reason: json['reason'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'patient_id': instance.patientId,
    'doctor_id': instance.doctorId,
    'appointment_date': instance.appointmentDate,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  val['reason'] = instance.reason;
  val['start_time'] = instance.startTime;
  val['end_time'] = instance.endTime;
  return val;
}
