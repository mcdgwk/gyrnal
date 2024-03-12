// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/screens/create.dart';
import 'package:gyrnal_workout_app/screens/explore.dart';
import 'package:gyrnal_workout_app/screens/health.dart';
import '../widgets/drawer_side_menu.dart';
import '../widgets/app_bar.dart';
import 'package:gyrnal_workout_app/widgets/bottom_navigation_bar.dart';
import 'package:gyrnal_workout_app/screens/dashboard.dart';
import 'package:gyrnal_workout_app/screens/workouts.dart';
import 'package:gyrnal_workout_app/screens/profile.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:gyrnal_workout_app/themes/colour_themes/light_colour_theme.dart';

// settings screen ref - https://pub.dev/documentation/settings_ui/latest/
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedScreenIndex = 1;

  // declaring settings state variables
  bool isSwitched = false;
  bool isUsingFingerprint = false;
  bool isCustomTheme = false;
  bool isLockInBackground = true;
  bool isNotificationsEnabled = true;


  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);


    // reference - https://pub.dev/documentation/settings_ui/latest/
    return Scaffold(
      // custom side navigation drawer
      drawer: DrawerMenu(),
      // custom appBar
      appBar:GyrnalAppBar(
        title: 'Settings',
      ),
      // List of Settings Sections - purely conceptual for now
      body: SettingsList(
        sections: [

          // Common Settings section
          SettingsSection(
            title: Text(
              'Common Settings',
              style: TextStyle(color: Theme.of(context).primaryColor,
              ),
            ),
            tiles: [
              // Language tile
              SettingsTile(
                title: Text(
                  'Language',
                  style: TextStyle(color: theme.secondaryHeaderColor),
                ),
                description: Text('English'),
                leading: Icon(
                    Icons.language,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: (BuildContext context) {},
              ),

              // Environment tile
              SettingsTile(
                title: Text(
                  'Environment',
                  style: TextStyle(color: theme.secondaryHeaderColor),
                ),
                description: Text('Production'),
                leading: Icon(
                  Icons.cloud_queue,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: (BuildContext context) {},
              ),

              // Platform tile
              SettingsTile(
                title: Text(
                  'Platform',
                  style: TextStyle(color: theme.secondaryHeaderColor),
                ),
                description: Text('Default'),
                leading: Icon(
                  Icons.smartphone,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: (BuildContext context) {},
              ),

              // Custom theme tile
              SettingsTile.switchTile(
                title: Text(
                  'Enable custom theme',
                  style: TextStyle(color: theme.secondaryHeaderColor),
                ),
                leading: Icon(
                  Icons.palette,
                  color: Theme.of(context).iconTheme.color,
                ),
                initialValue: isCustomTheme,

                activeSwitchColor: Theme.of(context).primaryColor,
                // toggles slider on/off - purely conceptual
                onToggle: (bool value) {
                  setState(() {
                    isCustomTheme = value;
                  });
                },
              ),
            ],
          ),

          // Account section
          SettingsSection(

            title: Text('Account Settings',
              style: TextStyle(color: Theme.of(context).primaryColor,
              ),
            ),
            tiles: [

              // Phone number section
              SettingsTile(
                title: Text(
                  'Phone number',
                  style: TextStyle(color: theme.secondaryHeaderColor),
                ),
                // example number
                description: Text('07777 77777'),
                leading: Icon(
                  Icons.phone,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: (BuildContext context) {},
              ),

              // Email section
              SettingsTile(
                title: Text(
                  'Email',
                  style: TextStyle(color: theme.secondaryHeaderColor),
                ),
                // example email
                description: Text('user-example-email@gmail.com'),
                leading: Icon(
                  Icons.email,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: Text(
                  'Sign out',
                  style: TextStyle(color: theme.secondaryHeaderColor),
                ),
                description: Text('Sign out of your account'),
                leading: Icon(
                  Icons.exit_to_app,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),

          // Security section
          SettingsSection(
            title: Text('Security Settings',
              style: TextStyle(color: Theme.of(context).primaryColor,
              ),
            ),
            tiles: [
              // Lock app tile
              SettingsTile.switchTile(
                title: Text(
                  'Lock app in background',
                  style: TextStyle(color: theme.secondaryHeaderColor),
                ),
                leading: Icon(
                  Icons.phonelink_lock,
                  color: Theme.of(context).iconTheme.color,
                ),
                initialValue: isLockInBackground,
                activeSwitchColor: Theme.of(context).primaryColor,

                // toggles slider on/off - purely conceptual
                onToggle: (bool value) {
                  setState(() {
                    isLockInBackground = value;
                  });
                },
              ),

              // Fingerprint tile
              SettingsTile.switchTile(
                title: Text(
                  'Use fingerprint',
                  style: TextStyle(color: theme.secondaryHeaderColor),
                ),
                leading: Icon(
                  Icons.fingerprint,
                  color: Theme.of(context).iconTheme.color,
                ),

                activeSwitchColor: Theme.of(context).primaryColor,
                // toggles slider on/off - purely conceptual
                initialValue: isUsingFingerprint,
                onToggle: (bool value) {
                  setState(() {
                    isUsingFingerprint = value;
                  });
                },
              ),

              // Change password tile
              SettingsTile(
                title: Text(
                  'Change password',
                  style: TextStyle(color: theme.secondaryHeaderColor),
                ),
                leading: Icon(
                  Icons.lock,
                  color: Theme.of(context).iconTheme.color,
                ),                onPressed: (BuildContext context) {},
              ),

              // Notifications tile
              SettingsTile.switchTile(
                title: Text(
                  'Enable notifications',
                  style: TextStyle(color: theme.secondaryHeaderColor),
                ),
                leading: Icon(
                  Icons.notifications_active,
                  color: Theme.of(context).iconTheme.color,
                ),
                initialValue: isNotificationsEnabled,

                activeSwitchColor: Theme.of(context).primaryColor,
                // toggles slider on/off - purely conceptual
                onToggle: (bool value) {
                  setState(() {
                    isNotificationsEnabled = value;
                  });
                },
              ),
            ],
          ),
          SettingsSection(
            title: Text(
              'Privacy and Security',
              style: TextStyle(color: Theme.of(context).primaryColor,
              ),
            ),
            tiles: [
              // Language tile
              SettingsTile(
                title: Text(
                  'Clear browsing data',
                  style: TextStyle(color: theme.secondaryHeaderColor),
                ),
                description: Text('Clear history, cookies, cache and more'),
                leading: Icon(
                  Icons.delete,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: (BuildContext context) {},
              ),

              // Environment tile
              SettingsTile(
                title: Text(
                  'Cookies and other site data',
                  style: TextStyle(color: theme.secondaryHeaderColor),
                ),
                description: Text('Third-party cookies are blocked in incognito mode'),
                leading: Icon(
                  Icons.web,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: (BuildContext context) {},
              ),

              // Platform tile
              SettingsTile(
                title: Text(
                  'Security',
                  style: TextStyle(color: theme.secondaryHeaderColor),
                ),
                description: Text('Safe Browsing (protection from dangerous sites)'),
                leading: Icon(
                  Icons.security,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: (BuildContext context) {},
              ),

              SettingsTile(
                title: Text(
                  'Site settings',
                  style: TextStyle(color: theme.secondaryHeaderColor),
                ),
                description: Text('Controls what information sites can use and show'),
                leading: Icon(
                  Icons.settings,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: (BuildContext context) {},
              ),

              SettingsTile(
                title: Text(
                  'Privacy Sandbox',
                  style: TextStyle(color: theme.secondaryHeaderColor),
                ),
                description: Text('Trial features are on'),
                leading: Icon(
                  Icons.assured_workload,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
        ],
      ),

      // custom bottom navigation bar
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedScreenIndex,
        onSelectPage: _selectScreen,
      ),
    );
  }
}