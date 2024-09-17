import 'package:flutter/material.dart';
import 'package:health_eaze/models/book_appointment_model.dart';
import 'package:health_eaze/models/doctor.dart';
import 'package:health_eaze/models/patient.dart';
import 'package:health_eaze/services/book_appointments_service.dart';
import 'package:health_eaze/utils/utilities.dart';
import 'package:table_calendar/table_calendar.dart';


class BookAnAppointment extends StatefulWidget {
  final Doctor doctor;
  final PatientLoginModel patientLoginModel;

  const BookAnAppointment({
    super.key, 
    required this.doctor, 
    required this.patientLoginModel
  });

  @override
  State<BookAnAppointment> createState() => _BookAnAppointmentState();
}

class _BookAnAppointmentState extends State<BookAnAppointment> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final _formKey = GlobalKey<FormState>();
  late int _patientId;
  String? _reason;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime;

  @override
  void initState(){
    super.initState();
    _patientId = _getPatientId();
    
  }

int _getPatientId() {
  if (widget.patientLoginModel.refreshToken.isNotEmpty) {
    final patientDetails = widget.patientLoginModel.patientDetails;
    
    if (patientDetails != null) {
      return patientDetails.id;
    } else {
      throw Exception('Patient details or ID is null');
    }
  } else {
    throw Exception('Patient not logged in');
  }
}

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColorBlue,
      appBar: AppBar(
        backgroundColor: secondaryColorBlue,
        title: const Text('Book appointment',
        style: TextStyle(
          color: black,
        ),
        ),centerTitle: true,
      ),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildReasonInput(),
            const SizedBox(height: 16,),
            buildCalender(),
            const SizedBox(height: 20),
            buildStartTimePicker(),
            const SizedBox(height: 20),
            buildEndTimePicker(),
            const SizedBox(height: 20),
            buildSelectedDateAndTime(),
            const SizedBox(height: 20),
            buildScheduleButton(),
          ],
        ),
      ),
    );
  }

  Widget buildReasonInput(){
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Reason for appointment'),
      validator: (value){
        if(value== null || value.isEmpty){
          return 'Please enter a reason';
        }
         _reason = value;
        return null;
      },
    );
  }



  Widget buildCalender(){
    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: TableCalendar(
          focusedDay: _focusedDay, 
          firstDay: DateTime.now(),
          lastDay: DateTime.utc(3000, 12, 24),
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
            _calendarFormat = format;
            });
          },
          selectedDayPredicate: (day) =>
           isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay){
          
            if(selectedDay.isBefore(DateTime.now())){
              _showDayHasPassedDialog();
            }else{
              setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            }
            
          },
          calendarStyle: const CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: primaryColorBlue,
              shape: BoxShape.circle, 
            ),
            todayDecoration: BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            )
          ),
        ),
      ),
    );
  }

   Widget buildStartTimePicker() {
    return ListTile(
      title: const Text('Select Start Time'),
      subtitle: Text(_selectedStartTime != null
          ? _selectedStartTime!.format(context)
          : 'No time selected'),
      trailing: const Icon(Icons.access_time),
      onTap: () => selectTime(isStartTime: true),
    );
  }

  Widget buildEndTimePicker() {
    return ListTile(
      title: const Text('Select End Time'),
      subtitle: Text(_selectedEndTime != null
          ? _selectedEndTime!.format(context)
          : 'No time selected'),
      trailing: const Icon(Icons.access_time),
      onTap: () => selectTime(isStartTime: false),
    );
  }

  void _showDayHasPassedDialog(){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: const Text('Invalid Date'),
          content: const Text('You cannot schedule appointment on a previous day.'),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white, 
              textStyle: const TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold
              )
            ),
            child: const Text('OK'))
          ],
        );
      }
    );
  }

  void selectTime({required bool isStartTime}) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _selectedStartTime = pickedTime;
        } else {
          _selectedEndTime = pickedTime;
        }
      });
    }
  }

  Widget buildSelectedDateAndTime(){
    if (_selectedDay == null) return const SizedBox.shrink();
    final selectedDate = _selectedDay!.toLocal().toString().split(' ')[0];
    final selectedTime = _selectedStartTime != null ? _selectedStartTime!.format(context): 'No time selected'; 
    
    return Text(
      'Selected Day : $selectedDate\n Selected Time : $selectedTime',
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget buildScheduleButton(){
    return ElevatedButton(onPressed: (){
      bool condition = _formKey.currentState!.validate() && _selectedDay != null && _selectedStartTime != null && _selectedEndTime != null;
      if (condition){
        _scheduleAppointment();
      }else {
        ScaffoldMessenger.of(context).showSnackBar( 
          const SnackBar(content: Text('please select a date and time'),),
        );
      }
    },
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(300, 60),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      backgroundColor: primaryColorBlue,
      foregroundColor: Colors.white,
    ),
     child: const Text('Schedule an Appointment'),);
  }

  void _scheduleAppointment() async {
    final selectedDate = _selectedDay!.toLocal().toString().split(' ')[0];
    final startTime = _selectedStartTime!.format(context);
    final endTime = _selectedEndTime!.format(context);

    final appointmentModel = AppointmentModel(
      id: 0, // You might want to handle the ID on the backend side
      patientId: _patientId.toString(),
      doctorId: widget.doctor.id.toString(),
      appointmentDate: selectedDate,
      status: null,
      reason: _reason!,
      startTime: startTime,
      endTime: endTime,
    );

    try {
      final bookedAppointment = await BookAppointmentService().bookAppointment(appointmentModel);
      if (bookedAppointment != null) {
        _showConfirmationDialog();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to book appointment: $e')),
      );
    }
  }

  void _showConfirmationDialog() {
    final selectedDate = _selectedDay!.toLocal().toString().split(' ')[0];
    final selectedStartTime = _selectedStartTime!.format(context);
    final selectedEndTime = _selectedEndTime!.format(context);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Appointment Scheduled!'),
          content: Text(
              'Your appointment is scheduled for $selectedDate from $selectedStartTime to $selectedEndTime'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Confirm'),
            )
          ],
        );
      },
    );
  }
}