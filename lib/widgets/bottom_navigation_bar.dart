// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:gyrnal_workout_app/screens/create.dart';
import 'package:gyrnal_workout_app/screens/explore.dart';
import 'package:gyrnal_workout_app/screens/health.dart';
import 'package:gyrnal_workout_app/screens/workouts.dart';
import 'package:gyrnal_workout_app/screens/profile.dart';
import 'package:gyrnal_workout_app/screens/settings.dart';


// page indexes
//
// 0 - Home
// 1 - settings
// 2 - workouts
// 3 - profile
// 4 - create
// 5 - explore

// todo - check for more pages





class BottomNavBar extends StatefulWidget {

  // index of selected icon in BottomNavBar
  final int selectedIndex;

  // callback function handles icon selection
  final Function(int) onSelectPage;

  // constructor
  const BottomNavBar(
      {Key? key,
        required this.selectedIndex,
        required this.onSelectPage
      }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    // get theme data
    final ThemeData theme = Theme.of(context);
    // bottom navigation widgets
    return BottomNavigationBar(
      // keeps bar in fixed position
      type: BottomNavigationBarType.fixed,
      backgroundColor: theme.primaryColor,
      // todo - change to theme if needed
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.grey,
      iconSize: 25,

      // callback function for icon selection
      onTap: (index) {
        // calls onSelectPage with index of tapped icon
        widget.onSelectPage(index);
        // pushes selected screen to device
        switch (index) {
          case 0:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WorkoutScreen()));
            break;
          case 1:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
            break;
          case 2:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExploreScreen()));
            break;
          case 3:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            break;
          case 4:
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateScreen()));
            // break;
          // case 5:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HealthScreen()));
            break;
        //     todo - add more screens
        }
      },
      items: const [
        // bottom navigation icons
        BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Workout'),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Create'),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore'),
      ],
    );
  }
}

