// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/drawer_side_menu.dart';
import '../widgets/app_bar.dart';
import 'package:gyrnal_workout_app/widgets/bottom_navigation_bar.dart';

// screen to promote health and well-being (objective 4 of the project)
class HealthScreen extends StatefulWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  int _selectedScreenIndex = 4;


  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // side menu drawer
      drawer: DrawerMenu(),
      // custom appBar
      appBar:GyrnalAppBar(
        title: 'Health and Well-being',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // balanced diet image
            Image.asset(
              'assets/balanced-diet.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // well balanced diet information
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'A Well-Balanced Diet',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Maintaining a nutritious, well-balanced diet is essential for feeling your best and having good health. The NHS advices"
                  " We should all aim complete at least 150 minutes of exercise a week. ",
              // ref - https://www.nhs.uk/live-well/eat-well/how-to-eat-a-balanced-diet/eating-a-balanced-diet/
              // benefits ref - https://www.nhs.uk/live-well/exercise/exercise-health-benefits/
              style: TextStyle(
                fontSize: 16
                ),
              ),
            ),
        Padding(padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Benefits of exercise ",
            // ref - https://www.nhs.uk/live-well/eat-well/how-to-eat-a-balanced-diet/eating-a-balanced-diet/

            style: TextStyle(
                fontSize: 18,
              fontWeight: FontWeight.bold,
                 ),
              ),
            ),

            // benefits of exercise
            // benefits ref - https://www.nhs.uk/live-well/exercise/exercise-health-benefits/
            Text(
              '1. Reduces the risk of major illnesses like coronary heart disease.\n'
                  '\n2. Lowers the chance of having a stroke.\n'
                  '\n3. Decreases the likelihood of developing type 2 diabetes.\n'
              '\n4. Helps to prevent cancer.\n'
              '\n5. Can reduce the risk of early death by up to 30%.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),

      // custom nav bar
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedScreenIndex,
        onSelectPage: _selectScreen,
      ),
    );
  }
}