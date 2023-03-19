import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  final String userKey;
  ProfilePage({required this.userKey});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _userName = '';
  String _gender = '';
  int _age = 0;
  int _weight = 0;
  int _height = 0;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('user')
          .doc(widget.userKey)
          .get();

      if (documentSnapshot.exists) {
        setState(() {
          _userName = documentSnapshot.get('name');
          _gender = documentSnapshot.get('gender');
          _age = documentSnapshot.get('age');
          _weight = documentSnapshot.get('weight');
          _height = documentSnapshot.get('height');
        });
      } else {
        print('User not found!');
      }
    } catch (e) {
      print('Error retrieving user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final userKeyLast4Digits =
        widget.userKey.substring(widget.userKey.length - 4);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      _userName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('เพศ: ${_gender == 'male' ? 'ผู้ชาย' : 'ผู้หญิง'}',
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('อายุ: $_age', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('น้ำหนัก: $_weight', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('ส่วนสูง: $_height', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('เบอร์โทรศัพท์: ****$userKeyLast4Digits',
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
