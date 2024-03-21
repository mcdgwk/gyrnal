
// exercise model for custom exercises created by users
class CreateExerciseModel {
  int? id;
  // exercise name
  late String name;
  // yes/no if exercise is marked as a user's favourite
  late bool isFavorite;
  // weight of exercise
  late int weight;
  // number of exercise repetitions
  late int reps;
  // number of exercise sets
  late int sets;
  // rest period in between sets
  late int restTime;


  // constructor
  CreateExerciseModel({
    this.id,
    required this.name,
    required this.isFavorite,
    required this.weight,
    required this.reps,
    required this.sets,
    required this.restTime,
  });

  // converts items into a map to be stored in database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isFavorite': isFavorite ? 1 : 0,
      'weight': weight,
      'reps': reps,
      'sets': sets,
      'restTime': restTime,
    };
  }

  // creates instances from map once returned from database
  factory CreateExerciseModel.fromMap(Map<String, dynamic> map) {
    return CreateExerciseModel(
      id: map['id'],
      name: map['name'],
      isFavorite: map['isFavorite'] == 1 ? true : false,
      weight: map['weight'],
      reps: map['reps'],
      sets: map['sets'],
      restTime: map['restTime'],
    );
  }
}
