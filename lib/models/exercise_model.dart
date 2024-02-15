// reference - https://www.youtube.com/watch?v=6Gz2J52s7AI
// reference - https://github.com/dragneel2074/search_apilist

// search function taken from Youtube video and GitHub repository listed above ^^
// adjusted to fit application - searches for exercise name

// reference - https://docs.flutter.dev/cookbook/networking/fetch-data
// video used alongside the official Flutter documentation for fetching data from the internet

// reference - https://www.api-ninjas.com/api/exercises
// above is website where the exercise API is hosted

// To fetch data from the internet a model class must be created along with
// a constructor
// For this app this is the ExerciseModel class

//  holds all the data for each exercise
class ExerciseModel {
  // each variable can hold a value or be null

  String? name; // The name of the exercise. This value can be partial (e.g. press will match Dumbbell Bench Press)
  String? type; // The type of exercise, e.g., cardio, olympic_weightlifting, and plyometrics
  String? muscle; // The main muscle group targeted by the exercise, e.g., biceps, chest
  String? equipment; // The equipment required for the exercise, if any.
  String? difficulty; // The difficulty level of the exercise: beginner, intermediate, expert.
  String? instructions; //  instructions on how to complete the exercise.

// Constructor
  ExerciseModel({
    this.name,
    this.type,
    this.muscle,
    this.equipment,
    this.difficulty,
    this.instructions,
  });

  // constructor that initializes an instance from a JSON map.
  // Assigns each property from the JSON map to the a variable,
  // e.g., Assigns the 'name' property from the JSON map to the 'name' variable and so on.
  ExerciseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    muscle = json['muscle'];
    equipment = json['equipment'];
    difficulty = json['difficulty'];
    instructions = json['instructions'];
  }

  // converts an ExerciseModel instance to a JSON map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['muscle'] = this.muscle;
    data['equipment'] = this.equipment;
    data['difficulty'] = this.difficulty;
    data['instructions'] = this.instructions;
    return data;
  }
}

