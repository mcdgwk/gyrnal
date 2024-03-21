import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/models/create_exercise_model.dart';
import 'package:gyrnal_workout_app/services/exercise_provider.dart';
import 'package:provider/provider.dart';
import 'edit_exercise.dart';

// shows recipe information when clicked
// allows users to navigate to edit their custom exercise
class ShowExerciseScreen extends StatelessWidget {
  final CreateExerciseModel createExerciseModel;

  const ShowExerciseScreen({super.key, required this.createExerciseModel});

  @override
  Widget build(BuildContext context) {
    // get theme data
    final ThemeData theme = Theme.of(context);

    // listens for changes
    return Consumer<ExerciseClass>(
        builder: ((context, provider, child) => Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(
                  onTap: () {
                    provider.nameController.text = createExerciseModel.name;
                    provider.weightController.text =
                        createExerciseModel.weight.toString();
                    provider.repsController.text =
                        createExerciseModel.reps.toString();
                    provider.setsController.text =
                        createExerciseModel.sets.toString();
                    provider.restTimeController.text =
                        createExerciseModel.restTime.toString();

                    // pushes to edit exercise screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => EditExerciseScreen(
                                exerciseModel: createExerciseModel))
                        ),
                    );
                  },
                  child: const Icon(Icons.edit)),
              // space between icons
              const SizedBox(
                width: 20,
              ),

              // deletes exercise if bin icon tapped
              InkWell(
                  onTap: () {
                    provider.deleteExercise(createExerciseModel);
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.delete)),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                // displays exercise name
                child: Text(
                  createExerciseModel.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // displays exercise weight
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Text(
                      'Weight:',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${createExerciseModel.weight} kg',
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // displays exercise number of reps container
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Text(
                      'Reps:',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${createExerciseModel.reps}',
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // number of sets container
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Text(
                      'Sets:',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${createExerciseModel.sets}',
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // container containing exercise rest time
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Text(
                      'Rest time:',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${createExerciseModel.restTime} seconds',
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        )));
  }
}
