import 'package:flutter/material.dart';
import 'package:health_eaze/models/doctor.dart';
import 'package:health_eaze/providers/patient_model_provider.dart';
import 'package:health_eaze/services/book_appointments_service.dart';
import 'package:health_eaze/utils/utilities.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';



class BookAnAppointment extends StatefulWidget {
  final DoctorRequestModel doctor;

  const BookAnAppointment({
    super.key, 
    required this.doctor, 
  
  });

  @override
  State<BookAnAppointment> createState() => _BookAnAppointmentState();
}

class _BookAnAppointmentState extends State<BookAnAppointment> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController reasonController = TextEditingController();

  int? patientId;
  String? reason;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime;

  @override
  void initState(){
    super.initState();   
    _getPatientIdFromState();
  }

void _getPatientIdFromState() {
  final patientProvider = Provider.of<PatientLoginModelProvider>(context, listen: false);
  final patient = patientProvider.patientLoginModel;
  final gottenPatientId = patient.patientDetails?.id;
  patientId = gottenPatientId;
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                buildNewReasonField(),
                const SizedBox(height: 16),
                buildCalender(),
                const SizedBox(height: 20),
                buildStartTimePicker(),
                const SizedBox(height: 20),
                buildEndTimePicker(),
                const SizedBox(height: 20),
                buildScheduleButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNewReasonField(){
     return Material(
    elevation: 4.0,  
    borderRadius: BorderRadius.circular(10),  
    color: Colors.white,  
    child: TextField(
      controller: reasonController,
      decoration: const InputDecoration(
        labelText: 'Reason for appointment',
        filled: true,
        fillColor: Colors.white,  
        border: InputBorder.none,  
        contentPadding: EdgeInsets.all(16.0), 
      ),
    ),
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
          
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
                     
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


  void selectTime({required bool isStartTime}) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _selectedStartTime = pickedTime;
        } else if (_selectedStartTime != null && pickedTime.hour < _selectedStartTime!.hour) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('End time must be after the start time')),
          );
        } 
        else {
          _selectedEndTime = pickedTime;
        }
      });
    }
  }


   Widget buildScheduleButton() {
    return ElevatedButton(
      onPressed: ()=>
        scheduleAppointment(),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(300, 60),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        backgroundColor: primaryColorBlue,
        foregroundColor: Colors.white,
      ),
      child: const Text('Schedule an Appointment'),
    );
  }

   String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }
//   String formatTimeOfDay(TimeOfDay time) {
//   return time.hour.toString().padLeft(2, '0');
// }


  Future <void> scheduleAppointment() async {
    final selectedDate = _selectedDay!.toLocal().toString().split(' ')[0];
    final startTime = formatTimeOfDay(_selectedStartTime!); 
    final endTime = formatTimeOfDay(_selectedEndTime!);
    final reason = reasonController.text.trim(); 

    if(reason.isEmpty){
      showError('Enter a reason');
      return;
    }
    try {
      final bookedAppointment = await BookAppointmentService().bookAppointment( 
        patientId.toString(), widget.doctor.id.toString(), selectedDate, reason, startTime, endTime);
      if (bookedAppointment != null) {
        showConfirmationDialog();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to book appointment: $e')),
      );
    }
  }
    void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void showConfirmationDialog() {
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
