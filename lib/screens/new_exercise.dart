import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gyrnal_workout_app/services/exercise_provider.dart';

// screen to create new exercise
class NewExerciseScreen extends StatefulWidget {
  const NewExerciseScreen({super.key});

  @override
  State<NewExerciseScreen> createState() => _NewExerciseScreenState();
}

class _NewExerciseScreenState extends State<NewExerciseScreen> {
    int _selectedScreenIndex = 7;

    void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add New Exercise'),
        ),
        // form for user to create exercise
        body: Consumer<ExerciseClass>(
          // allows user to scroll on screen
          builder: (context, provider, child) => SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  //  exercise name field
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
                  //  weight field
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

                  // number of reps field
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

                  // number of sets field
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

                  // rest time field
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: provider.restTimeController,
                    decoration: InputDecoration(
                        label: const Text('Rest time (seconds)'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // clears form once save button is clicked
                  ElevatedButton(
                    onPressed: () {
                      provider.insertNewExercise();
                      provider.weightController.clear();
                      provider.nameController.clear();
                      provider.repsController.clear();
                      provider.setsController.clear();
                      provider.restTimeController.clear();

                      Navigator.of(context).pop();
                    },
                    child: const Center(child: Text('Save Exercise')),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

