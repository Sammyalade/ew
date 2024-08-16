import 'package:flutter/material.dart';
import 'package:health_eaze/utilities.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor\'s Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
      routes: {
        '/patients': (context) => const PatientScreen(),
        '/appointments': (context) => const AppointmentScreen(),
        '/wallet': (context) => const WalletScreen(),
      },
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isBalanceVisible = true;

  void _toggleBalanceVisibility() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double walletBalance = 1234.56;

    return Scaffold(
      appBar: AppBar(
      ),
      backgroundColor: Colors.lightBlue[50],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(117, 192, 195, 2.0),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Patient List'),
              onTap: () {
                Navigator.pushNamed(context, '/patients');
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Appointment Schedule'),
              onTap: () {
                Navigator.pushNamed(context, '/appointments');
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('Wallet Board'),
              onTap: () {
                Navigator.pushNamed(context, '/wallet');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Hey, Dr. Smith!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Today is not so busy',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: <Widget>[
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          size: 60,
                          color: Colors.grey
                        ),
                        SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget> [
                            Text('Alice HighTower',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Migrane'),
                                SizedBox(width: 10),
                                Text('Online Visit')
                              ]
                            ),
                          ],
                        )
                      ]
                  ),
                  Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.pink.shade50,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_month),
                              Text('Monday, August 22nd')
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.alarm),
                              Text('11:00am - 12:00pm')
                            ],
                          )
                        ],
                      )
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.grey,
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        child: const Text('Reschedule',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {

                        },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: const Color.fromRGBO(117, 192, 195, 2.0),
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        child: const Text('Join Session',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Quick Actions Section
            const Text(
              'Quick Actions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Patient List'),
                    onTap: () {
                      Navigator.pushNamed(context, '/patients');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: const Text('Appointment Schedule'),
                    onTap: () {
                      Navigator.pushNamed(context, '/appointments');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient List'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColorBlue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Appointment Schedule'),
              onTap: () {
                Navigator.pushNamed(context, '/appointments');
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('Wallet Board'),
              onTap: () {
                Navigator.pushNamed(context, '/wallet');
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(title: Text('Patient 1')),
          ListTile(title: Text('Patient 2')),
          ListTile(title: Text('Patient 3')),
          // Add more patients here
        ],
      ),
    );
  }
}

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Schedule'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColorBlue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Patient List'),
              onTap: () {
                Navigator.pushNamed(context, '/patients');
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('Wallet Board'),
              onTap: () {
                Navigator.pushNamed(context, '/wallet');
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(title: Text('Appointment 1: 9:00 AM')),
          ListTile(title: Text('Appointment 2: 10:30 AM')),
          ListTile(title: Text('Appointment 3: 1:00 PM')),
          // Add more appointments here
        ],
      ),
    );
  }
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example wallet balance
    const double walletBalance = 1234.56;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet Board'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColorBlue,
              ),
              child: Text(
                'Doctor\'s Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Patient List'),
              onTap: () {
                Navigator.pushNamed(context, '/patients');
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Appointment Schedule'),
              onTap: () {
                Navigator.pushNamed(context, '/appointments');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Wallet Balance',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              '\$${walletBalance.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Add functionality to add funds
                  },
                  child: const Text('Add Funds'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add functionality to withdraw funds
                  },
                  child: const Text('Withdraw Funds'),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            const Text(
              'Transaction History:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: const <Widget>[
                  ListTile(
                    title: Text('Transaction 1: +\$100.00'),
                    subtitle: Text('2024-08-15'),
                  ),
                  ListTile(
                    title: Text('Transaction 2: -\$50.00'),
                    subtitle: Text('2024-08-10'),
                  ),
                  ListTile(
                    title: Text('Transaction 3: +\$200.00'),
                    subtitle: Text('2024-08-05'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
