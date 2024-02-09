// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/screens/create.dart';
import 'package:gyrnal_workout_app/screens/explore.dart';
// import pages - todo check for better way
import 'package:gyrnal_workout_app/screens/home.dart';
import 'package:gyrnal_workout_app/screens/settings.dart';
import 'package:gyrnal_workout_app/screens/workouts.dart';
import 'package:gyrnal_workout_app/screens/profile.dart';
import 'package:gyrnal_workout_app/themes/colour_themes/light_colour_theme.dart';




void main() => runApp(MaterialApp(
  title: 'Gyrnal',
  theme: lightTheme,
  initialRoute: '/home',
  routes: {
    '/': (context) => Home(), //base route by default - initialRoute Overrides
    '/home': (context) => Home(),
    '/settings': (context) => SettingsScreen(),
    '/workouts': (context) => WorkoutScreen(),
    '/profile': (context) => ProfileScreen(),
    '/create': (context) => CreateScreen(),
    '/explore': (context) => ExploreScreen(),

  },
));

// page indexes
//
// 0 - Home
// 1 - settings
// 2 - workouts
// 3 - profile
// 4 - create
// 5 - explore

// todo - check for more pages