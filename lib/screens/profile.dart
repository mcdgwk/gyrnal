// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/screens/create.dart';
import 'package:gyrnal_workout_app/screens/health.dart';
import '../widgets/drawer_side_menu.dart';
import '../widgets/app_bar.dart';
import 'package:gyrnal_workout_app/screens/workouts.dart';
import 'package:gyrnal_workout_app/screens/dashboard.dart';
import 'package:gyrnal_workout_app/screens/settings.dart';
import 'package:gyrnal_workout_app/widgets/bottom_navigation_bar.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedScreenIndex = 6;

  final List<Widget> _pageOptions = [
    //Home(),
    DashboardScreen(),
    SettingsScreen(),
    WorkoutScreen(),
    CreateScreen(),
    ProfileScreen(),
    HealthScreen(),
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Define _selectedPageIndex and _selectPage if navigation logic is needed

    return Scaffold(
      // side menu drawer
      drawer: DrawerMenu(),
      // custom appBar
      appBar:GyrnalAppBar(
        title: 'Profile',
      ),
      body: Center(
        child: Text(
          'Profile Screen',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.grey,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedScreenIndex,
        onSelectPage: _selectScreen,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Define action for FAB todo
      //   },
      //   child: const Icon(Icons.add),
      //   backgroundColor: Colors.lightGreen.shade600,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}