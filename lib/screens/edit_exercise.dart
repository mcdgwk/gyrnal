
import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/models/create_exercise_model.dart';
import 'package:provider/provider.dart';
import 'package:gyrnal_workout_app/services/exercise_provider.dart';


// reference YouTube vide
// https://www.youtube.com/watch?v=dbPrd73CRag

// source code reference
// https://github.com/brhomapps/recipe_book_local_database

// referenced used to create a local database that uses CRUD operations ^^


// screen to edit custom exercises
class EditExerciseScreen extends StatefulWidget {
  final CreateExerciseModel exerciseModel;
  const EditExerciseScreen({super.key, required this.exerciseModel});

  @override
  State<EditExerciseScreen> createState() => _EditExerciseScreenState();
}

class _EditExerciseScreenState extends State<EditExerciseScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appbar with a back arrow to allow users to navigate to previous screen
        appBar: AppBar(
          title: const Text('Edit Exercise'),
        ),
        // form to edit exercise
        body: Consumer<ExerciseClass>(
          builder: (context, provider, child) => Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                // allows users to edit exercise name
                TextField(
                  controller: provider.nameController,
                  decoration: InputDecoration(
                      label: const Text('Exercise Name'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(
                  height: 20,
                ),

                // allows users to edit exercise weight
                TextField(
                  keyboardType: TextInputType.number,
                  controller: provider.weightController,
                  decoration: InputDecoration(
                      label: const Text('Weight (kg)'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(
                  height: 20,
                ),

                // allows users to edit number of reps
                TextField(
                  keyboardType: TextInputType.number,
                  controller: provider.repsController,
                  decoration: InputDecoration(
                      label: const Text('Reps'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(
                  height: 20,
                ),

                // allows users to edit number of sets
                TextField(
                  keyboardType: TextInputType.number,
                  controller: provider.setsController,
                  decoration: InputDecoration(
                      label: const Text('Sets'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(
                  height: 20,
                ),

                // allows users to edit rest time
                TextField(
                  keyboardType: TextInputType.number,
                  controller: provider.restTimeController,
                  decoration: InputDecoration(
                      label: const Text('Rest time (seconds)'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(
                  height: 40,
                ),

                // when "Save Changes" button pressed, update any changed form field
                ElevatedButton(
                  onPressed: () {
                    // listens for exercise name changes
                    widget.exerciseModel.name = provider.nameController.text;
                    // listens for weight changes
                    widget.exerciseModel.weight = int.parse(
                        provider.weightController.text != ''
                            ? provider.weightController.text
                            : '0');
                    // listens for rep changes
                    widget.exerciseModel.reps = int.parse(
                        provider.repsController.text != ''
                            ? provider.repsController.text
                            : '0');
                    // listens for set changes
                    widget.exerciseModel.sets = int.parse(
                        provider.setsController.text != ''
                            ? provider.setsController.text
                            : '0');
                    // listens for rest time changes
                    widget.exerciseModel.restTime = int.parse(
                        provider.restTimeController.text != ''
                            ? provider.restTimeController.text
                            : '0');

                    // clears fields once update made
                    provider.updateExercise(widget.exerciseModel);
                    provider.nameController.clear();
                    provider.weightController.clear();
                    provider.repsController.clear();
                    provider.setsController.clear();
                    provider.restTimeController.clear();

                    Navigator.of(context).pop();
                  },
                  child: const Center(child: Text('Save Changes')),
                )
              ],
            ),
          ),
        ),
    );
  }
}
