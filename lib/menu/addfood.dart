import 'package:flutter/material.dart';

class AddMenu extends StatefulWidget {
  @override
  _AddMenuState createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Menu'),
        backgroundColor: Colors.green, // Set the background color of the AppBar
      ),
      body: Center(
        child: Text(
          'This is the Add Menu page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

