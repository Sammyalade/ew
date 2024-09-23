// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      id: (json['id'] as num).toInt(),
      patient: json['patient_id'] as String,
      doctor: json['doctor_id'] as String,
      appointment_date: json['appointment_date'] as String,
      status: json['status'] as String?,
      reason: json['reason'] as String,
      start_time: json['start_time'] as String,
      end_time: json['end_time'] as String,
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'patient_id': instance.patient,
    'doctor_id': instance.doctor,
    'appointment_date': instance.appointment_date,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  val['reason'] = instance.reason;
  val['start_time'] = instance.start_time;
  val['end_time'] = instance.end_time;
  return val;
}
