import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:path/path.dart';

class CameraFood extends StatefulWidget {
  final String userKey;
  CameraFood({required this.userKey});
  @override
  _CameraFoodState createState() => _CameraFoodState();
}

class _CameraFoodState extends State<CameraFood> {
  File? _image;

 Future<void> _pickImage() async {
  // Request storage permission
  await Permission.storage.request();

  final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
  if (pickedImage != null) {
    // Get the application documents directory
    final appDir = await getApplicationDocumentsDirectory();

    // Create a new path with the current date and time as the file name
    final fileName = DateTime.now().toIso8601String();
    final newPath = join(appDir.path, '$fileName.jpg');

    // Copy the picked image to the new path
      final File savedImage = await File(pickedImage.path).copy(newPath);

    setState(() {
      _image = savedImage;
    });
  } else {
    print('No image selected.');
  }
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
        backgroundColor: Colors.green, // กำหนดสีของ AppBar เป็นสีเขียว
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        child: Icon(Icons.camera),
        backgroundColor: Colors.green, // กำหนดสีของ FloatingActionButton เป็นสีเขียว
      ),
    );
  }
}
