import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonTheme {
  static final lightTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF2100B3), 
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );

  static final darkTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor:  Color(0xFF2100B3), 
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );
}