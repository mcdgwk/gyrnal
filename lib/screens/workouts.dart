import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/screens/search_exercise_screen.dart';

// ignore_for_file: prefer_const_constructors

import 'package:gyrnal_workout_app/widgets/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import '../services/exercise_provider.dart';
import '../widgets/drawer_side_menu.dart';
import '../widgets/exercise_widget.dart';

// displays workouts without the function to create a new one
// users can use this when they strictly want to workout
class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  int _selectedScreenIndex = 2;


  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<ExerciseClass>(
      builder: (BuildContext context, myProvider, Widget? child) => Scaffold(
        // custom side navigation drawer
        drawer: DrawerMenu(),
        // appbar with search function
        appBar: AppBar(
          title: const Text('My Workouts'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => SearchExerciseScreen(
                          exercises: myProvider.allExercises)))),
                  child: const Icon(Icons.search)),
            ),
          ],
        ),
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