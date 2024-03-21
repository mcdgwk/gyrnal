import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gyrnal_workout_app/services/exercise_provider.dart';
import 'package:gyrnal_workout_app/widgets/exercise_widget.dart';

// reference YouTube vide
// https://www.youtube.com/watch?v=dbPrd73CRag

// source code reference
// https://github.com/brhomapps/recipe_book_local_database

// referenced used to create a local database that uses CRUD operations ^^


// lists all exercises
class AllExercisesScreen extends StatelessWidget {
  const AllExercisesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // consumer class listen for changes -> any updates to exercise list
    return Consumer<ExerciseClass>(
      builder: (BuildContext context, provider, Widget? child) {
        // listview builds exercise list
        return ListView.builder(
            itemCount: provider.allExercises.length,
            itemBuilder: (context, index) {
              // for each exercise, the ExerciseWidget displays the exercise information
              return ExerciseWidget(provider.allExercises[index]);
            });
      },
    );
  }
}
