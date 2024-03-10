// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/screens/create.dart';
import 'package:gyrnal_workout_app/screens/profile.dart';
import '../widgets/drawer_side_menu.dart';
import '../widgets/app_bar.dart';
import 'package:gyrnal_workout_app/screens/workouts.dart';
import 'package:gyrnal_workout_app/screens/dashboard.dart';
import 'package:gyrnal_workout_app/screens/settings.dart';
import 'package:gyrnal_workout_app/widgets/bottom_navigation_bar.dart';


class HealthScreen extends StatefulWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  int _selectedScreenIndex = 4;

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
    // TODO: create healthy eating and lifestyle information page
    return Scaffold(
      // side menu drawer
      drawer: DrawerMenu(),
      // custom appBar
      appBar:GyrnalAppBar(
        title: 'Gyrnal',
      ),
      body: Center(
        child: Text(
          'Health and Well-being Screen',
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

    );
  }
}