import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // คุณควรเพิ่มตัวแปรสำหรับเก็บข้อมูลต่าง ๆ ในโปรไฟล์ของผู้ใช้ที่นี่

  @override
  Widget build(BuildContext context) {
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
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/Screen.jpg'), // รูปภาพของผู้ใช้
                      radius: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'User Name', // ชื่อผู้ใช้
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // เพิ่มรายการเสนอเลือกข้อมูลที่คุณต้องการแก้ไขที่นี่
              Text('เพศ', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('อายุ', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('น้ำหนัก', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('ส่วนสูง', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('เบอร์โทรศัพท์', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('อีเมล', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('น้ำหนักปัจจุบัน', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('เป้าหมาย', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('เป้าหมายต่อสัปดาห์', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
