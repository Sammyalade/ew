// doctor_model.dart
import 'user_model.dart'; // Import the User model

class DoctorLoginModel {
  final String refreshToken;
  final User user; // Use the imported User model
  final List<dynamic> appointments;
  final List<dynamic> notifications;

  DoctorLoginModel({
    required this.refreshToken,
    required this.user,
    required this.appointments,
    required this.notifications,
  });

  DoctorLoginModel.defaultUser()
      : refreshToken = "",
        user = User.defaultUser(),
        appointments = [],
        notifications = [];

  factory DoctorLoginModel.fromJson(Map<String, dynamic> json) {
    return DoctorLoginModel(
      refreshToken: json['refresh_token'],
      user: User.fromJson(json['user']), // Call the fromJson method of User
      appointments: json['doctor']['appointments'] ?? [],
      notifications: json['doctor']['notifications'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'refresh_token': refreshToken,
      'user': user.toJson(), // Call the toJson method of User
      'doctor': {
        'appointments': appointments,
        'notifications': notifications,
      },
    };
  }
}
