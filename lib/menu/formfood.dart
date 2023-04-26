import 'package:abc/home/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormFood extends StatefulWidget {
  final String userKey;

  FormFood({
    required this.userKey,
  });

  @override
  _FormFoodState createState() => _FormFoodState();
}

class _FormFoodState extends State<FormFood> {
  // Define TextEditingController for each text field

  final currentDate = DateTime.now();
  final _kcalController = TextEditingController();
  final _fatController = TextEditingController();
  final _carbController = TextEditingController();
  final _proController = TextEditingController();

  // Collection reference for user data
  final _userCollection = FirebaseFirestore.instance.collection('user');

  Future<DocumentSnapshot> _getUserData(String userKey) async {
    return await _userCollection.doc(userKey).get();
  }

  // Collection reference for food data
  final _foodCollection = FirebaseFirestore.instance.collection('result');

  @override
  void dispose() {
    //  double fat;
    //  double carb;
    //  double pro;
    //  double kcal;
    //  int quantity;

    _kcalController.dispose();
    _fatController.dispose();
    _carbController.dispose();
    _proController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text('Food Form'),
  ),
  body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Kcal text field
        TextField(
          controller: _kcalController,
          decoration: InputDecoration(
            labelText: 'Kcal',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17.0),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16),

        // Fat text field
        TextField(
          controller: _fatController,
          decoration: InputDecoration(
            labelText: 'Fat',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17.0),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16),

        // Carb text field
        TextField(
          controller: _carbController,
          decoration: InputDecoration(
            labelText: 'Carb',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17.0),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16),

        // Pro text field
        TextField(
          controller: _proController,
          decoration: InputDecoration(
            labelText: 'Pro',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17.0),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 24),

        ElevatedButton(
          onPressed: () async {
            // ... (the rest of the onPressed code)
          },
          child: Text('Submit'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ],
    ),
  ),
);

  }
}
