import 'dart:async';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctor24/providers/DataProvider.dart';
import 'package:flutter_doctor24/screens/home_screen.dart';
import 'package:flutter_doctor24/screens/mainScreen.dart';
import 'package:flutter_doctor24/screens/onboarding_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  Future<String> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  String deviceId = "";

  @override
  void initState()  {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Get.off(() => MainScreen());
    });

    _getId().then((value) => deviceId=value);


  }


  @override
  Widget build(BuildContext context) {

    Provider.of<DataProvider>(context,listen: false).fetchData();

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
