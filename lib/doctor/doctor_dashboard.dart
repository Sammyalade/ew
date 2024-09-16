import 'package:flutter/material.dart';
import 'package:health_eaze/doctor/availability.dart';
import 'package:health_eaze/doctor/home.dart';
import 'package:health_eaze/doctor/messages.dart';
import 'package:health_eaze/doctor/wallet.dart';
import 'package:health_eaze/models/doctor_model.dart';
import 'package:health_eaze/utils/utilities.dart';

class DoctorDashboard extends StatefulWidget {
  final DoctorLoginModel doctorLoginModel;
  const DoctorDashboard({super.key, required this.doctorLoginModel});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  int currentPageIndex = 0;
  String doctorName = '';
  final String logo = 'asset/images/logos/sus2.png';


  @override
  void initState(){
    super.initState();
    doctorName = widget.doctorLoginModel.user.firstName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: currentPageIndex,
                children: [
                  Home(doctorName: doctorName),
                  const Availability(),
                  const Messages(),
                  const Wallet(),
                ],
            ))
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }


  Widget buildBottomNavigationBar(){
    return BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (index){
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: primaryColorBlue,
        selectedItemColor: primaryColorPink,
        unselectedItemColor: black,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Vitals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          )
        ],
    );
  }
}