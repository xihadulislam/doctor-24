import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_doctor24/screens/onboarding_screen.dart';
import 'package:get/get.dart';

import '../constant.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Get.off(() => OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/bg.png"))),
        child: Center(
          child: Container(
            height: 250,
            width: 240,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/sp_logo.png"))),
          ),
        ),
      ),
    );
  }
}
