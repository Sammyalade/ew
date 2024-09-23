import 'package:flutter/material.dart';
import 'package:health_eaze/doctor/doctor_sign_up.dart';
import 'package:health_eaze/lab/lab_dashboard.dart';
import 'package:health_eaze/pharmacy/pharm_dashboard.dart';
import 'package:health_eaze/services/auth_service.dart';
import 'package:health_eaze/services/sign_up_service.dart';
import 'package:health_eaze/utils/utilities.dart';
import 'package:health_eaze/widgets/sign_in_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String selectedRole = 'PATIENT';
  final SignUpService signUpService = SignUpService();
  final AuthService authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20,),
                buildProgressIndicator(),
                const SizedBox(height: 20,),
                buildTitleText(),
                const SizedBox(height: 8,),
                buildSubtitleText(),
                const SizedBox(height: 40,),
                buildInputFields(),
                const SizedBox(height: 20,),
                buildRoleDropdown(),
                const SizedBox(height: 10,),
                buildTermsAndConditionsText(),
                const SizedBox(height: 10,),
                buildNextButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Sign Up',
        style: TextStyle(
          color: black,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget buildProgressIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSlider(primaryColorBlue),
        const SizedBox(width: 5),
        buildSlider(const Color.fromARGB(255, 231, 246, 251)),
      ],
    );
  }

  Container buildSlider(Color sliderColor) {
    return Container(
      height: 4,
      width: 100,
      decoration: BoxDecoration(
        color: sliderColor,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget buildTitleText() {
    return const Text('');
  }

  Widget buildSubtitleText() {
    return Text(
      "Don't worry, only you can see your personal info, no one else will be able to see it.",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey[600],
      ),
    );
  }

  Widget buildInputFields() {
    return Column(
      children: [
        buildInputField(Icons.person_outline, 'First name', _firstNameController),
        const SizedBox(height: 10),
        buildInputField(Icons.person_outline, 'Last name', _lastNameController),
        const SizedBox(height: 10),
        buildInputField(Icons.phone_outlined, 'Phone', _phoneController),
        const SizedBox(height: 10),
        buildInputField(Icons.favorite_outline, 'Gender', _genderController),
        const SizedBox(height: 10),
        buildInputField(Icons.email_outlined, 'Email', _emailController),
        const SizedBox(height: 10),
        buildPasswordField(_passwordController),
      ],
    );
  }

  Widget buildInputField(IconData icon, String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
    );
  }

  Widget buildPasswordField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: const InputDecoration(
        prefixIcon:  Icon(Icons.lock_outline),
        labelText: 'Password',
        border:  OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }

  Widget buildRoleDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select your role:",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: selectedRole,
          items: ['PATIENT', 'DOCTOR', 'PHARMACY', 'LABORATORY'].map((role) {
            return DropdownMenuItem(
              value: role,
              child: Text(role),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedRole = newValue!;
            });
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget buildTermsAndConditionsText() {
    return Text(
      "By tapping “Continue”, you agree to our Terms & Conditions and Privacy Policy.",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.grey[600]),
    );
  }

  Widget buildNextButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColorBlue,
        padding: const EdgeInsets.symmetric(vertical: 16),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () async {
        setState(() {
          _isLoading = true;
        });
        try {
          if (_formKey.currentState!.validate()) {
            String firstName = _firstNameController.text;
            String lastName = _lastNameController.text;
            String phone = _phoneController.text;
            String gender = _genderController.text;
            String email = _emailController.text;
            String password = _passwordController.text;
            String role = selectedRole;

            await signUpService.signUp(
              firstName: firstName,
              lastName: lastName,
              phone: phone,
              gender: gender,
              email: email,
              password: password,
              role: role,
            );

            await authService.signUp(email, password);

            if (mounted) {
              await _showDialog(context, 'Success', 'Sign up successful');
              navigateToDashboard(context, role);
            }
          }
        } catch (e) {
          if (mounted) {
            await _showDialog(context, 'Error', 'Sign up failed: $e');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Sign up failed: ${e.toString()}')),
            );
          }
        } finally {
          setState(() {
            _isLoading = false;
          });
        }
      },
      child: const Text(
        "Continue",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  void navigateToDashboard(BuildContext context, String role) {
    Widget nextScreen;

    switch (role) {
      case 'DOCTOR':
        nextScreen = const DoctorSpecialityChoices();
        break;
      case 'PHARMACY':
        nextScreen = const PharmDashboard();
        break;
      case 'LAB':
        nextScreen = const LabDashboard();
        break;
      case 'PATIENT':
        nextScreen = const LoginScreen();
      default:
        nextScreen = const LoginScreen();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  Future<void> _showDialog(BuildContext context, String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
