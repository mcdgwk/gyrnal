import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/models/create_exercise_model.dart';
import 'package:gyrnal_workout_app/services/exercise_provider.dart';
import 'package:provider/provider.dart';
import 'edit_exercise.dart';
import 'dart:async';


// reference YouTube vide
// https://www.youtube.com/watch?v=dbPrd73CRag

// source code reference
// https://github.com/brhomapps/recipe_book_local_database

// referenced used to create a local database that uses CRUD operations ^^


// shows exercise information when clicked
// allows users to navigate to edit their custom exercise


// https://letmeflutter.com/how-to-create-our-own-flutter-timer/
// timer reference ^^

class ShowExerciseScreen extends StatefulWidget {
  final CreateExerciseModel createExerciseModel;


  const ShowExerciseScreen({super.key, required this.createExerciseModel});

  @override
  State<ShowExerciseScreen> createState() => _ShowExerciseScreenState();
}

class _ShowExerciseScreenState extends State<ShowExerciseScreen> {

  Timer? timer;

  // List hoursList = [];
  List minutesList = [];
  List secondsList = [];

  // String? hoursVal;
  String? minutesVal;
  String? secondsVal;

  // int hours = 0;
  int minutes = 0;
  int seconds = 0;

  String displayTime = '00:00:00';

  runTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds = seconds - 1;
      }
      if (seconds == 0) {
        if (minutes > 0) {
          minutes = minutes - 1;
          seconds = 60;
        }
      }
      // if (minutes == 0) {
      //   if (hours > 0) {
      //     hours = hours - 1;
      //     minutes = 60;
      //   }
      // }

      String result =
          // '${hours < 10 ? '0' : ''}'
          // '$hours : ${minutes < 10 ? '0' : ''}'
          '$minutes : ${seconds < 10 ? '0' : ''}$seconds';
      displayTime = result;
      setState(() {});
    });
  }

  stopTimerr() {
    timer!.cancel();
    setState(() {});
  }

  resetTimerr() {
    stopTimerr();
    // hours = 0;
    minutes = 0;
    seconds = 0;
    // hoursVal = '0';
    minutesVal = '0';
    secondsVal = '0';
    displayTime = '00:00:00';
    setState(() {});
  }

  @override
  void initState() {

    // for (int i = 0; i < 25; i++) {
    //   hoursList.add(i.toString());
    // }

    for (int i = 0; i < 61; i++) {
      minutesList.add(i.toString());
    }

    for (int i = 0; i < 61; i++) {
      secondsList.add(i.toString());
    }

    setState(() {});
    super.initState();
  }

  @override
  void dispose(){
    stopTimerr();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // get theme data
    final ThemeData theme = Theme.of(context);

    // listens for changes
    return Consumer<ExerciseClass>(
        builder: ((context, provider, child) => Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(
                  onTap: () {
                    provider.nameController.text = widget.createExerciseModel.name;
                    provider.weightController.text =
                        widget.createExerciseModel.weight.toString();
                    provider.repsController.text =
                        widget.createExerciseModel.reps.toString();
                    provider.setsController.text =
                        widget.createExerciseModel.sets.toString();
                    provider.restTimeController.text =
                        widget.createExerciseModel.restTime.toString();

                    // pushes to edit exercise screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => EditExerciseScreen(
                              exerciseModel: widget.createExerciseModel)
                          )
                      ),
                    );
                  },
                  child: const Icon(Icons.edit)),
              // space between icons
              const SizedBox(
                width: 20,
              ),

              // deletes exercise if bin icon tapped
              InkWell(
                  onTap: () {
                    provider.deleteExercise(widget.createExerciseModel);
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
                // displays exercise name
                child: Text(
                  widget.createExerciseModel.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // displays exercise weight
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
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
                      '${widget.createExerciseModel.weight} kg',
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // displays exercise number of reps container
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
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
                      '${widget.createExerciseModel.reps}',
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // number of sets container
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
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
                      '${widget.createExerciseModel.sets}',
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // container containing exercise rest time
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
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
                      '${widget.createExerciseModel.restTime} seconds',
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // Flutter timer
                  Text(
                    displayTime,
                    style: TextStyle(
                      color: timer == null ? Colors.grey : Colors.blue,
                      fontSize: 60,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Column(
                        children: [
                          Text(
                            'Minutes',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            width: 70,
                            height: 35,
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey, width: .5)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  isExpanded: true,
                                  hint: Text(
                                    'Select',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  value: minutesVal,
                                  items: [
                                    for (int i = 0; i < minutesList.length; i++)
                                      DropdownMenuItem(
                                          value: minutesList[i],
                                          child: Text(minutesList[i].toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey.shade600))),
                                  ],
                                  onChanged: (val) {
                                    setState(() {
                                      minutesVal = val.toString();
                                      minutes = int.parse(minutesVal!);
                                    });
                                  }),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Text(
                            'Seconds',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            width: 70,
                            height: 35,
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey, width: .5)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  isExpanded: true,
                                  hint: Text(
                                    'Select',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  value: secondsVal,
                                  items: [
                                    for (int i = 0; i < secondsList.length; i++)
                                      DropdownMenuItem(
                                          value: secondsList[i],
                                          child: Text(secondsList[i].toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey.shade600))),
                                  ],
                                  onChanged: (val) {
                                    setState(() {
                                      secondsVal = val.toString();
                                      seconds = int.parse(secondsVal!);
                                    });
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          // onPressed: (hours == 0 && minutes == 0 && seconds == 0)
                             onPressed: (minutes == 0 && seconds == 0)
                              ? null
                              : stopTimerr,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.white60,
                          textColor: Colors.white,
                          color: Colors.red.shade600,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Stop',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),

                        MaterialButton(
                          // onPressed: (hours == 0 && minutes == 0 && seconds == 0)
                          onPressed: (minutes == 0 && seconds == 0)
                              ? null
                              : resetTimerr,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.white60,
                          color: Colors.green.shade600,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Reset',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      // onPressed: (hours == 0 && minutes == 0 && seconds == 0)
                      onPressed: (minutes == 0 && seconds == 0)
                          ? null
                          : () {
                        if (timer != null) {
                          stopTimerr();
                        }
                        runTimer();
                      },
                      color: Colors.blue.shade600,
                      height: 50,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.white60,
                      textColor: Colors.white,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        )));
  }
}
