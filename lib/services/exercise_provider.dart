// reference YouTube vide
// https://www.youtube.com/watch?v=dbPrd73CRag

// source code reference
// https://github.com/brhomapps/recipe_book_local_database

// referenced used to create a local database that uses CRUD operations ^^

import 'package:flutter/material.dart';
import '../services/db_helper.dart';
import '../models/create_exercise_model.dart';


// contains CRUD (create, read, update, and delete) operations
class ExerciseClass extends ChangeNotifier {

  // loads all exercises
  ExerciseClass() {
    getExercises();
  }

  // TextEditingController to handle form input
  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController repsController = TextEditingController();
  TextEditingController setsController = TextEditingController();
  TextEditingController restTimeController = TextEditingController();

  // list of each exercise instance
  List<CreateExerciseModel> allExercises = [];
  // list of each exercise instance that is favourited by the user
  List<CreateExerciseModel> favoriteExercises = [];

  // gets all exercises from the database and updates interface (read operation)
  getExercises() async {
    allExercises = await DbHelper.dbHelper.getAllExercises();
    favoriteExercises = allExercises.where((e) => e.isFavorite).toList();
    // notifies listeners when updates are needed
    notifyListeners();
  }

  // inserts new exercise into the exercise database (create operation)
  // adds all completed fields to database table
  insertNewExercise() {
    CreateExerciseModel exerciseModel = CreateExerciseModel(
      name: nameController.text,
      // initially set to false
      isFavorite: false,
      weight: int.parse(weightController.text != ''
          ? weightController.text
          : '0'),
      reps: int.parse(repsController.text != ''
          ? repsController.text
          : '0'),
      sets: int.parse(setsController.text != ''
          ? repsController.text
          : '0'),
      restTime: int.parse(restTimeController.text != ''
          ? repsController.text
          : '0'),
    );
    DbHelper.dbHelper.insertNewExercise(exerciseModel);
    getExercises();
  }

  // updates existing exercise in the database (update operation)
  updateExercise(CreateExerciseModel exerciseModel) async {
    await DbHelper.dbHelper.updateExercises(exerciseModel);
    getExercises();
  }

  // updates exercise when isFavourite status changes
  updateIsFavorite(CreateExerciseModel exerciseModel) {
    DbHelper.dbHelper.updateIsFavorite(exerciseModel);
    getExercises();
  }

  // deletes exercise from the database (Delete operation)
  deleteExercise(CreateExerciseModel exerciseModel) {
    DbHelper.dbHelper.deleteExercise(exerciseModel);
    getExercises();
  }
}
