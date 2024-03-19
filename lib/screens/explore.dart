// reference - https://www.youtube.com/watch?v=6Gz2J52s7AI
// reference - https://github.com/dragneel2074/search_apilist

// search function taken from Youtube video and GitHub repository listed above ^^
// adjusted to fit application - searches for exercise name

// reference - https://docs.flutter.dev/cookbook/networking/fetch-data
// video used alongside the official Flutter documentation for fetching data from the internet

// ignore_for_file: prefer_const_constructors

// reference - https://www.api-ninjas.com/api/exercises
// above is website where the exercise API is hosted
import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/services/api.dart';
import '../models/exercise_model.dart';
import '../services/api_search.dart';
import '../widgets/bottom_navigation_bar.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

// new instance of FetchExerciseList to obtain getExerciseList()
  FetchExerciseList _exerciseListService = FetchExerciseList();

  // screen navigation index
  int _selectedScreenIndex = 5;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    // get theme data
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        // app bar containing a search icon button
        appBar: AppBar(
          title: Text('Explore exercises',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              color: theme.primaryColor
            ),
          ),
          backgroundColor: theme.appBarTheme.backgroundColor,
          actions: [
            IconButton(
              onPressed: () {
                // uses the SearchExercise delegate
                showSearch(context: context, delegate: SearchExercise());
              },
              icon: Icon(Icons.search_sharp, color: theme.iconTheme.color),
            )
          ],
        ),
        body: Container(
          //  space around all sides of list
          padding: EdgeInsets.all(20),
          child: FutureBuilder<List<ExerciseModel>>(

              // future method gets the exercise list
              future: _exerciseListService.getExerciseList(),
              builder: (context, snapshot) {

                // displays a loading spinner if no data is available yet
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                List<ExerciseModel>? data = snapshot.data;

                // creates a list
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {

                      // wraps each list item in a card
                      return Card(
                        color: theme.cardColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),

                          // displays exercise information
                          child: ListTile(
                            // displays the exercise name
                            title: Text(data?[index].name ?? ''),
                            // displays the targeted muscle group
                            subtitle: Text(data?[index].muscle ?? ''),
                          ),
                        ),
                      );
                    });
              }),
        ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedScreenIndex,
          onSelectPage: _selectScreen,
        ),
      ),
    );
  }
}