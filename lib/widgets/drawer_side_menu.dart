// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/screens/health.dart';
import 'package:gyrnal_workout_app/screens/home.dart';
import 'package:gyrnal_workout_app/screens/settings.dart';
import 'package:gyrnal_workout_app/screens/profile.dart';
import 'package:gyrnal_workout_app/screens/workouts.dart';

// Side menu drawer to be reused in multiple screens
class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context); // Get the theme data
    return Drawer(
      backgroundColor: Colors.white,

      // list of menu items
      child: ListView(
        // removes default padding
        padding: EdgeInsets.zero,

        children: [
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25.0),),
            decoration: BoxDecoration(
              // rounds menu header corners
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(1.0),
                bottomRight: Radius.circular(1.0),
              ),
              color: theme.primaryColor,
              // image: DecorationImage(
              // fit: BoxFit.fill, image: AssetImage('assets/images/TODO - INSERT IMAGE),
              // ),
            ),
          ),

          // navigates to Home screen
          ListTile(
            // Home icon
            leading: Icon(Icons.home_filled),
            title: Text('Home'),
            // when home icon tapped navigate to Home Screen
            onTap: () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()))
            },
          ),

          // navigates to Settings screen
          ListTile(
            // Settings icon
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            // when settings icon tapped navigate to the Settings Screen
            onTap: () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SettingsScreen()))
            },
          ),

          // navigates to Workout screen
          ListTile(
            // Workout icon
            leading: Icon(Icons.favorite),
            title: Text('Health and Well-being'),
            // when dumbbell icon tapped navigate to the Health and Well-being screen
            onTap: () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HealthScreen()))
            },
          ),

          // navigates to Profile screen
          ListTile(
            // Profile icon
            leading: Icon(Icons.person),
            title: Text('Profile'),
            // when profile icon tapped navigate to Profile Screen
            onTap: () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen()))
            },
          ),
        ],
      ),
    );
  }
}

// Todo - add more list items if there are more screens

// reference - https://www.youtube.com/watch?v=w81m2dVW0f0