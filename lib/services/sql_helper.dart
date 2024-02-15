// https://www.kindacode.com/article/flutter-sqlite/ - reference
// Kinda Code uses a SQL helper class to create a notes app that lets users
// perform CRUD operations in the app (Create Read Update Delete)

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {





  static Future<void> createTables(sql.Database database) async {
    // id: the id of a item (workout)
    // title, description: name and description of your activity
    // created_at: the time that the item (workout) was created. It will be automatically handled by SQLite

    // creates table with an id, title description and timestamp of creation
    // may remove day todo check
    await database.execute("""CREATE TABLE workouts(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        workoutTitle TEXT,
        description TEXT,
        day INTEGER, 
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);

    // create table for exercises
    await database.execute("""
      CREATE TABLE exercises(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        workoutId INTEGER,
        name TEXT,
        sets INTEGER,
        reps INTEGER,
        FOREIGN KEY (workoutId) REFERENCES workouts (id) ON DELETE NO ACTION
      )
    """);
  }

    static Future<sql.Database> db() async {
      return sql.openDatabase(
        'gyrnal.db',
        version: 1,
        onCreate: (sql.Database database, int version) async {
          await createTables(database);
        },
      );
    }

    // Create new item (journal) (workout)

    static Future<int> createWorkout(String workoutTitle, String? description, int day) async {
      final db = await SQLHelper.db();

      final data = {'title': workoutTitle, 'description': description, 'day': day};
      final id = await db.insert('workouts', data,
          conflictAlgorithm: sql.ConflictAlgorithm.replace);
      return id;
    }

    // Read all items (workouts)
    static Future<List<Map<String, dynamic>>> getWorkouts() async {
      final db = await SQLHelper.db();
      return db.query('workouts', orderBy: "id");
    }

    // Read a single item (workout) by id
    // The app doesn't use this method but I put here in case you want to see it
    static Future<List<Map<String, dynamic>>> getWorkout(int id) async {
      final db = await SQLHelper.db();
      return db.query('workouts', where: "id = ?", whereArgs: [id], limit: 1);
    }

    // Update an item (workout) by id
    static Future<int> updateWorkout(
    int id, String title, String? descrption) async {
      final db = await SQLHelper.db();

      final data = {
        'title': title,
        'description': descrption,
        'createdAt': DateTime.now().toString()
      };

      final result =
      await db.update('workouts', data, where: "id = ?", whereArgs: [id]);
      return result;
    }

    // Delete
    static Future<void> deleteWorkout(int id) async {
      final db = await SQLHelper.db();
      try {
        await db.delete("workouts", where: "id = ?", whereArgs: [id]);
      } catch (err) {
        debugPrint("Something went wrong when deleting an workout: $err");
      }
    }
  }

