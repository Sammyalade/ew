import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false)
class User {
  final int id;
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
    @JsonKey(name: 'first_name')
  final String firstName;
  final String username;
      @JsonKey(name: 'last_name')
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
  
   Map<String, dynamic> toJson() => _$UserToJson(this);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);


  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //     id: json['id'],
  //     email: json['email'],
  //     phoneNumber: json['phone_number'],
  //     firstName: json['first_name'],
  //     username: json['username'],
  //     lastName: json['last_name'],
  //     role: json['role'],
  //     gender: json['gender'],
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'email': email,
  //     'phone_number': phoneNumber,
  //     'first_name': firstName,
  //     'username': username,
  //     'last_name': lastName,
  //     'role': role,
  //     'gender': gender,
  //   };
  // }
}