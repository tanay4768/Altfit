import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {

    static final TextTheme lightTextTheme = GoogleFonts.openSansTextTheme(
    ThemeData.light().textTheme.copyWith(
        displayLarge: const TextStyle(fontSize: 57, fontWeight: FontWeight.bold, color: Colors.black),
        displayMedium: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black),
        displaySmall: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
        headlineMedium: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        headlineSmall: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
        titleLarge: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        titleSmall: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black54),
        bodyLarge: const TextStyle(fontSize: 16, color: Colors.black),
        bodyMedium: const TextStyle(fontSize: 14, color: Colors.black54),
        bodySmall: const TextStyle(fontSize: 12, color: Colors.black54),
        labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
        labelMedium: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
        labelSmall: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );

  static final TextTheme darkTextTheme = GoogleFonts.openSansTextTheme(
    ThemeData.dark().textTheme.copyWith(
          displayLarge: const TextStyle(fontSize: 57, fontWeight: FontWeight.bold, color: Colors.white),
          displayMedium: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
          displaySmall: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
          headlineMedium: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          headlineSmall: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          titleLarge: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          titleSmall: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white70),
          bodyLarge: const TextStyle(fontSize: 16, color: Colors.white),
          bodyMedium: const TextStyle(fontSize: 14, color: Colors.white70),
          bodySmall: const TextStyle(fontSize: 12, color: Colors.white70),
          labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
          labelMedium: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
          labelSmall: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white),
        ),
  );
}