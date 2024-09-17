// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert'; // For JSON decoding
import '../models/doctor.dart';
import '../services/url_links.dart';
import 'doctor_details.dart';

class DoctorListingApp extends StatelessWidget {
  const DoctorListingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DoctorListingPage(),
    );
  }
}

class DoctorListingPage extends StatefulWidget {
  const DoctorListingPage({super.key});

  @override
  _DoctorListingPageState createState() => _DoctorListingPageState();
}

class _DoctorListingPageState extends State<DoctorListingPage> {
  late Future<List<Doctor>> _futureDoctors;

  @override
  void initState() {
    super.initState();
    _futureDoctors = fetchDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Filter action
            },
          ),
        ],
      ),
      // bottomNavigationBar: NavigationMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search doctor, hospital...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 16),
            // FutureBuilder to handle asynchronous fetching of doctors
            Expanded(
              child: FutureBuilder<List<Doctor>>(
                future: _futureDoctors,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No doctors found.'));
                  } else {
                    return GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        final doctor = snapshot.data![index];
                        return DoctorCard(doctor: doctor);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for displaying a single doctor card
class DoctorCard extends StatelessWidget {
  final Doctor doctor;


  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var format = NumberFormat.simpleCurrency(locale: locale.toString(), name: 'NGN');
    return InkWell(
      onTap: () {
        // Navigate to doctor's profile page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorDetailPage(doctor: doctor),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              spreadRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Doctor image
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://media.istockphoto.com/id/1372002650/photo/cropped-portrait-of-an-attractive-young-female-doctor-standing-with-her-arms-folded-in-the.webp?s=2048x2048&w=is&k=20&c=ySQR61MhpV6FQHDwHtQCygFUzYI87CeWIiMhRw3MCmc='),
              radius: 30,
            ),
            SizedBox(height: 10),
            // Doctor name
            Text(
              '${doctor.userProfile.firstName} ${doctor.userProfile.lastName}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            // Doctor specialty
            Text(
              doctor.specialty,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 5),
            // Doctor rating and reviews
            Text(
              'Fee: ${format.currencySymbol}${doctor.consultationFee}'
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.green, size: 16),
                SizedBox(width: 5),
                Text(
                  '5',
                  style: TextStyle(color: Colors.green),
                ),
                SizedBox(width: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Function to fetch doctors from API
Future<List<Doctor>> fetchDoctors() async {
  final response = await http.get(Uri.parse('$BASE_URL/doctors/doctors'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((doctor) => Doctor.fromJson(doctor)).toList();
  } else {
    throw Exception('Failed to load doctors');
  }
}
