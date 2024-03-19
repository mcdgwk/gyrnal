// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/screens/explore.dart';
import 'package:gyrnal_workout_app/screens/health.dart';
import 'package:gyrnal_workout_app/screens/main_create_screen.dart';
import 'package:gyrnal_workout_app/screens/workouts.dart';
import 'package:gyrnal_workout_app/screens/profile.dart';

// custom bottom navigation bar
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

// bottom navigation widget
class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    // get theme data
    final ThemeData theme = Theme.of(context);

    // adds space from bottom and sides from bar
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 7.5, right: 7.5),

      // curves bottom nav rectangle corners
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(25)
        ),
        child: BottomNavigationBar(
        // keeps the bar in a fixed position
        type: BottomNavigationBarType.fixed,
        backgroundColor: theme.primaryColor,

        // icon styling
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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainCreate()));
              break;
            case 2:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExploreScreen()));
              break;
          }
        },
        items: const [
          // bottom navigation icons
          BottomNavigationBarItem(
              // workout page icon
              icon: Icon(Icons.fitness_center),
              label: 'Workout'),

          // create page icon
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'Create'),

          // explore page icon
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Explore'),
        ],
      ),
      ),
    );
  }
}

