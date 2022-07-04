import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7_1915026001_ghozalinurrahman/mainmenu.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF7CCAC),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: lebar,
                height: 50,
                margin: EdgeInsets.only(top: 40),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF3A3845),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "WELCOME",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0xFFF7CCAC),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  " 1915026001 Ghozali Nur Rahman ",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3A3845),
                  ),
                ),
              ),
              Text(
                "Fruits Drink",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A3845),
                ),
              ),
              Container(
                width: 250,
                height: 200,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/pepaya.png"),
                  ),
                ),
              ),
              Text(
                "A daily smoothie can offer a super convenient way \nto get your fruits and veggies in while also nourishing your body \nwith many essential vitamins and minerals.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF826F66),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF3A3845),
                    minimumSize: Size(180, 50),
                  ),
                  onPressed: () {
                    Get.to(MyHomePage());
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFF7CCAC),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
