// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/screens/dashboard.dart';
import 'package:gyrnal_workout_app/widgets/bottom_navigation_bar.dart';
import 'package:gyrnal_workout_app/screens/settings.dart';
import 'package:gyrnal_workout_app/screens/workouts.dart';
import 'package:gyrnal_workout_app/screens/profile.dart';
import '../widgets/drawer_side_menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // initialise first screen to be home (first index)
  int _selectedScreenIndex = 0;


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


  final List<String> testImagesList = [
    'lib/images/test1.jpg',
    'lib/images/test2.jpg',
    'lib/images/test3.jpg',
    'lib/images/test4.jpg',
  ];

  // widget tree builds home layout with custom appBar with side navigation and
  // custom bottomNavBar
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // drawer menu beside appBar
      drawer: DrawerMenu(),
      // custom appBar
      // appBar: GyrnalAppBar(
      //   title: 'Gyrnal',
      // ),

      body: IndexedStack(
        index: _selectedScreenIndex,
        children: _pageOptions,

      ),

      // Bottom navigation bar
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedScreenIndex,
        onSelectPage: _selectScreen,
      ),
    );
  }
}
