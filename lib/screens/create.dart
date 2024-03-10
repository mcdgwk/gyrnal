// // pre-made workouts to add to users' collection
// import 'package:flutter/material.dart';
//
// // ignore_for_file: prefer_const_constructors
// import 'package:flutter/material.dart';
// import 'package:gyrnal_workout_app/widgets/bottom_navigation_bar.dart';
// import '../widgets/drawer_side_menu.dart';
// import '../widgets/app_bar.dart';
// import 'package:gyrnal_workout_app/screens/dashboard.dart';
// import 'package:gyrnal_workout_app/screens/settings.dart';
// import 'package:gyrnal_workout_app/screens/profile.dart';
// import 'package:gyrnal_workout_app/screens/workouts.dart';
// import 'package:gyrnal_workout_app/services/sql_helper.dart';
//
// class CreateScreen extends StatefulWidget {
//   const CreateScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CreateScreen> createState() => _CreateScreenState();
// }
//
// class _CreateScreenState extends State<CreateScreen> {
//   int _selectedScreenIndex = 4;
//
//   // list of all journals
//   List<Map<String, dynamic>> _journals = [];
//
//   bool _isLoading = true;
//
//   // This function is used to fetch all data from the database
//   void _refreshJournals() async {
//     final data = await SQLHelper.getWorkouts();
//     setState(() {
//       _journals = data;
//       _isLoading = false;
//     });
//   }
//   final List<Widget> _pageOptions = [
//     //Home(),
//     DashboardScreen(),
//     SettingsScreen(),
//     WorkoutScreen(),
//     ProfileScreen(),
//   ];
//
//   void _selectScreen(int index) {
//     setState(() {
//       _selectedScreenIndex = index;
//     });
//   }
//   @override
//   void initState() {
//     super.initState();
//     _refreshJournals(); // Loading the diary when the app starts
//   }
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//
//   // This function will be triggered when the floating button is pressed
//   // It will also be triggered when you want to update an item
//   void _showForm(int? id) async {
//     if (id != null) {
//       // id == null -> create new item
//       // id != null -> update an existing item
//       final existingJournal =
//       _journals.firstWhere((element) => element['id'] == id);
//       _titleController.text = existingJournal['title'];
//       _descriptionController.text = existingJournal['description'];
//     }
//
//     showModalBottomSheet(
//         context: context,
//         elevation: 5,
//         isScrollControlled: true,
//         builder: (_) => Container(
//           padding: EdgeInsets.only(
//             top: 15,
//             left: 15,
//             right: 15,
//             // this will prevent the soft keyboard from covering the text fields
//             bottom: MediaQuery.of(context).viewInsets.bottom + 120,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               TextField(
//                 controller: _titleController,
//                 decoration: const InputDecoration(hintText: 'Workout Title'),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextField(
//                 controller: _descriptionController,
//                 decoration: const InputDecoration(hintText: 'Description'),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   // Save new journal
//                   if (id == null) {
//                     await _addItem();
//                   }
//
//                   if (id != null) {
//                     await _updateItem(id);
//                   }
//
//                   // Clear the text fields
//                   _titleController.text = '';
//                   _descriptionController.text = '';
//
//                   // Close the bottom sheet
//                   if (!mounted) return;
//                   Navigator.of(context).pop();
//                 },
//                 child: Text(id == null ? 'Create New' : 'Update'),
//               )
//             ],
//           ),
//         ));
//   }
//
//   // Insert a new journal to the database
//   Future<void> _addItem() async {
//     await SQLHelper.createWorkout(
//         _titleController.text, _descriptionController.text, );
//     _refreshJournals();
//   }
//
//   // Update an existing journal
//   Future<void> _updateItem(int id) async {
//     await SQLHelper.updateWorkout(
//         id, _titleController.text, _descriptionController.text);
//     _refreshJournals();
//   }
//
//   // Delete an item
//   void _deleteItem(int id) async {
//     await SQLHelper.deleteWorkout(id);
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//       content: Text('Successfully deleted a journal!'),
//     ));
//     _refreshJournals();
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       // side menu drawer
//       drawer: DrawerMenu(),
//       // custom appBar
//       appBar:GyrnalAppBar(
//         title: 'Gyrnal',
//       ),
//       body: _isLoading
//           ? const Center(
//         child: CircularProgressIndicator(),
//       )
//           : ListView.builder(
//         itemCount: _journals.length,
//         itemBuilder: (context, index) => Card(
//           color: Colors.orange[200],
//           margin: const EdgeInsets.all(15),
//           child: ListTile(
//               title: Text(_journals[index]['title']),
//               subtitle: Text(_journals[index]['description']),
//               trailing: SizedBox(
//                 width: 100,
//                 child: Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.edit),
//                       onPressed: () => _showForm(_journals[index]['id']),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.delete),
//                       onPressed: () =>
//                           _deleteItem(_journals[index]['id']),
//                     ),
//                   ],
//                 ),
//               )),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () => _showForm(null),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         selectedIndex: _selectedScreenIndex,
//         onSelectPage: _selectScreen,
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     // Define action for FAB
//       //     todo - check if needed - maybe only needed in one screen rather than all
//       //   },
//       //   child: const Icon(Icons.add),
//       //   backgroundColor: Colors.lightGreen.shade600,
//       // ),
//       // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gyrnal_workout_app/screens/dashboard.dart';
import 'package:gyrnal_workout_app/screens/profile.dart';
import 'package:gyrnal_workout_app/screens/settings.dart';
import 'package:gyrnal_workout_app/screens/workouts.dart';
import 'package:gyrnal_workout_app/widgets/app_bar.dart';
import 'package:gyrnal_workout_app/widgets/bottom_navigation_bar.dart';
import 'package:gyrnal_workout_app/widgets/drawer_side_menu.dart';

import 'health.dart';
class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  int _selectedScreenIndex = 3;

  final List<Widget> _pageOptions = [
    //Home(),
    DashboardScreen(),
    SettingsScreen(),
    WorkoutScreen(),
    ProfileScreen(),
    HealthScreen(),
  ];

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
        title: 'Gyrnal',
      ),
      body: Center(
        child: Text(
          'Create Screen',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.grey,
            fontFamily: 'Montserrat',
          ),
        ),

      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedScreenIndex,
        onSelectPage: _selectScreen,
      ),

    );
  }
}
