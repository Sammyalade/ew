import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String content;
  final Color? backgroundColor;
  final Color? iconColor;
  final Function() action;

  const ActionButton({
    required this.icon,
    required this.label,
    required this.content,
    required this.backgroundColor,
    required this.iconColor,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )

                ),
                Text(
                  content,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.nunito(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
