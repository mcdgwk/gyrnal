// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

// initialising light colour theme for UI white and green.
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF98EECC),
  secondaryHeaderColor: Color(0xFF66C2A4),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
  ),
  iconTheme: IconThemeData(
    color: Color(0xFF66C2A4), // Your chosen color for icons.
  ),
);


// todo - text themes and check all widgets have theme
// todo - implement dark/light mode for either time of day or preference
// to get theme data
// final ThemeData theme = Theme.of(context);