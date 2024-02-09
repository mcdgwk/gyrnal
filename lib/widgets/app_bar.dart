// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

// appBar to be reused in application
class GyrnalAppBar extends StatelessWidget implements PreferredSizeWidget {

  // title displayed in AppBar
  final String title;

  // constructor
  GyrnalAppBar({
    Key? key,
    // title of screen passed into constructor
    required this.title,
    //  initialises preferredSize of AppBar within Scaffold
  }) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  // overrides default preferredSize
  @override
  final Size preferredSize;


  // build method creates widget tree to be displayed
  @override
  Widget build(BuildContext context) {
    // get theme data
    final ThemeData theme = Theme.of(context);

    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center, // centers  Row's children
        children: [
          Icon(
            // displays dumbbell - potentially remove or replace with a logo todo
            Icons.fitness_center,
            // color: Colors.grey, //todo - change to theme color
            color: theme.primaryColor,
            size: 30.0,
          ),
          SizedBox(width: 7.0), // creates space between dumbbell and Gyrnal
          Text(
            title, // screen title
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: theme.primaryColor
            ),
          ),
        ],
      ),
      centerTitle: true,
      // backgroundColor: Colors.lightGreen.shade800,
      backgroundColor: theme.appBarTheme.backgroundColor,
      //    todo - potentially implement action - side menu/route to homescreen
    );
  }
}
