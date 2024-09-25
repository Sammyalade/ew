import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final String username;
  final String conditionOrSpecialty;
  final String reason;
  final String avatarUrl;
  final String date;
  final String time;

  const AppointmentCard(
      {Key? key,
      required this.username,
      required this.conditionOrSpecialty,
      required this.reason,
      required this.avatarUrl,
      required this.date,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserInfoRow(
              userName: username,
              condition: conditionOrSpecialty,
              visitType: reason,
              avatarUrl: avatarUrl,
            ),
            const SizedBox(height: 16),
            AppointmentInfoRow(
              date: date,
              time: time,
            ),
            const SizedBox(height: 16),
            ActionButtons(
              onReschedule: () {
                // Reschedule action
              },
              onJoinSession: () {
                // Join session action
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfoRow extends StatelessWidget {
  final String userName;
  final String condition;
  final String visitType;
  final String avatarUrl;

  const UserInfoRow({
    Key? key,
    required this.userName,
    required this.condition,
    required this.visitType,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(avatarUrl),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  condition,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    Icons.circle,
                    size: 4,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  visitType,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class AppointmentInfoRow extends StatelessWidget {
  final String date;
  final String time;

  const AppointmentInfoRow({
    Key? key,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD), // Light blue background
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_today,
                color: Colors.orange,
              ),
              const SizedBox(width: 8),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.access_time,
                color: Colors.orange,
              ),
              const SizedBox(width: 8),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  final VoidCallback onReschedule;
  final VoidCallback onJoinSession;

  const ActionButtons({
    Key? key,
    required this.onReschedule,
    required this.onJoinSession,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton(
          onPressed: onReschedule,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            side: const BorderSide(color: Color(0xFF673AB7)),
          ),
          child: const Text(
            'Reschedule',
            style: TextStyle(
              color: Color(0xFF673AB7), // Deep purple
              fontSize: 16,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onJoinSession,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            backgroundColor: const Color(0xFF673AB7), // Deep purple
          ),
          child: const Text(
            'Join Session',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
