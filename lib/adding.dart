import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:posttest7_1915026001_ghozalinurrahman/item.dart';

class AddPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF3A3845),
          title: Text(
            'Firestore Add User',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color(0xFFF7CCAC),
        body: Stack(
          children: [
            ListView(
              children: [
                StreamBuilder<QuerySnapshot>(
                    stream: users.snapshots(),
                    builder: (_, snapshot) {
                      return (snapshot.hasData)
                          ? Column(
                              children: snapshot.data!.docs
                                  .map(
                                    (e) =>
                                        ItemCard(e.get('name'), e.get('age')),
                                  )
                                  .toList(),
                            )
                          : Text('Loading..');
                    }),
                SizedBox(height: 150)
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(-5, 0),
                        blurRadius: 15,
                        spreadRadius: 3)
                  ]),
                  width: double.infinity,
                  height: 130,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: nameController,
                              decoration: InputDecoration(hintText: "Nama"),
                            ),
                            TextField(
                              controller: ageController,
                              decoration: InputDecoration(hintText: "Umur"),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 130,
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF3A3845),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Tambah',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              users.add({
                                'name': nameController.text,
                                'age': int.tryParse(ageController.text) ?? -1
                              });
                              nameController.text = "";
                              ageController.text = "";
                            }),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
