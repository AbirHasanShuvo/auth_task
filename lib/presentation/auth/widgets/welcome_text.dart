import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget welcomeText(String text, double size, double leftMargin) {
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      margin: EdgeInsets.only(left: leftMargin),
      child: Text(
        text,
        style: GoogleFonts.poppins(fontSize: size, color: Colors.white),
      ),
    ),
  );
}
