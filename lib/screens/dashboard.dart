// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer_side_menu.dart';
import '../widgets/app_bar.dart';
import '../widgets/carousel_plans.dart';
import 'package:gyrnal_workout_app/workouts/pre_made_workouts.dart';
import 'package:gyrnal_workout_app/workouts/workout_model.dart';
import 'package:gyrnal_workout_app/workouts/pre_made_workouts.dart';



// home dashboard (initial) screen
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    // for testing purposes
    final List<String> test = [
      'lib/images/test1.jpg',
      'lib/images/test2.jpg',
      'lib/images/test3.jpg',
      'lib/images/test4.jpg',
    ];

    // final List<String> test = [
    //   'lib/images/test1.jpg',
    //   'lib/images/test2.jpg',
    //   'lib/images/test3.jpg',
    //   'lib/images/test4.jpg',
    // ];

    //
    // final WorkoutPlan pullWorkoutPlan = WorkoutPlan(
    //     planName: 'Pull',
    //     imageUrls:[
    //     'lib/images/exercise/bicep-curl-dumbbell.png',
    //     'lib/images/test2.jpg',
    //     'lib/images/test3.jpg',
    //     'lib/images/test4.jpg',
    //     ],);

    // final List<String> pullWorkoutPlan = [
    //   'images/exercises/barbell-curl-bicep.png',
    //   'images/exercises/bicep-curl-dumbbell.png',
    //   'images/exercises/chest-supported-dumbbell-row.jpg',
    //   'images/exercises/Dumbbell-Shrug.jpeg',
    //   'images/exercises/Standing-Cable-Rear-Delt-Fly.jpeg',
    // ];

    final List<WorkoutPlan> preMadeWorkouts = [
      WorkoutPlan(
        planName: 'Pull Workout Plan',
        imageUrls: [
           // 'assets/barbell-curl-bicep.jpg',
          // 'images/exercises/bicep-curl-dumbbell.png',
          // 'images/exercises/chest-supported-dumbbell-row.jpg',
          // 'images/exercises/Dumbbell-Shrug.jpeg',
          // 'images/exercises/Standing-Cable-RearS-Delt-Fly.jpeg',
          // 'assets/barbell-curl-2.jpg',
          'assets/bicep-barbell-curl.png',
          'assets/test1.jpg',
          'assets/test2.jpg',
          'assets/test3.jpg',
          // 'assets/test4.jpg',
        ],
        exerciseNames: [
          'Bicep Barbell Curl',
          'Dumbbell Bicep Curl',
          'Chest Supported Dumbbell Row',
          'Dumbbell Shrug',
          'Standing Cable Rear Delt Fly',
        ],
      ),
      // todo - add more plans
    ];


    return Scaffold(
      // side menu drawer
      drawer: DrawerMenu(),
      // custom appBar
      appBar:GyrnalAppBar(
        title: 'Gyrnal',
      ),
      body: Container(
        child: Column(
          children: [
        Text(
        'Hello user!',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          color: Colors.grey,
          fontFamily: 'Montserrat',
        ),
        ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Some text here",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                  ),
                ),
            ),
            // Sliding Carousel to display users plans
            // Todo - Change to workouts instead of text imgs
            // on click -> go to workout
            // current items = test photos


            // Reference - https://www.youtube.com/watch?v=p3gFikowJVI

            // test carousel
            // CarouselWithDots(testImagesList: testImagesList),
            CarouselWithDots(workoutPlan: preMadeWorkouts[0]),


            SizedBox(
              height: 30,
            ),
            // CarouselWithDots(testImagesList: testImagesList),
          ]
      ),
      ),
    );
  }
}

