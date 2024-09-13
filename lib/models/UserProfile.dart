// ignore_for_file: file_names

class UserProfile {
  int id;
  String email;
  String phoneNumber;
  String firstName;
  String username;
  String lastName;
  String role;
  String gender;

  UserProfile({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.username,
    required this.lastName,
    required this.role,
    required this.gender,
  });

  // Default constructor to handle null values
  UserProfile.defaultProfile()
      : id = 0,
        email = 'no-email@example.com',
        phoneNumber = 'Unknown',
        firstName = 'Unknown',
        username = 'Unknown',
        lastName = 'Unknown',
        role = 'User',
        gender = 'Not specified';

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] ?? 0,
      email: json['email'] ?? 'no-email@example.com',
      phoneNumber: json['phone_number'] ?? 'Unknown',
      firstName: json['first_name'] ?? 'Unknown',
      username: json['username'] ?? 'Unknown',
      lastName: json['last_name'] ?? 'Unknown',
      role: json['role'] ?? 'User',
      gender: json['gender'] ?? 'Not specified',
    );
  }
}
