// อย่าลืม import ไฟล์นี้ในไฟล์ที่ต้องการใช้งาน
import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
    static const String routeName = '/food'; 

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the Food Screen!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
