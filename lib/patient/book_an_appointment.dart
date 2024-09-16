import 'package:flutter/material.dart';
import 'package:health_eaze/utils/utilities.dart';
import 'package:table_calendar/table_calendar.dart';


class BookAnAppointment extends StatefulWidget {
  const BookAnAppointment({super.key});

  @override
  State<BookAnAppointment> createState() => _BookAnAppointmentState();
}

class _BookAnAppointmentState extends State<BookAnAppointment> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TimeOfDay? _selectedTime;
 
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
            buildCalender(),
            const SizedBox(height: 20),
            buildSelectedDateAndTime(),
            const SizedBox(height: 20),
            buildScheduleButton(),
          ],
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
          firstDay: DateTime.utc(2000, 1, 1),
          lastDay: DateTime.utc(3000, 12, 24),
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay){
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            if(selectedDay.isBefore(DateTime.now())){
              _showDayHasPassedDialog();
            }else{
              selectTime();
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

  void selectTime() async{
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context, 
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null){
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  Widget buildSelectedDateAndTime(){
    if (_selectedDay == null) return const SizedBox.shrink();
    final selectedDate = _selectedDay!.toLocal().toString().split(' ')[0];
    final selectedTime = _selectedTime != null ? _selectedTime!.format(context): 'No time selected'; 
    
    return Text(
      'Selected Day : $selectedDate\n Selected Time : $selectedTime',
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget buildScheduleButton(){
    return ElevatedButton(onPressed: (){
      bool condition = _selectedDay != null && _selectedDay != null;
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

  void _scheduleAppointment(){
    showDialog(context: context, builder: (context){
      final selectedDate = _selectedDay!.toLocal().toString().split(' ')[0];
      final selectedTime = _selectedTime!.format(context);

      return AlertDialog(
        title: const Text('Appointment scheduled!'),
        content: Text('Your Appointment is scheduled for $selectedDate at $selectedTime'),
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
          child: const Text('Confirm'))
        ],
      );
    });
  }
}