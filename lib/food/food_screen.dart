
import 'package:abc/food/listffod.dart';
import 'package:flutter/material.dart';
import 'package:abc/food/restaurantmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:abc/menu/menudetail.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FoodScreen extends StatefulWidget {
  final String userKey;

  FoodScreen({required this.userKey});

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  late Future<List<Restaurant>> _restaurantListFuture;

  @override
  void initState() {
    super.initState();
    _restaurantListFuture = _fetchRestaurants();
  }

  Future<List<Restaurant>> _fetchRestaurants() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('shop').get();
    return querySnapshot.docs.map((doc) {
      final restaurant =
          Restaurant(name: doc['shop_name'], menu: [], key: doc.id);
      return restaurant;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          height: 200,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.42796133580664, -122.085749655962),
              zoom: 14,
            ),
            markers: Set<Marker>.of([
              Marker(
                markerId: MarkerId('marker_1'),
                position: LatLng(37.42796133580664, -122.085749655962),
                infoWindow: InfoWindow(
                  title: 'Google',
                  snippet: 'Googleplex',
                ),
              ),
            ]),
          ),
        ),
        title: Text('Restaurant List'),
      ),
      body: FutureBuilder<List<Restaurant>>(
        future: _restaurantListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final restaurantList = snapshot.data!;
            return ListView.builder(
              itemCount: restaurantList.length,
              itemBuilder: (context, index) {
                final restaurant = restaurantList[index];
                return ListTile(
                  title: Text(restaurant.name),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MenuDetail(
                          userKey: widget.userKey,
                          restaurant: restaurant,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to fetch restaurants'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListFood(
                userKey: widget.userKey,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
