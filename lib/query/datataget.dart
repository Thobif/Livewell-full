import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TargetPage extends StatefulWidget {
  final String userKey;

  TargetPage({required this.userKey});

  @override
  _TargetPageState createState() => _TargetPageState();
}

class _TargetPageState extends State<TargetPage> {
  int age = 0;
  String gender = '';
  int weight = 0;
  int height = 0;
  int activityLevel = 0;
  int exerciseLevel = 0;

  @override
  void initState() {
    super.initState();
    getUserData(widget.userKey);
  }

  void getUserData(String userKey) async {
    CollectionReference users = FirebaseFirestore.instance.collection('user');
    DocumentSnapshot snapshot = await users.doc(userKey).get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

      setState(() {
        age = data['age'] ?? 0;
        gender = data['gender'] ?? '';
        weight = data['weight'] ?? 0;
        height = data['height'] ?? 0;
        activityLevel = data['activityLevel'] ?? 0;
        exerciseLevel = data['exerciseLevel'] ?? 0;
      });

      print('Age: $age');
      print('Gender: $gender');
      print('Weight: $weight');
      print('Height: $height');
      print('Activity Level: $activityLevel');
      print('Exercise Level: $exerciseLevel');
    } else {
      print('User not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Target Page'),
    );
  }
}
