class User {
  final int id;
  final String email;
  final String phoneNumber;
  final String firstName;
  final String username;
  final String lastName;
  final String role;
  final String gender;

  User({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.username,
    required this.lastName,
    required this.role,
    required this.gender,
  });

  User.defaultUser()
      : id = 0,
        email = '',
        phoneNumber = '',
        firstName = 'Guest',
        username = 'guest',
        lastName = '',
        role = 'PATIENT',
        gender = 'Unknown';


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      firstName: json['first_name'],
      username: json['username'],
      lastName: json['last_name'],
      role: json['role'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'username': username,
      'last_name': lastName,
      'role': role,
      'gender': gender,
    };
  }
}