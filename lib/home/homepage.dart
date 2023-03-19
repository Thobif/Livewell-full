// อย่าลืม import ไฟล์นี้ในไฟล์ที่ต้องการใช้งาน
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the Home Screen!',

        
        style: TextStyle(fontSize: 24),
      ),
      
    );
  }
}