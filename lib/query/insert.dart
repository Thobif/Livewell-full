import 'dart:ffi';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Insert extends StatefulWidget {
  const Insert({Key? key}) : super(key: key);

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot<Map<String, dynamic>>> _userStream;

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _userStream = _firestore.collection('user').snapshots();
  }

  void _addUserDataToFirestore(String name, int age, String email) async {
    await _firestore
        .collection('user')
        .add({'name': name, 'age': age, 'email': email});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(label: Text("Name")),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(label: Text("Age")),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(label: Text("Email")),
                keyboardType: TextInputType.emailAddress,
              ),
              ElevatedButton(
                onPressed: () {
                  _addUserDataToFirestore(nameController.text,
                      int.parse(ageController.text), emailController.text);
                },
                child: Text('Add'),
              ),
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: _userStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (!snapshot.hasData) {
                    return Text("No data found");
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(
                          "Document Data: ${snapshot.data?.docs[index].data()}"); // Add this line
                      return ListTile(
                        title: Text(snapshot.data?.docs[index]['name'] ?? ''),
                        subtitle: Text(
                            'Age: ${snapshot.data?.docs[index].get('age') ?? ''}, Email: ${snapshot.data?.docs[index].get('email') ?? ''}'),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
