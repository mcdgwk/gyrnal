// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/drawer_side_menu.dart';
import '../widgets/app_bar.dart';
import '../widgets/carousel_plans.dart';




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

    final List<WorkoutPlan> preMadeWorkouts = [
      WorkoutPlan(
        planName: 'Pull Workout Plan',
        imageUrls: [

          'assets/bicep-barbell-curl.png', // ref - https://www.gofitnessplan.com/exercises/barbell-biceps-curl
          'assets/bicep-curl-dumbbell.png', // ref - https://www.gofitnessplan.com/exercises/barbell-biceps-curl
          'assets/chest-supported-dumbbell-row.jpg', // ref - https://strengthlevel.com/strength-standards/chest-supported-dumbbell-row/lb
          'assets/Dumbbell-Shrug.jpeg', // ref - https://www.relifesports.com/what-do-dumbbell-shrugs-work/
          'assets/new-standing-cable-rear-delt-fly.png', // ref - https://www.gymenix.com/2022/02/rear-deltoid-flyes.html

        ],
        exerciseNames: [
          'Barbell Bicep Curl',
          'Dumbbell Bicep Curl',
          'Chest Supported Dumbbell Row',
          'Dumbbell Shrug',
          'Standing Cable Rear Delt Fly',
        ],
      ),

      WorkoutPlan(
        planName: 'Push Workout Plan',
        imageUrls: [
          'assets/barbell-bench-press.png', // ref - https://strengthbuzz.com/fitness/how-to-do-barbell-bench-press-chest-workout.html
          'assets/incline-dumbbell-press.jpeg', // ref - http://musclemediaonline.com/3-exercises-you-should-do-for-a-stronger-bench/dumbbell-bench-press-while-lying-on-an-incline-bench-exercising-for-bodybuilding-target-muscles-are-marked-in-red-initial-and-final-steps-3d-illustration/
          'assets/barbell-shoulder-press.png', // ref - https://animalia-life.club/qa/pictures/barbell-shoulder-press
          'assets/leaning-cable-lateral-raise.jpg', // ref - https://fitliferegime.com/leaning-lateral-raise-muscle-worked-benefit-and-tips/
          'assets/tricep-pushdown.jpg', // ref - https://strengthlevel.com/strength-standards/tricep-pushdown/kg
        ],
        exerciseNames: [
          'Barbell Bench Press',
          'Incline Dumbbell Press',
          'Barbell Shoulder Press',
          'Leaning Cable Lateral Raises',
          'Triceps Push-down',
        ],
      ),

      WorkoutPlan(
        planName: 'Legs Workout Plan',
        imageUrls: [
          'assets/back-squat.png', // ref - https://fitnessvolt.com/front-squat-vs-back-squat/
          'assets/barbell-romanian-deadlift.jpg', // ref - https://www.inspireusafoundation.org/romanian-deadlift/
          'assets/leg-extension.jpg', // ref - https://www.gofitnessplan.com/exercises/seated-leg-extensions
          'assets/lying-hamstring-curls.jpeg', // ref - https://www.jasestuart.com/lying-hamstring-curls
          'assets/bodyweight-calves-raises.jpg', // ref - https://www.gofitnessplan.com/exercises/calves-raises
        ],
        exerciseNames: [
          'Back Squat',
          'Barbell Romanian Deadlift',
          'Leg Extensions',
          'Hamstring Curls',
          'Bodyweight Calf Raises',
        ],
      ),
    ];


    return Scaffold(
      // side menu drawer
      drawer: DrawerMenu(),
      // custom appBar
      appBar:GyrnalAppBar(
        title: 'Gyrnal',
      ),
      body: Container(
        child: SingleChildScrollView(
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
                    "Coming soon to Gyrnal!",
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
              CarouselWithDots(workoutPlan: preMadeWorkouts[1]),
              SizedBox(
                height: 30,
              ),


              CarouselWithDots(workoutPlan: preMadeWorkouts[2]),
              SizedBox(
                height: 30,
              ), // CarouselWithDots(testImagesList: testImagesList),
            ]
          ),
        ),
      ),
    );
  }
}

