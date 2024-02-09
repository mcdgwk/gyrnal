// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';



// workoutPlan clas to hold workout data
// todo - move?
class WorkoutPlan{
  final String planName;
  final List<String> imageUrls; // stores list of image locations
  final List<String> exerciseNames; // holds list of exercise names

  // constructor with required fields
  WorkoutPlan({required this.planName, required this.imageUrls, required this.exerciseNames});
}

// Reference - https://www.youtube.com/watch?v=p3gFikowJVI

class CarouselWithDots extends StatefulWidget {
  final WorkoutPlan workoutPlan;
  // List<String> testImagesList;

  CarouselWithDots({required this.workoutPlan});

  @override
  _CarouselWithDotsState createState() => _CarouselWithDotsState();
}

class _CarouselWithDotsState extends State<CarouselWithDots> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.workoutPlan.imageUrls
        .asMap()
        .entries
        .map((entry) {
      int index = entry.key; // Index from MapEntry
      String imgUrl = entry.value; // URL from MapEntry
      String exerciseName = widget.workoutPlan.exerciseNames[index];

      return Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          child: Stack(
            children: [
              Image.asset(
                imgUrl,
                fit: BoxFit.cover,
                width: 700,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    exerciseName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    })
        .toList();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            widget.workoutPlan.planName,
            // "Carousel With Image, Text & Dots",
            style: TextStyle(
              color: Colors.green[700],
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
            // set to false for now Todo - check if needs changing
              autoPlay: false,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.workoutPlan.imageUrls.map((url) {
            int index = widget.workoutPlan.imageUrls.indexOf(url);
            return Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 3,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}