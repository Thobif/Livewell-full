import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:abc/main.dart';

class EighthPage extends StatefulWidget {
  final String name;
  final String gender;
  final int height;
  final int weight;
  final Map<String, bool> allergens;
  final Map<String, bool> diseases;
  final int age;

  EighthPage({
    required this.name,
    required this.gender,
    required this.height,
    required this.weight,
    required this.allergens,
    required this.diseases,
    required this.age,
  });

  _EighthPageState createState() => _EighthPageState();
}

class _EighthPageState extends State<EighthPage> {
  int _mealsPerDay = 1;
  int _activityLevel = 1;
  int _exerciseLevel = 1;

  Future<String> _addUserToFirestore() async {
    CollectionReference users = FirebaseFirestore.instance.collection('user');
    DocumentReference documentReference = await users.add({
      'name': widget.name,
      'age': widget.age,
      'gender': widget.gender,
      'height': widget.height,
      'weight': widget.weight,
      'diseases': widget.diseases,
      'allergens': widget.allergens,
      'mealsPerDay': _mealsPerDay,
      'activityLevel': _activityLevel,
      'exerciseLevel': _exerciseLevel,
    });
    return documentReference.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Step 8: Daily Activities'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Add this line
              children: [
                SizedBox(height: 20),
                Text(
                  'คุณทานอาหารกี่มื้อต่อวัน?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButton<int>(
                  value: _mealsPerDay,
                  onChanged: (int? newValue) {
                    setState(() {
                      _mealsPerDay = newValue!;
                    });
                  },
                  items: List<DropdownMenuItem<int>>.generate(
                    5,
                    (index) => DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'ระดับการเผาผลาญพลังงานต่อวัน?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButton<int>(
                  value: _activityLevel,
                  onChanged: (int? newValue) {
                    setState(() {
                      _activityLevel = newValue!;
                    });
                  },
                  items: [
                    DropdownMenuItem<int>(
                        value: 1, child: Text('ทำงานนั่งเฉยๆ')),
                    DropdownMenuItem<int>(value: 2, child: Text('เดินน้อยๆ')),
                    DropdownMenuItem<int>(value: 3, child: Text('เดินปกติ')),
                    DropdownMenuItem<int>(value: 4, child: Text('เดินบ่อยๆ')),
                    DropdownMenuItem<int>(value: 5, child: Text('ทำงานหนัก')),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'ระดับการออกกำลังกายของคุณ?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButton<int>(
                  value: _exerciseLevel,
                  onChanged: (int? newValue) {
                    setState(() {
                      _exerciseLevel = newValue!;
                    });
                  },
                  items: [
                    DropdownMenuItem<int>(
                        value: 1, child: Text('ไม่ออกกำลังกายเลย')),
                    DropdownMenuItem<int>(
                        value: 2, child: Text('ออกบ้างเล็กน้อย')),
                    DropdownMenuItem<int>(
                        value: 3, child: Text('ออกกำลังกายทั่วไป')),
                    DropdownMenuItem<int>(
                        value: 4, child: Text('ออกกำลังกายสร้างกล้ามเนื้อ')),
                    DropdownMenuItem<int>(
                        value: 5, child: Text('ออกกำลังกายทุกวันอย่างหนัก')),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    child: Text('ยืนยัน'),
                    onPressed: () async {
                      String userKey = await _addUserToFirestore();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(userKey: userKey)),
                        (Route<dynamic> route) => false,
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Step 8/8',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
