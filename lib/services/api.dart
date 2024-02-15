// reference - https://www.youtube.com/watch?v=6Gz2J52s7AI
// reference - https://github.com/dragneel2074/search_apilist

// search function taken from Youtube video and GitHub repository listed above ^^
// adjusted to fit application - searches for exercise name

// reference - https://docs.flutter.dev/cookbook/networking/fetch-data
// video used alongside the official Flutter documentation for fetching data from the internet

// reference - https://www.api-ninjas.com/api/exercises
// above is website where the exercise API is hosted

import 'dart:convert'; // dart library needed for encoding and decoding JSON
import 'package:http/http.dart' as http;
import 'package:gyrnal_workout_app/models/exercise_model.dart';

// fetches list of exercises along with their properties from the API
class FetchExerciseList {
  // empty list that will hold fetched data
  var data = [];
  // empty list that will hold parsed results
  List<ExerciseModel> results = [];
  // exercise api URL
  String urlList = 'https://api.api-ninjas.com/v1/exercises';

  // function to get the exercise list from api
  Future<List<ExerciseModel>> getExerciseList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      // performs HTTP get request to api, unique api key is required as the header
      var response = await http.get(url, headers: {'X-Api-Key': 'n8sAtWzLfndazvkgXieKvCNjNfUnl04UzwFNN0Hf'});

      // if OK response with a status code of 200
      if (response.statusCode == 200) {
        // decode response into a list (dynamic)
        data = json.decode(response.body);
        // Map each JSON object in the list to an ExerciseModel and convert to a list
        // Transforms each JSON object into instance of ExerciseModel and convert to a list
        results = data.map((e) => ExerciseModel.fromJson(e)).toList();
        // if query is not null
        if (query != null) {
          // filter results to include all exercises that match query String
          results = results.where((element) =>
          element.name?.toLowerCase().contains(query.toLowerCase()) ?? false
          ).toList();
        }
        // otherwise, if not an OK response with a status code of 200
      } else {
        // print error message
        print("Fetch error");
      }
      // print out exception if one occurs
    } on Exception catch (e) {
      print('Error: $e');
    }
    return results;
  }
}
