import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputTheme {
  static final lightTheme = InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFDFD9FC), 
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none, 
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.deepPurpleAccent),
      ),
      hintStyle: GoogleFonts.openSans(color: Colors.black, fontSize: 24,),
      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    );


  static final darkTheme = InputDecorationTheme(
      filled: true,
      fillColor: const Color.fromARGB(255, 255, 255, 255), 
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none, 
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.deepPurpleAccent),
      ),
      hintStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    );
}