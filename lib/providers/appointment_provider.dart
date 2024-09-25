import 'package:flutter/material.dart';
import 'package:health_eaze/models/book_appointment_model.dart';

class AppointmentProvider extends ChangeNotifier{
  AppointmentModel appointmentModel = AppointmentModel.defaultModel();
  AppointmentModel get appointment => appointmentModel;

  void setAppointment(AppointmentModel model){
    appointmentModel = model;
    notifyListeners();
  }
}