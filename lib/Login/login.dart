import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:abc/main.dart';

void main() {
  runApp(MaterialApp(home: LoginPage()));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneNumberController = TextEditingController();
  String _errorMessage = '';

Future<void> _verifyPhoneNumber(BuildContext context) async {
  String phoneNumber = _phoneNumberController.text;
  print("Phone number: $phoneNumber");

  try {
    CollectionReference users = FirebaseFirestore.instance.collection('user');
    QuerySnapshot querySnapshot = await users.where('phone', isEqualTo: phoneNumber).get();

    if (querySnapshot.docs.isNotEmpty) {
      // หากมี key นี้ในฐานข้อมูล ส่งข้อมูลไปยังหน้า Homepage พร้อมกับ key
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage(userKey: phoneNumber)),
      );
    } else {
      setState(() {
        _errorMessage = 'เบอร์มือถือไม่ถูกต้อง';
      });
    }
  } catch (e) {
    print("Error: $e");
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Live Well',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'เบอร์มือถือ',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _verifyPhoneNumber(context),
                  child: Text('ยืนยัน'),
                ),
                SizedBox(height: 10),
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 30),
                Text(
                  'หรือเข้าสู่ระบบด้วย',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // เข้าสู่ระบบด้วย Facebook
                      },
                      icon: Icon(Icons.facebook),
                      label: Text('Facebook'),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.lightGreen),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        // เข้าสู่ระบบด้วย Gmail
                      },
                      icon: Icon(Icons.mail),
                      label: Text('Gmail'),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.lightGreen),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
