import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/workouts/workout_model.dart';

// file containing pre-made workouts

// takes title of workout and a list of exercises as per the workout model
final List<Workout> preMadeWorkouts= [
  Workout(
      workoutName: 'Pull',
      exercises: [
        'images/exercises/barbell-curl-bicep.png',
        'images/exercises/bicep-curl-dumbbell.png',
        'images/exercises/chest-supported-dumbbell-row.jpg',
        'images/exercises/Dumbbell-Shrug.jpeg',
        'images/exercises/standing-cable-rear-delt-fly.jpeg',
      ])
];
