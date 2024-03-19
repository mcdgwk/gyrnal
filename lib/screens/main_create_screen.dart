// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/screens/new_workout.dart';
import '../widgets/drawer_side_menu.dart';
import 'package:gyrnal_workout_app/widgets/bottom_navigation_bar.dart';
import 'package:gyrnal_workout_app/widgets/exercise_widget.dart';
import 'package:gyrnal_workout_app/services/exercise_provider.dart';
import 'package:gyrnal_workout_app/screens/search_exercise_screen.dart';
import 'package:provider/provider.dart';

// create screen
class MainCreate extends StatefulWidget {
  const MainCreate({super.key});

  @override
  State<MainCreate> createState() => _MainCreateState();
}

class _MainCreateState extends State<MainCreate> {
  int _selectedScreenIndex = 3;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // get theme data
    final ThemeData theme = Theme.of(context);

    return Consumer<ExerciseClass>(
      builder: (BuildContext context, myProvider, Widget? child) => Scaffold(
      // custom side navigation drawer
      drawer: DrawerMenu(),

      appBar: AppBar(
        title: const Text('My Exercises'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            // allows users to search their exercises when search icon is tapped
            child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => SearchExerciseScreen(
                        exercises: myProvider.allExercises)))),
                child: const Icon(Icons.search)),
          ),
        ],
      ),
        // button allows users to create new exercises
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: (() async {
            await Navigator.of(context).push(
              // navigates to newExerciseScreen
              MaterialPageRoute(builder: (context) => NewExerciseScreen()),
            );
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainCreate()));
          }),
          child: const Icon(
              Icons.add,
          ),
        ),
      // list of exercises
      body: ListView.builder(
          itemCount: myProvider.allExercises.length,
          itemBuilder: (context, index) {
            return ExerciseWidget(myProvider.allExercises[index]);
          }),

      // custom bottom navigation bar
    bottomNavigationBar: BottomNavBar(
    selectedIndex: _selectedScreenIndex,
    onSelectPage: _selectScreen,
        ),
      ),
    );
  }
}

