// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Adjust if needed


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () =>  NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.favorite), label: 'Vitals'),
            NavigationDestination(icon: Icon(Icons.message), label: 'Messages'),
            NavigationDestination(
                icon: Icon(Icons.account_balance_wallet), label: 'Wallet')
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends  GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    // PatientDashboard(),
    // Container(color: Colors.green),
    Container(color: Colors.amber),
    Container(color: Colors.blue),
    Container(color: Colors.pink)
  ];
}
