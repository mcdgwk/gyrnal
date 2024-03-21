// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/screens/search_exercise_screen.dart';
import 'package:provider/provider.dart';
import 'package:gyrnal_workout_app/services/exercise_provider.dart';
import 'package:gyrnal_workout_app/widgets/exercise_widget.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/drawer_side_menu.dart';

// displays exercises favourited by user
class FavoriteExercisesScreen extends StatefulWidget {
  const FavoriteExercisesScreen({Key? key}) : super(key: key);


  @override
  State<FavoriteExercisesScreen> createState() => _FavoriteExercisesScreenState();
}

class _FavoriteExercisesScreenState extends State<FavoriteExercisesScreen> {

  int _selectedScreenIndex = 8;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseClass>(

      builder: (BuildContext context, myProvider, Widget? child) {
        return Scaffold(
          // side drawer menu
          drawer: DrawerMenu(),
          appBar: AppBar(
            // title
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('My Exercises'),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Favorite Exercises:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 244, 143, 177),
                  ),
                )
              ],

            ),

            // allows users to search through their favourite exercises
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => SearchExerciseScreen(
                            exercises: myProvider.favoriteExercises)))),
                    child: const Icon(Icons.search)),
              ),
            ],
          ),

          // builds list of favourite exercises and displays on favourite page
          body: ListView.builder(
              itemCount: myProvider.favoriteExercises.length,
              itemBuilder: (context, index) {
                return ExerciseWidget(myProvider.favoriteExercises[index]);
              }),

          // custom bottom navigation bar
          bottomNavigationBar: BottomNavBar(
            selectedIndex: _selectedScreenIndex,
            onSelectPage: _selectScreen,
          ),
        );
      },
    );
  }
}
