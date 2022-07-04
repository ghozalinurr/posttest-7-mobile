import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7_1915026001_ghozalinurrahman/adding.dart';
import 'package:posttest7_1915026001_ghozalinurrahman/detailpage.dart';
import 'package:posttest7_1915026001_ghozalinurrahman/form.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3A3845),
        title: Text(
          "Fruit Drink",
          style: TextStyle(
            color: Color(0xFFF7CCAC),
          ),
        ),
      ),
      body: SecondPage(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF3A3845),
              ),
              child: Text(
                "Fruit Drink",
                style: TextStyle(
                  color: Color(0xFFF7CCAC),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add Item"),
              tileColor: Color(0xFFC69B7B),
              onTap: () {
                Get.to(FormPage());
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add User"),
              tileColor: Color(0xFFC69B7B),
              onTap: () {
                Get.to(AddPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final List<BottomNavigationBarItem> _myItem = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: "Favorite",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.shopping_cart,
      ),
      label: "Cart",
    ),
  ];

  final List<Widget> _myPages = [
    Column(
      children: [
        Container(
          width: 250,
          height: 200,
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFC69B7B),
            image: DecorationImage(
              image: AssetImage("assets/pepaya.png"),
            ),
          ),
        ),
        Text(
          "Papaya Smoothie",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A3845),
          ),
        ),
        pindah(),
        Container(
          width: 250,
          height: 200,
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFC69B7B),
            image: DecorationImage(
              image: AssetImage("assets/mango.png"),
            ),
          ),
        ),
        Text(
          "Mango Smoothie",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A3845),
          ),
        ),
        pindah(),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 250,
          height: 200,
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFC69B7B),
            image: DecorationImage(
              image: AssetImage("assets/pepaya.png"),
            ),
          ),
        ),
        Text(
          "Papaya Smoothie",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A3845),
          ),
        ),
        Text(
          "There are a number of benefits from consuming smoothies, \n they increse fibre intake, contribute toward our 5 day, \n boost our vitamin C levels and may help \n with conditions like high blood pressure",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF826F66),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizeOrder(isActive: true, size: "S"),
            SizeOrder(size: "M"),
            SizeOrder(size: "L"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AddCart(),
            ShopIcon(),
          ],
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 250,
          height: 200,
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFC69B7B),
            image: DecorationImage(
              image: AssetImage("assets/mango.png"),
            ),
          ),
        ),
        Text(
          "Mango Smoothie",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A3845),
          ),
        ),
        Text(
          "There are a number of benefits from consuming smoothies, \n they increse fibre intake, contribute toward our 5 day, \n boost our vitamin C levels and may help \n with conditions like high blood pressure",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF826F66),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizeOrder(size: "S"),
            SizeOrder(size: "M"),
            SizeOrder(isActive: true, size: "L"),
          ],
        ),
      ],
    ),
  ];

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7CCAC),
      body: SingleChildScrollView(
        child: _myPages.elementAt(_pageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        items: _myItem,
        onTap: (int newIndex) {
          setState(() {
            _pageIndex = newIndex;
          });
        },
      ),
    );
  }
}

class SizeOrder extends StatelessWidget {
  const SizeOrder({Key? key, this.isActive = false, required this.size})
      : super(key: key);

  final bool isActive;
  final String size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 45,
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 5, left: 5, top: 20),
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF3A3845) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Color(0xFF3A3845),
        ),
      ),
      child: Text(
        size,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: isActive ? Color(0xFFF7CCAC) : Color(0xFF3A3845),
        ),
      ),
    );
  }
}

class AddCart extends StatelessWidget {
  const AddCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 40,
      margin: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFF3A3845),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "Add to Cart",
        style: TextStyle(
          fontSize: 20,
          color: Color(0xFFF7CCAC),
        ),
      ),
    );
  }
}

class ShopIcon extends StatelessWidget {
  const ShopIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 40,
      margin: EdgeInsets.only(top: 20, left: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFFF7CCAC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Color(0xFF3A3845),
        ),
      ),
      child: Icon(
        Icons.shopping_cart,
        color: Color(0xFF3A3845),
        size: 24.0,
      ),
    );
  }
}

class pindah extends StatelessWidget {
  const pindah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
        child: Text(
          "view",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 31, 14, 1),
          ),
        ),
        onPressed: () {
          Get.to(Detail());
        },
      ),
    );
  }
}
