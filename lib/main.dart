// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/screens/explore.dart';
import 'package:gyrnal_workout_app/screens/home.dart';
import 'package:gyrnal_workout_app/screens/main_create_screen.dart';
import 'package:gyrnal_workout_app/screens/new_workout.dart';
import 'package:gyrnal_workout_app/screens/settings.dart';
import 'package:gyrnal_workout_app/screens/favourite_workouts.dart';

import 'package:gyrnal_workout_app/screens/workouts.dart';
import 'package:gyrnal_workout_app/screens/profile.dart';
import 'package:gyrnal_workout_app/services/exercise_provider.dart';
import 'package:gyrnal_workout_app/themes/colour_themes/light_colour_theme.dart';
import 'package:gyrnal_workout_app/services/db_helper.dart';
import 'package:provider/provider.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(const GyrnalApp());
}

class GyrnalApp extends StatelessWidget {
  const GyrnalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider<ExerciseClass>(
          create: (context) => ExerciseClass(),
        ),
          // ChangeNotifierProvider<ItemClass>(
          // create: (context) => ItemClass(),),
        ],
        child: const InitApp());

  }
}

class InitApp extends StatelessWidget {
  const InitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      title: 'Gyrnal',
      initialRoute: '/home',
      routes: {
        '/': (context) => Home(), //base route by default - initialRoute Overrides
        '/home': (context) => Home(),
        '/settings': (context) => SettingsScreen(),
        '/workouts': (context) => WorkoutScreen(),
        '/profile': (context) => ProfileScreen(),
        '/create': (context) => MainCreate(),
        '/explore': (context) => ExploreScreen(),
        '/new_exercise': (context) => NewExerciseScreen(),
        '/favourite_exercises': (context) => FavoriteExercisesScreen(),


      },
    );
  }
}


//     runApp(MaterialApp(
//   // removes debug banner
//   debugShowCheckedModeBanner: false,
//   title: 'Gyrnal',
//   theme: lightTheme,
//   initialRoute: '/home',
//   routes: {
//     '/': (context) => Home(), //base route by default - initialRoute Overrides
//     '/home': (context) => Home(),
//     '/settings': (context) => SettingsScreen(),
//     '/workouts': (context) => WorkoutScreen(),
//     '/profile': (context) => ProfileScreen(),
//     // '/create': (context) => CreateScreen(),
//     '/explore': (context) => ExploreScreen(),
//
//   },
// ));

// page indexes
//
// 0 - Home
// 1 - settings
// 2 - workouts
// 3 - profile
// 4 - create
// 5 - explore

// todo - check for more pages