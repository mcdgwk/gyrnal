import 'dart:io';

import 'package:gyrnal_workout_app/models/create_exercise_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// reference YouTube vide
// https://www.youtube.com/watch?v=dbPrd73CRag

// source code reference
// https://github.com/brhomapps/recipe_book_local_database

// referenced used to create a local database that uses CRUD operations ^^

// reference - https://www.youtube.com/watch?v=dbPrd73CRag

// helper class to save exercises to a database using SQfLite
class DbHelper{
  // database to be initialised later
  late Database database;
  static DbHelper dbHelper = DbHelper();

  // colum names initialised
  final String tableName = 'exercises';
  final String nameColumn = 'name';
  final String idColumn = 'id';
  final String isFavoriteColumn = 'isFavorite';
  final String weightColumn = 'weight';
  final String repsColumn = 'reps';
  final String setsColumn = 'sets';
  final String restTimeColumn = 'restTime';

  // initialised database
  initDatabase() async {
    database = await connectToDatabase();
  }

  // connects to SQflite database or creates one if it does not exist
  Future<Database> connectToDatabase() async {
    // gets directory where database file will be stored
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '$directory/exercises.db';
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        // SQL command to create new table when database first created
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $nameColumn TEXT, $weightColumn INTEGER, $repsColumn INTEGER, $setsColumn INTEGER, $restTimeColumn INTEGER, $isFavoriteColumn INTEGER)');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $nameColumn TEXT, $weightColumn INTEGER, $repsColumn INTEGER, $setsColumn INTEGER, $restTimeColumn INTEGER, $isFavoriteColumn INTEGER)');
      },
      onDowngrade: (db, oldVersion, newVersion) {
        db.delete(tableName);
      },
    );
  }


  // fetches all exercises from database
  Future<List<CreateExerciseModel>> getAllExercises() async {
    List<Map<String, dynamic>> tasks = await database.query(tableName);
    return tasks.map((e) => CreateExerciseModel.fromMap(e)).toList();
  }

  // inserts new exercise into the database
  insertNewExercise(CreateExerciseModel createExerciseModel) {
    database.insert(tableName, createExerciseModel.toMap());
  }

  // deletes item from the database
  deleteExercise(CreateExerciseModel createExerciseModel) {
    database
        .delete(tableName, where: '$idColumn=?', whereArgs: [createExerciseModel.id]);
  }

  // deletes all exercises from the database
  deleteExercises() {
    database.delete(tableName);
  }

  // updates existing table entry
  updateExercises(CreateExerciseModel createExerciseModel) async {
    await database.update(
        tableName,
        {
          isFavoriteColumn: createExerciseModel.isFavorite ? 1 : 0,
          nameColumn: createExerciseModel.name,
          weightColumn: createExerciseModel.weight,
          repsColumn: createExerciseModel.reps,
          setsColumn: createExerciseModel.sets,
          restTimeColumn: createExerciseModel.restTime,
        },
        where: '$idColumn=?',
        whereArgs: [createExerciseModel.id]);
  }

  // toggles favourite status of an exercise (when user clicks heart icon)
  updateIsFavorite(CreateExerciseModel createExerciseModel) {
    database.update(
        tableName, {isFavoriteColumn: !createExerciseModel.isFavorite ? 1 : 0},
        where: '$idColumn=?', whereArgs: [createExerciseModel.id]);
  }
}