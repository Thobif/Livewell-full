import 'package:abc/home/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class AddFoodCamera extends StatefulWidget {
  final String userKey;
  final String menuName;
  AddFoodCamera({
    required this.userKey,
    required this.menuName,
  });

  DateTime currentDate = DateTime.now();

  @override
  State<AddFoodCamera> createState() => _AddFoodCameraState();
}

class _AddFoodCameraState extends State<AddFoodCamera> {
  String? foodKey;

  int R_cal = 0;
  int R_pro = 0;
  int R_carb = 0;
  int R_fat = 0;

  void _submitOrder(BuildContext context) async {
    CollectionReference result =
        FirebaseFirestore.instance.collection('result');
    CollectionReference food = FirebaseFirestore.instance.collection('food');
    DocumentReference shopRef = FirebaseFirestore.instance
        .collection('shop')
        .doc('FLVCjXQVK0gjH80DETTm');

    DocumentReference userRef =
        FirebaseFirestore.instance.collection('user').doc(widget.userKey);
    QuerySnapshot querySnapshotfood = await food
        .where('name', isEqualTo: widget.menuName)
        .where('shop', isEqualTo: shopRef)
        .get();
    Map<String, dynamic> targetData =
        querySnapshotfood.docs.first.data() as Map<String, dynamic>;

    if (querySnapshotfood.docs.isNotEmpty) {
      num R_cal = 0;
      num R_pro = 0;
      num R_carb = 0;
      num R_fat = 0;
      foodKey = querySnapshotfood.docs.first.id;
      Map<String, dynamic> targetData =
          querySnapshotfood.docs.first.data() as Map<String, dynamic>;
      R_cal = targetData['kcal']?.toDouble() ?? 0.0;
      R_pro = targetData['pro']?.toDouble() ?? 0.0;
      R_carb = targetData['carb']?.toDouble() ?? 0.0;
      R_fat = targetData['fat']?.toDouble() ?? 0.0;
      print("R_cel = $R_cal");
      print("userreferece = $userRef");

      print("foodkey = $foodKey");

      QuerySnapshot querySnapshot = await result
          .where('phone', isEqualTo: userRef)
          // .where('food_ID', isEqualTo: foodKey)
          .get();
      DateTime currentDate = DateTime.now();

      if (querySnapshot.docs.isNotEmpty) {
        await result.add({
          'date': currentDate,
          'food_ID': foodKey,
          'phone': userRef,
          'R_cal': R_cal,
          'R_pro': R_pro * 4,
          'R_carb': R_carb * 4,
          'R_fat': R_fat * 9,
          'quantity': 1,
        });
        print("date = $currentDate");
        print("food_ID = $foodKey");
        print("phone = $userRef");
        print("R_cal = $R_cal");
        print("R_pro = $R_pro");
        print("R_carb = $R_carb");
        print("R_fat = $R_fat");
      } else {
        print("error result");
      }
    } else {
      print("error food");
    }

    // if (querySnapshotfood.docs.isNotEmpty) {
    //   String foodKey = querySnapshotfood.docs.first.id;
    //   num R_cal = 0;
    //   num R_pro = 0;
    //   num R_carb = 0;
    //   num R_fat = 0;

    //   Map<String, dynamic> targetData =
    //       querySnapshotfood.docs.first.data() as Map<String, dynamic>;
    //   setState(() {
    //     R_cal = targetData['kcal']?.toDouble() ?? 0.0;
    //     R_pro = targetData['pro']?.toDouble() ?? 0.0;
    //     R_carb = targetData['carb']?.toDouble() ?? 0.0;
    //     R_fat = targetData['fat']?.toDouble() ?? 0.0;
    //   });
    // } else {
    //   print("error food");
    // }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          userKey: widget.userKey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Target Food'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('Kcal: ${(kcal * quantity).toStringAsFixed(2)}'),
            // Text('Fat: ${(fat * quantity).toStringAsFixed(2)}'),
            // Text('Carb: ${(carb * quantity).toStringAsFixed(2)}'),
            // Text('Pro: ${(pro * quantity).toStringAsFixed(2)}'),
            // Text('Order quantity: $quantity'),
            ElevatedButton(
              child: Text('Submit order'),
              onPressed: () {
                _submitOrder(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
