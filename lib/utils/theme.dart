import 'package:altfit/utils/theme/custom_appbar_theme.dart';
import 'package:altfit/utils/theme/custom_button_theme.dart';
import 'package:altfit/utils/theme/custom_input_theme.dart';
import 'package:altfit/utils/theme/custom_text_theme.dart';
import 'package:flutter/material.dart';

class AppThemes {
  
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF2100B3), 
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF2100B3),
      onPrimary: Colors.white,
      secondary: Colors.deepPurpleAccent,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    appBarTheme: CustomAppbarTheme.lightTheme,
    textTheme: CustomTextTheme.lightTextTheme,
    inputDecorationTheme: CustomInputTheme.lightTheme,
    elevatedButtonTheme: CustomButtonTheme.lightTheme,

  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF2100B3),
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF2100B3),
      onPrimary: Colors.white,
      secondary: Colors.deepPurpleAccent,
      onSecondary: Colors.black,
      error: Colors.redAccent,
      onError: Colors.black,
      surface: Color.fromARGB(255, 0, 0, 0),
      onSurface: Colors.white,
    ),
    appBarTheme: CustomAppbarTheme.darkTheme,
    textTheme: CustomTextTheme.darkTextTheme,
    inputDecorationTheme: CustomInputTheme.darkTheme,
    elevatedButtonTheme: CustomButtonTheme.darkTheme,
  );
}