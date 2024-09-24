import 'package:flutter/material.dart';
import 'package:health_eaze/doctor/appointments.dart';
import 'package:health_eaze/doctor/notifications.dart';
import 'package:health_eaze/utils/utilities.dart';

class Home extends StatelessWidget {
  final String doctorName;
  final String logo = 'asset/images/logos/sus2.png';
  
  const Home({super.key, required this.doctorName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          buildHeader(),
          const SizedBox(height: 20,),
          buildAppointmentSection(context),
           const SizedBox(height: 20,),
          buildNotificationSection(context),
        ],
      ),
    );
  }

    Widget buildHeader(){
     return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            logo,
            height: 50,),
          const SizedBox(width: 10,),
          Text('Hello Dr $doctorName!',
            style: const TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold,
              color: black
            ),
          )
        ],
      ),
     );
  }

   Widget buildAppointmentSection(BuildContext context){
    return GestureDetector(
      onTap: () => _navigateTo(context, const Appointments()),
      child: _buildScheduledAppointmentContainer(context, 'Scheduled appointments', Icons.calendar_month_outlined) ,
    );
  }
  Widget _buildScheduledAppointmentContainer(BuildContext context, String text, IconData icon){
    return Container(
      width: MediaQuery.of(context).size.width -40,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: _buildContainerDecoration(pastelPurple),
      child: _buildContainerContent(text, icon, pastelPurple),
    );
  }

  Widget buildNotificationSection(BuildContext context){
    return GestureDetector(
      onTap: () => _navigateTo(context, const Notifications()),
      child: _buildNotificationContainer(context, 'View your Notifications', Icons.notification_important),
    );
  }

  Widget _buildNotificationContainer(BuildContext context, String text, IconData icon){
    return Container(
       width: MediaQuery.of(context).size.width -40,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: _buildContainerDecoration(pastelGreen),
      child: _buildContainerContent(text, icon, pastelGreen),
    );
  }

  // Widget buildAppointmentSection(BuildContext context){
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.push(
  //         context, MaterialPageRoute(
  //           builder: (context)=> const Appointments(),
  //         ),
  //       );
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width - 40,
  //       height: 100,
  //       margin: const EdgeInsets.symmetric(horizontal: 20),
  //       padding: const EdgeInsets.all(16),
  //       decoration: BoxDecoration(
  //         color: primaryColorBlue,
  //         borderRadius: BorderRadius.circular(12),
  //         boxShadow: [
  //           BoxShadow(
  //             color: primaryColorBlue.withOpacity(0.5),
  //             spreadRadius: 2,
  //             blurRadius: 5,
  //             offset: const Offset(0, 3),
  //           ),
  //         ]
  //       ),
  //        child: const  Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(
  //             Icons.calendar_today, 
  //             color: Colors.white,
  //             size: 30,
  //           ),
  //            SizedBox(width: 10), 
  //           Expanded(
  //             child: Text(
  //               'Book an Appointment',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.white,
  //               ),
  //               textAlign: TextAlign.left,
  //             ),
  //           ),
  //           Icon(
  //             Icons.arrow_forward_ios,
  //             color: Colors.white,
  //              size: 24,
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget buildNotification(BuildContext context){
  //   return GestureDetector(
  //     onTap: (){
  //       Navigator.push(
  //         context, MaterialPageRoute(
  //           builder: (context)=> const Notifications(),
  //         ),
  //       );
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width - 40,
  //       height: 100,
  //       margin: const EdgeInsets.symmetric(horizontal: 20),
  //       padding: const EdgeInsets.all(16),
  //       decoration: BoxDecoration(
  //         color: primaryColorPink,borderRadius: BorderRadius.circular(12),
  //         boxShadow: [
  //           BoxShadow(
  //             color: primaryColorPink.withOpacity(0.5),
  //             spreadRadius: 2,
  //             blurRadius: 5,
  //             offset: const Offset(0, 3), 

  //           )
  //         ]
  //       ),

  //       child: const Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(
  //             Icons.person_outline,
  //             color: Colors.white,
  //             size: 30,
  //           ),
  //           SizedBox(),
  //           Expanded(
  //             child: Text(
  //               'Alerts and notifications',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.white,
  //               ),
  //               textAlign: TextAlign.left,
  //             ),
  //           ),
  //           Icon(
  //             Icons.notification_important,
  //             color: Colors.white,
  //              size: 24,
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  void _navigateTo(BuildContext context, Widget page ) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  BoxDecoration _buildContainerDecoration(Color borderColor) {
  return BoxDecoration(
    color: Colors.white.withOpacity(0.7),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: borderColor, width: 2),
    boxShadow: [
      BoxShadow(
        color: borderColor.withOpacity(0.1),
        spreadRadius: 4,
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );
}


Widget _buildContainerContent(String text, IconData icon, Color iconColor) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: iconColor,
        size: 30,
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: black,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      const Icon(
        Icons.arrow_forward_ios,
        color: black,
        size: 24,
      ),
    ],
  );
}

}