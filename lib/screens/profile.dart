// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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


  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  // design reference - https://medium.com/@palmeiro.leonardo/simple-profile-screen-with-flutter-fe2f1f7cfaf5

  @override
  Widget build(BuildContext context) {
   // get theme data
   final ThemeData theme = Theme.of(context);

    return Scaffold(
      // side menu drawer
      drawer: DrawerMenu(),
      // custom appBar
      appBar:GyrnalAppBar(
        title: 'Profile',
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // todo chsnge
                colors: [theme.secondaryHeaderColor, theme.primaryColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.5, 0.9],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: theme.primaryColor,
                      minRadius: 35.0,
                      child: Icon(
                          Icons.account_circle,
                          size: 30.0
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                        // image reference - https://clipground.com/people-working-out-clipart.html
                        AssetImage('assets/john-doe-profile-pic.png'),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: theme.secondaryHeaderColor,
                      minRadius: 35.0,
                      child: Icon(
                          Icons.fitness_center,
                          size: 30.0
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Gym Goer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget> [
                Expanded(child: Container(
                  color: theme.primaryColor,
                  child: ListTile(
                    title: Text(
                      '1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      'Plan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70
                      ),
                    ),
                  ),
                ),
              ),
                Expanded(
                    child: Container(
                      color: theme.secondaryHeaderColor,
                      child: ListTile(
                        title: Text(
                          '3',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          'Workouts',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                ),
            ],
           ),
         ),
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Email',
                    style: TextStyle(
                      color: theme.secondaryHeaderColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'john-example-email-@email.com',
                    style: TextStyle(
                        fontSize: 18
                  ),
                ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Weight',
                    style: TextStyle(
                      color: theme.secondaryHeaderColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '80 kg',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Height',
                    style: TextStyle(
                      color: theme.secondaryHeaderColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '5\' 11\"',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                ),
              ],
            ),
          )
       ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedScreenIndex,
        onSelectPage: _selectScreen,
      ),
    );
  }
}