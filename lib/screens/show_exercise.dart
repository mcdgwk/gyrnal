import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/models/create_exercise_model.dart';
import 'package:gyrnal_workout_app/services/exercise_provider.dart';
import 'package:provider/provider.dart';

import 'edit_recipe_screen.dart';

// shows on clicked recipe
class ShowRecipeScreen extends StatelessWidget {
  final RecipeModel recipeModel;

  const ShowRecipeScreen({super.key, required this.recipeModel});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeClass>(
        builder: ((context, provider, child) => Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(
                  onTap: () {
                    provider.nameController.text = recipeModel.name;
                    provider.weightController.text =
                        recipeModel.weight.toString();
                    provider.repsController.text =
                        recipeModel.reps.toString();
                    provider.setsController.text =
                        recipeModel.sets.toString();
                    provider.restTimeController.text =
                        recipeModel.restTime.toString();
                    // provider.ingredientsController.text =
                    //     recipeModel.ingredients;
                    // provider.instructionsController.text =
                    //     recipeModel.instructions;
                    // provider.image = recipeModel.image;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => EditRecipeScreen(
                                recipeModel: recipeModel))));
                  },
                  child: const Icon(Icons.edit)),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                  onTap: () {
                    provider.deleteRecipe(recipeModel);
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.delete)),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  recipeModel.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: !Provider.of<RecipeClass>(context).isDark
                        ? Colors.blue[100]
                        : null,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Text(
                      'Weight:',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${recipeModel.weight} kg',
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: !Provider.of<RecipeClass>(context).isDark
                        ? Colors.blue[100]
                        : null,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Text(
                      'Reps:',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${recipeModel.reps}',
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: !Provider.of<RecipeClass>(context).isDark
                        ? Colors.blue[100]
                        : null,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Text(
                      'Reps:',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${recipeModel.reps}',
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: !Provider.of<RecipeClass>(context).isDark
                        ? Colors.blue[100]
                        : null,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Text(
                      'Sets:',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${recipeModel.sets}',
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: !Provider.of<RecipeClass>(context).isDark
                        ? Colors.blue[100]
                        : null,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Text(
                      'Rest time:',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${recipeModel.restTime} seconds',
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.all(10),
              //   decoration: BoxDecoration(
              //       color: !Provider.of<RecipeClass>(context).isDark
              //           ? Colors.blue[100]
              //           : null,
              //       borderRadius: BorderRadius.circular(10)),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Text(
              //         'Ingredients',
              //         style: TextStyle(
              //             fontSize: 16, fontWeight: FontWeight.bold),
              //       ),
              //       const SizedBox(
              //         height: 20,
              //       ),
              //       Text(
              //         recipeModel.ingredients,
              //         style: const TextStyle(fontSize: 26),
              //       )
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.all(10),
              //   decoration: BoxDecoration(
              //       color: !Provider.of<RecipeClass>(context).isDark
              //           ? Colors.blue[100]
              //           : null,
              //       borderRadius: BorderRadius.circular(10)),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Text(
              //         'Instructions',
              //         style: TextStyle(
              //             fontSize: 16, fontWeight: FontWeight.bold),
              //       ),
              //       const SizedBox(
              //         height: 20,
              //       ),
              //       Text(
              //         recipeModel.instructions,
              //         style: const TextStyle(fontSize: 26),
              //       )
              //     ],
              //   ),
              // ),
            ]),
          ),
        )));
  }
}
