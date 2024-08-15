// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_eaze/clinic_details.dart';
import 'package:health_eaze/form_fields.dart';
import 'package:health_eaze/qualification_form.dart';
import 'package:health_eaze/registration_details.dart';
import 'package:health_eaze/utils.dart';
import 'package:health_eaze/utils/image_picker.dart';
import 'dart:io';

class RegistrationForm extends StatefulWidget {
  final String specialty;

  const RegistrationForm({required this.specialty});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  File? _profileImage;
  File? _signatureImage;

  // Function to pick image with a bottom sheet for source selection
  Future<void> _pickImage(bool isProfileImage) async {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text('Pick from gallery'),
            onTap: () async {
              Navigator.pop(context);
              File? image =
                  await pickImage(sourceOption: ImageSourceOption.gallery);
              if (image != null) {
                setState(() {
                  if (isProfileImage) {
                    _profileImage = image;
                  } else {
                    _signatureImage = image;
                  }
                });
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Take a photo'),
            onTap: () async {
              Navigator.pop(context);
              File? image =
                  await pickImage(sourceOption: ImageSourceOption.camera);
              if (image != null) {
                setState(() {
                  if (isProfileImage) {
                    _profileImage = image;
                  } else {
                    _signatureImage = image;
                  }
                });
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 15),
                ProfileImageWidget(
                  profileImage: _profileImage,
                  onEdit: () => _pickImage(true),
                ),
                SizedBox(height: 25),
                returnTextField('Full name'),
                SizedBox(height: 10),
                SpecialtyTextField(specialty: widget.specialty),
                SizedBox(height: 10),
                getFormButton(context, 'Educational Qualification', (context)=> QualificationForm()),
                SizedBox(height: 10),
                getFormButton(context, 'Registration Details', (context)=> RegistrationDetails()),
                SizedBox(height: 10),
                getFormButton(context, 'Add Clinic', (context)=> ClinicDetails()),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      labelText: 'Years of Experience',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: blackishColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greenishColor),
                      )),
                ),
                SizedBox(height: 10),
                AboutTextField(),
                SizedBox(height: 10),
                SignatureUploadWidget(
                  signatureImage: _signatureImage,
                  onUpload: () => _pickImage(false),
                ),
                SizedBox(height: 10),
                buildSubmitButton(greenishColor, 'Submit'),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget for Profile Image
class ProfileImageWidget extends StatelessWidget {
  final File? profileImage;
  final VoidCallback onEdit;

  const ProfileImageWidget({
    Key? key,
    required this.profileImage,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 200,
          child: CircleAvatar(
            backgroundColor: greyishColor,
            backgroundImage:
                profileImage != null ? FileImage(profileImage!) : null,
            child: profileImage == null
                ? Icon(
                    Icons.person,
                    size: 150,
                    color: greenishColor,
                  )
                : null,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 4,
          child: GestureDetector(
            onTap: onEdit,
            child: CircleAvatar(
              backgroundColor: greenishColor,
              child: Icon(
                Icons.edit,
                color: greyishColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Widget for Specialty TextField
class SpecialtyTextField extends StatelessWidget {
  final String specialty;

  const SpecialtyTextField({
    Key? key,
    required this.specialty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          labelText: specialty,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: blackishColor),
          ),
          enabled: false,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: greenishColor,
              // style:
            ),
          )),
    );
  }
}

// Widget for About TextField
class AboutTextField extends StatelessWidget {
  const AboutTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      decoration: InputDecoration(
          labelText: 'Write about yourself',
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: blackishColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: greenishColor),
          )),
    );
  }
}

// Widget for Signature Upload
class SignatureUploadWidget extends StatelessWidget {
  final File? signatureImage;
  final VoidCallback onUpload;

  const SignatureUploadWidget({
    Key? key,
    required this.signatureImage,
    required this.onUpload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onUpload,
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: blackishColor),
          borderRadius: BorderRadius.circular(10),
          color: greyishColor.withOpacity(0.2),
        ),
        child: signatureImage != null
            ? Image.file(signatureImage!, fit: BoxFit.cover)
            : Center(
                child: Text(
                  'Tap to upload signature',
                  style: TextStyle(color: greenishColor),
                ),
              ),
      ),
    );
  }
}

Widget buildSubmitButton(Color? buttonColor, String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: greenishColor,
        minimumSize: Size(double.infinity, 50),
        // shadowColor: Colors.black,
        elevation: 10,
      ),
      child: Text(
        'Submit',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    ),
  );
}
