import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/models/create_exercise_model.dart';
import 'package:gyrnal_workout_app/widgets/exercise_widget.dart';

// ignore: must_be_immutable

// reference YouTube vide
// https://www.youtube.com/watch?v=dbPrd73CRag

// source code reference
// https://github.com/brhomapps/recipe_book_local_database

// referenced used to create a local database that uses CRUD operations ^^


// allows users to search for exercises
class SearchExerciseScreen extends StatefulWidget {
  // list of all exercises
  final List<CreateExerciseModel> exercises;
  // filtered list of exercises based on search query
  List<CreateExerciseModel> filteredExercises = [];


  SearchExerciseScreen({super.key, required this.exercises}) {
    filteredExercises = exercises;
  }

  @override
  State<SearchExerciseScreen> createState() => _SearchExerciseScreenState();
}

class _SearchExerciseScreenState extends State<SearchExerciseScreen> {
  // filters search based on user input
  void filterExercises(value) {
    setState(() {
      widget.filteredExercises = widget.exercises
          .where((exercise) =>
          // all input to lower case so case sensitivity doesn't matter
          exercise.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          // calls function each time input is changed
          onChanged: (value) {
            filterExercises(value);
          },
          decoration: const InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: "Search Exercise",
              hintStyle: TextStyle(color: Colors.white)),
        ),
        actions: <Widget>[
          // allows user to cancel search and return to previous screen
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
          )
        ],
      ),

      // builds list of exercises if they match the search query
      body: Container(
        padding: const EdgeInsets.all(10),
        child: widget.filteredExercises.isNotEmpty
            ? ListView.builder(
            itemCount: widget.filteredExercises.length,
            itemBuilder: (BuildContext context, int index) {
              return ExerciseWidget(widget.filteredExercises[index]);
            })
            // displays if no matches
            : const Center(
          child: Text('Exercise not found...'),
        ),
      ),
    );
  }
}
