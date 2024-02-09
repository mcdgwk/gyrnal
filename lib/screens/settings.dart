import 'package:flutter/material.dart';
import '../widgets/drawer_side_menu.dart';
// ignore_for_file: prefer_const_constructors
import '../widgets/app_bar.dart';
import 'package:gyrnal_workout_app/widgets/bottom_navigation_bar.dart';
import 'package:gyrnal_workout_app/screens/dashboard.dart';
import 'package:gyrnal_workout_app/screens/workouts.dart';
import 'package:gyrnal_workout_app/screens/profile.dart';


// settings screen
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedScreenIndex = 1;

  // todo - check for better way
  final List<Widget> _pageOptions = [
    //Home(),
    DashboardScreen(),
    SettingsScreen(),
    WorkoutScreen(),
    ProfileScreen(),
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // side menu drawer
      drawer: DrawerMenu(),
      // custom appBar
      appBar:GyrnalAppBar(
        title: 'Gyrnal',
      ),
      body: Center(
        child: Text(
          'Settings Screen',
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

// todo implement settings screen as an extra