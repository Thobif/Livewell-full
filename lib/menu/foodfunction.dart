import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:abc/food/restaurantmodel.dart';

Future<List<Restaurant>> fetchRestaurants() async {
  final restaurants = <Restaurant>[];

  final querySnapshot = await FirebaseFirestore.instance.collection('shop').get();
  querySnapshot.docs.forEach((doc) {
    final data = doc.data();
    restaurants.add(Restaurant(
      // imagePath: data['imagePath'] ?? '',
      name: data['shop_name'] ?? '',
      menu: [], // ควรดึงข้อมูลเมนูจาก Firestore ด้วยการใช้ฟังก์ชัน fetchMenus() และส่งค่าร้านค้าเป็นพารามิเตอร์
      key:doc.id
    ));
  });

  return restaurants;
}



