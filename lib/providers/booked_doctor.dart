
import 'package:flutter/cupertino.dart';
import 'package:health_eaze/models/doctor.dart';

class BookedDoctorProvider extends ChangeNotifier{
  Doctor _bookedDoctor = Doctor.defaultDoctor();

  Doctor get bookedDoctor => _bookedDoctor;

  void updateBookedDoctor(Doctor doctor){
    _bookedDoctor = doctor;
    notifyListeners();
  }
}