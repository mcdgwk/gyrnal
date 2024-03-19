import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/services/exercise_provider.dart';
import 'package:gyrnal_workout_app/screens/show_exercise.dart';
import 'package:gyrnal_workout_app/models/create_exercise_model.dart';
import 'package:provider/provider.dart';

// custom exercise widget
class ExerciseWidget extends StatelessWidget {
  // based on the create exercise model
  final CreateExerciseModel createExerciseModel;

  // constructor
  const ExerciseWidget(this.createExerciseModel, {super.key});

  @override
  Widget build(BuildContext context) {

    // gets theme data
    final ThemeData theme = Theme.of(context);

    // when widget clicked navigates to show exercise screen
    return InkWell(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => ShowExerciseScreen(createExerciseModel: createExerciseModel))));
      }),
      child: Container(
        decoration: BoxDecoration(
          color:  theme.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: ListTile(
          tileColor: theme.primaryColor,

          // displays exercise name
          title: Text(
            createExerciseModel.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
            ),
          ),
          // displays exercise weight, reps, sets, and rest time needed
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Text('${createExerciseModel.weight} kg'),
              Text('${createExerciseModel.reps} Reps'),
              Text('${createExerciseModel.sets} Sets'),
              Text('${createExerciseModel.restTime} Rest'),
            ],
          ),

          // when heart icon is tapped isFavourite status is changed
          trailing: InkWell(
            onTap: () {
              Provider.of<ExerciseClass>(context, listen: false)
                  .updateIsFavorite(createExerciseModel);
            },
            child: createExerciseModel.isFavorite
                ? const Icon(
              Icons.favorite,
              color: Colors.red,
            )
                : const Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}