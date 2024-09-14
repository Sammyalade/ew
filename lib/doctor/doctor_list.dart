import 'package:flutter/material.dart';
import 'package:health_eaze/utils/filter_page.dart';
import 'package:health_eaze/utils/search_bar.dart';
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
    return const MaterialApp(
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
  String? _specialty;
  String? _rating;
  String? _name;
  int _feeStart = 1000;
  int _feeEnd = 10000;

  @override
  void initState() {
    super.initState();
    _fetchDoctors();
  }

  void _fetchDoctors() {
    setState(() {
      _futureDoctors = fetchDoctors(
        specialty: _specialty,
        rating: _rating,
        name: _name,
        fee: _feeEnd,
      );
    });
  }

  void onSearchChanged(String searchText) {
    setState(() {
      _name = searchText; // Update the search term
    });
    _fetchDoctors(); // Fetch doctors with the updated search term
  }

  Future<void> openFilterPage() async {
    final filters = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(builder: (context) => FilterPage()),
    );

    if (filters != null) {
      setState(() {
        _specialty = filters['specialty'];
        _rating = filters['rating'];
        _name = filters['name'];
        _feeStart = filters['feeStart'];
        _feeEnd = filters['feeEnd'];
      });
      _fetchDoctors();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Fixed the way SearchBarWidget is used
            SearchBarWidget(
              hintText: 'Search doctor, hospital...',
              onSearch: onSearchChanged, // This is passed as a method reference
            ),
            const SizedBox(height: 16),
            Expanded(
              child: DoctorList(futureDoctors: _futureDoctors),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Doctors'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: openFilterPage,
        ),
      ],
    );
  }
}

class DoctorList extends StatelessWidget {
  final Future<List<Doctor>> futureDoctors;

  const DoctorList({super.key, required this.futureDoctors});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Doctor>>(
      future: futureDoctors,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No doctors found.'));
        } else {
          return buildDoctorGrid(snapshot.data!);
        }
      },
    );
  }

  Widget buildDoctorGrid(List<Doctor> doctors) {
    return GridView.builder(
      itemCount: doctors.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return DoctorCard(doctor: doctor);
      },
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var format =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: 'NGN');

    return InkWell(
      onTap: () => navigateToDoctorDetails(context, doctor),
      child: Container(
        decoration: buildCardDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDoctorAvatar(),
            const SizedBox(height: 10),
            Text(
              '${doctor.userProfile.firstName} ${doctor.userProfile.lastName}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              doctor.specialty,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Text('Fee: ${format.currencySymbol}${doctor.consultationFee}'),
            buildRatingRow(),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildCardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 6,
          spreadRadius: 3,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  CircleAvatar buildDoctorAvatar() {
    return const CircleAvatar(
      backgroundImage: NetworkImage(
          'https://media.istockphoto.com/id/1372002650/photo/cropped-portrait-of-an-attractive-young-female-doctor-standing-with-her-arms-folded-in-the.webp?s=2048x2048&w=is&k=20&c=ySQR61MhpV6FQHDwHtQCygFUzYI87CeWIiMhRw3MCmc='),
      radius: 30,
    );
  }

  Row buildRatingRow() {
    return const Row(
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
    );
  }

  void navigateToDoctorDetails(BuildContext context, Doctor doctor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoctorDetailPage(doctor: doctor),
      ),
    );
  }
}

Future<List<Doctor>> fetchDoctors({
  String? specialty,
  String? rating,
  String? name,
  int? fee,
}) async {
  
  final queryParams = {
    'specialty': specialty,
    'name': name,
    'fee': fee?.toString(),
    'rating': rating,
  }..removeWhere((key, value) => (value?.isEmpty ?? true));

  final uri = Uri.parse('$BASE_URL/doctors/doctors/')
      .replace(queryParameters: queryParams);

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body) as List;
    return jsonResponse.map((doctor) => Doctor.fromJson(doctor)).toList();
  } else {
    throw Exception('Failed to load doctors');
  }
}
