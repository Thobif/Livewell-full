// อย่าลืม import ไฟล์นี้ในไฟล์ที่ต้องการใช้งาน
import 'package:flutter/material.dart';

class FitnessScreen extends StatelessWidget {
  static const String routeName = '/fitness';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the Fitness Screen!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
