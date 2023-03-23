import 'package:abc/menu/addfood.dart';
import 'package:abc/menu/foodfunction.dart';
import 'package:abc/menu/menudetail.dart';
import 'package:flutter/material.dart';
import 'restaurantmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  late Future<List<Restaurant>> _restaurants;

  @override
  void initState() {
    super.initState();
    _restaurants =
        fetchRestaurants(); // Call fetchRestaurants() function to get data from Firestore
  }

  Widget _buildGoogleMap() {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          0.3, // Adjust the height as needed
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(13.286013703251987,
              100.9255903260679), // Set the center position (Chonburi)
          zoom: 16, // Set the initial zoom level
        ),
        myLocationEnabled: true, // Show the user's location
        myLocationButtonEnabled: false, // Hide the default user location button
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildGoogleMap(),
          Expanded(
            child: FutureBuilder<List<Restaurant>>(
              future: _restaurants,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                      child: Text('เกิดข้อผิดพลาดในการดึงข้อมูลร้านค้า'));
                }
                final restaurants = snapshot.data!;
                return ListView.builder(
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(restaurants[index].name),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MenuDetailsPage(
                                    restaurant: restaurants[index]),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // โค้ดสำหรับนำไปยังหน้าถัดไป
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddMenu()),
                );
              },
              child: Text('เพิ่มอาหาร'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // เปลี่ยนสีปุ่มเป็นสีเขียว
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20), // กำหนดมุมโค้งของปุ่ม
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
