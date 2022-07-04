import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7_1915026001_ghozalinurrahman/getstarted.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() {
    var duration = const Duration(seconds: 4);
    return Timer(duration, () {
      Get.to(MainPage());
    });
  }

  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFF7CCAC),
      body: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              child: Image.asset(
                "assets/logo.png",
                width: lebar / 2,
                height: tinggi / 2,
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
          ]),
        ],
      ),
    );
  }
}
