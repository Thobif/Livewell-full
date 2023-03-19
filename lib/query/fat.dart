import 'package:flutter/material.dart';

class FatPage extends StatefulWidget {
  final String name;
  final String gender;
  final String userKey;
  final int height;
  final int weight;
  final int age;
  final Map<String, bool> allergens;
  final Map<String, bool> diseases;

  FatPage({
    required this.name,
    required this.userKey,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
    required this.allergens,
    required this.diseases,
  });

  @override
  _FatPageState createState() => _FatPageState();
}

class _FatPageState extends State<FatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fat Page'), // ตั้งชื่อที่เหมาะสมกับหน้านี้
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ใส่โค้ดของหน้า FatPage ที่นี่
            ],
          ),
        ),
      ),
    );
  }
}
