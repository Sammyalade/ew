import 'package:flutter/material.dart';

Color blackishColor = const Color.fromARGB(255, 55, 59, 68);
Color greenishColor = const Color.fromARGB(255, 117, 192, 195);
Color greyishColor = const Color.fromARGB(255, 231, 246, 251);
Color orangeColor = const Color.fromARGB(255, 254, 97, 90);

TextField inputTextField(Icon icon, String labelText) {
  Color color = Color.fromARGB(255, 55, 59, 68);
  Color greenColor = Color.fromARGB(255, 117, 192, 195);
  return TextField(
    style: TextStyle(color: color),
    decoration: InputDecoration(
      prefixIcon: icon,
      labelText: labelText,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: greenColor)),
      labelStyle: TextStyle(color: color),
      prefixIconColor: color,
    ),
  );
}

ElevatedButton getFormButton(
    BuildContext context, String text, Widget Function(BuildContext) builder) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: builder));
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: blackishColor,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      fixedSize: const Size(500, 60),
      shadowColor: blackishColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              // fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.arrow_forward,
            color: greyishColor,
          )
        ],
      ),
    ),
  );
}

Widget buildSaveButton() {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
        fixedSize: const Size(500, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: greenishColor),
    child: const Text(
      'Save',
      style: TextStyle(fontSize: 18, color: Colors.white),
    ),
  );
}
