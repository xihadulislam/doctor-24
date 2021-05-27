import 'dart:async';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctor24/providers/DataProvider.dart';
import 'package:flutter_doctor24/screens/home_screen.dart';
import 'package:flutter_doctor24/screens/mainScreen.dart';
import 'package:flutter_doctor24/screens/onboarding_screen.dart';
import 'package:flutter_doctor24/utils/Result.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
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
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  String deviceId = "";

  @override
  void initState() {
    super.initState();
    Provider.of<DataProvider>(context, listen: false).fetchData();

  //  _getId().then((value) => deviceId = value);
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return Scaffold(
      body: Consumer<DataProvider>(
        builder: (ctx, data, _) => Column(
          children: [
            FutureBuilder(
                future: Future.delayed(
                    Duration.zero,
                    () => data.status == Result.Success
                        ? Get.off(() => MainScreen())
                        : Container()),
                builder: (ctx, _) => Container()),

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(
                        flex: 2,
                      ),
                      Text(
                        "Doctor 24",
                        style: TextStyle(
                          fontSize: 48,
                          color: kTitleTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/sp_logo.png"))),
                      ),

                      Spacer(),
                    ],
                  ),
                  Spacer(),

                  FutureBuilder(
                      future: Future.delayed(
                          Duration.zero,
                              () => data.status == Result.Failed
                              ? Get.snackbar("Something Wrong !", "May be you don't have internet connection",snackPosition: SnackPosition.TOP,)
                              : Container()),
                      builder: (ctx, _) => Container()),


                  CircularProgressIndicator(
                    backgroundColor: Colors.redAccent,
                  ),

                  SizedBox(height: 20),
                  Text(
                    "Developed By",
                    style: TextStyle(
                      fontSize: 12,
                      color: kTitleTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Ok CodeX".toUpperCase(),
                    style: TextStyle(
                      fontSize: 22,
                      color: kTitleTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 30)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
