import 'dart:async';
import 'login.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF69C67E), // ตั้งค่าสีตามรหัสสี 16 หลัก
      body: Center(
        child: Image.asset(
          'assets/images/Screen.png', // ที่อยู่ของรูปภาพที่ต้องการแสดง
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
