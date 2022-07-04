import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7_1915026001_ghozalinurrahman/alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  bool isSmall = false;
  bool isMedium = false;
  bool isLarge = false;

  String product = '';
  String desc = '';
  String tipe = '';
  String sedia = '';
  String dataTipe = 'Smoothies';
  final ctrlProduct = TextEditingController();
  final ctrlDesc = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    ctrlProduct.dispose();
    ctrlDesc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fruit Drink',
          style: TextStyle(color: Color(0xFFF7CCAC)),
        ),
        backgroundColor: Color(0xFF3A3845),
      ),
      backgroundColor: Color(0xFFF7CCAC),
      body: ListView(
        children: [
          Text(
            "Add New Product of 'Fruit Drink'",
            style: TextStyle(
              color: Color(0xFF3A3845),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Container(
            width: lebar,
            height: 5,
            decoration: BoxDecoration(
              color: Color(0xFF826F66),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: ctrlProduct,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF3A3845), width: 2),
                ),
                labelText: "Product Name",
                labelStyle: TextStyle(
                  color: Color(0xFF3A3845),
                  fontWeight: FontWeight.bold,
                ),
                icon: Icon(
                  Icons.local_drink,
                  color: Color(0xFF3A3845),
                ),
              ),
            ),
          ),
          Container(
            width: lebar,
            height: 5,
            decoration: BoxDecoration(
              color: Color(0xFF826F66),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              maxLines: 3,
              controller: ctrlDesc,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF3A3845), width: 2),
                ),
                labelText: "Description",
                labelStyle: TextStyle(
                  color: Color(0xFF3A3845),
                  fontWeight: FontWeight.bold,
                ),
                icon: Icon(
                  Icons.description,
                  color: Color(0xFF3A3845),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: lebar,
            height: 30,
            decoration: BoxDecoration(
              color: Color(0xFF826F66),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "Choose Size Are Available",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF7CCAC),
              ),
            ),
          ),
          ListTile(
            title: Text("Small"),
            leading: Checkbox(
              value: isSmall,
              activeColor: Color(0xFF3A3845),
              onChanged: (bool? value) {
                setState(() {
                  isSmall = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Medium"),
            leading: Checkbox(
              value: isMedium,
              activeColor: Color(0xFF3A3845),
              onChanged: (bool? value) {
                setState(() {
                  isMedium = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Large"),
            leading: Checkbox(
              value: isLarge,
              activeColor: Color(0xFF3A3845),
              onChanged: (bool? value) {
                setState(() {
                  isLarge = value!;
                });
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: lebar,
            height: 30,
            decoration: BoxDecoration(
              color: Color(0xFF826F66),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "Type Drink",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF7CCAC),
              ),
            ),
          ),
          ListTile(
            title: Text("Juice"),
            leading: Radio<String>(
              groupValue: dataTipe,
              value: 'Juice',
              activeColor: Color(0xFF3A3845),
              onChanged: (value) {
                setState(() {
                  dataTipe = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Smoothies"),
            leading: Radio<String>(
              groupValue: dataTipe,
              value: 'Smoothies',
              activeColor: Color(0xFF3A3845),
              onChanged: (value) {
                setState(() {
                  dataTipe = value!;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF3A3845),
              ),
              onPressed: () {
                setState(() {
                  CustomAlert(context, "Added Succesfully");
                  product = "Product Name :" + ctrlProduct.text;
                  desc = "Descrption :" + ctrlDesc.text;
                  tipe =
                      dataTipe == 'Smoothies' ? 'Type Smoothies' : 'Type Juice';
                  sedia =
                      "Available: ${isSmall ? "Small," : ""} ${isMedium ? "Medium," : ""} ${isLarge ? "Large," : ""}";
                });
              },
              child: Text(
                "Add",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFf7ccac),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(product),
                Text(desc),
                Text(sedia),
                Text(tipe),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
