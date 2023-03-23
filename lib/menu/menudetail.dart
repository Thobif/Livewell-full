import 'package:flutter/material.dart';
import 'package:abc/food/restaurantmodel.dart';

import 'foodfunction.dart';

class MenuDetailsPage extends StatefulWidget {
  final Restaurant restaurant;

  MenuDetailsPage({required this.restaurant});

  @override
  _MenuDetailsPageState createState() => _MenuDetailsPageState();
}

class _MenuDetailsPageState extends State<MenuDetailsPage> {
  late Future<List<Menu>> _menuItems;

  @override
  void initState() {
    super.initState();
    _menuItems = fetchMenuItems(widget.restaurant);
  }


  Future<List<Menu>> fetchMenuItems(Restaurant restaurant) async {
    // โค้ดสำหรับดึงข้อมูลเมนูอาหารจาก Firestore โดยใช้ restaurant.id
    // ในตัวอย่างนี้ควรเติมโค้ดดึงข้อมูลจาก Firestore ตามความต้องการ
    return []; // คืนค่าเป็น List ของ MenuItem
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
        backgroundColor: Colors.green
      ),
      body: FutureBuilder<List<Menu>>(
        future: _menuItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
                child: Text('เกิดข้อผิดพลาดในการดึงข้อมูลเมนูอาหาร'));
          }
          final menuItems = snapshot.data!;
          return ListView.builder(
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(menuItems[index].name),
                  subtitle: Text(
                      'โปรตีน: ${menuItems[index].protein} กรัม\nคาโบไฮเดรต: ${menuItems[index].carbohydrate} กรัม\nไขมัน: ${menuItems[index].fat} กรัม\nแคลอรี: ${menuItems[index].calories} กิโลแคลอรี่'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

