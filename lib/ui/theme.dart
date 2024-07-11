import 'package:flutter/material.dart';

Color primaryColor = const Color(0xff335f85);
Color secondaryColor = const Color(0xffd9b863);
Color bgColor = const Color(0xfff5f7f6);
ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: bgColor,
  colorSchemeSeed: primaryColor,
  iconTheme: IconThemeData(color: primaryColor),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: primaryColor,
      textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),
      padding: const EdgeInsets.symmetric(vertical: 15),
    ),
  ),

);