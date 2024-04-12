// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

// initialising dark colour theme for UI black and green.
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFF98EECC),
  secondaryHeaderColor: Color(0xFF66C2A4),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF66C2A4),
  ),
  iconTheme: IconThemeData(
    color: Color(0xFF66C2A4),
  ),
  cardColor: Color(0xFF98EECC),
);

// todo - text themes and expand to match light