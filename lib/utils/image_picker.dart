import 'dart:io';
import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();

enum ImageSourceOption {
  gallery,
  camera,
}

Future<File?> pickImage({required ImageSourceOption sourceOption}) async {
  ImageSource source = sourceOption == ImageSourceOption.gallery
      ? ImageSource.gallery
      : ImageSource.camera;

  final pickedFile = await _picker.pickImage(source: source);

  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}
