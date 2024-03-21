// reference - https://www.youtube.com/watch?v=6Gz2J52s7AI
// reference - https://github.com/dragneel2074/search_apilist

// search function taken from Youtube video and GitHub repository listed above ^^
// adjusted to fit application - searches for exercise name

// reference - https://docs.flutter.dev/cookbook/networking/fetch-data
// video used alongside the official Flutter documentation for fetching data from the internet

// reference - https://www.api-ninjas.com/api/exercises
// above is website where the exercise API is hosted

// ignore_for_file: prefer_const_constructors

import 'package:gyrnal_workout_app/models/exercise_model.dart';
import 'package:gyrnal_workout_app/services/api.dart';
import 'package:flutter/material.dart';

// Class to search for an exercise - SearchDelegate extended from material.dart
class SearchExercise extends SearchDelegate {
  // new instance of FetchExerciseList to obtain getExerciseList()
  FetchExerciseList _exerciseListService = FetchExerciseList();

  // clears search query when close IconButton pressed
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            // clears content on pressed
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  // builds back arrow in the appBar
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      // pops to previous screen when back arrow pressed
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  // displays results based on the query
  @override
  Widget buildResults(BuildContext context) {
    // FutureBuilder handles the asynchronous fetching of the exercise data
    return FutureBuilder<List<ExerciseModel>>(
        // gets list with query
        future: _exerciseListService.getExerciseList(query: query),
        builder: (context, snapshot) {
          // if snapshot does not have data currently, shows loading circle
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          // gets data list from snapshot
          List<ExerciseModel>? data = snapshot.data;
          return ListView.builder(
            // sets number of elements in listview to the list size
              itemCount: data?.length,
              // build each ListTile
              itemBuilder: (context, index) {
                // returns ListTile for each data item
                return ListTile(
                  // displays exercise name e.g., bicep curl
                  title: Text(data?[index].name ?? ''),
                  // display sthe muscle group that is worked e.g., bicep
                  subtitle: Text(data?[index].muscle ?? ''),
                );
              });
        });
  }

  // displays user prompt before query entered
  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      // user prompt
      child: Text('Search for muscle exercise'),
    );
  }
}
