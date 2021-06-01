import 'package:flutter/material.dart';
import 'package:flutter_doctor24/components/category_card.dart';
import 'package:flutter_doctor24/components/doctor_card.dart';
import 'package:flutter_doctor24/components/search_bar.dart';
import 'package:flutter_doctor24/providers/DataProvider.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(isDrawerOpen ? 0.85 : 1.00)
          ..rotateZ(isDrawerOpen ? -50 : 0),
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    isDrawerOpen
                        ? GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.arrow_back_ios),
                            ),
                            onTap: () {
                              setState(() {
                                xOffset = 0;
                                yOffset = 0;
                                isDrawerOpen = false;
                                FlutterStatusbarcolor.setStatusBarColor(
                                    Colors.white);
                              });
                            },
                          )
                        : GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset('assets/icons/menu.svg'),
                            ),
                            onTap: () {
                              setState(() {
                                xOffset = 290;
                                yOffset = 80;
                                isDrawerOpen = true;
                                FlutterStatusbarcolor.setStatusBarColor(
                                    Colors.blueGrey);
                              });
                            },
                          ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            xOffset = 290;
                            yOffset = 80;
                            isDrawerOpen = true;
                          });
                        },
                        child: SvgPicture.asset('assets/icons/profile.svg')),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'আপনার পছন্দসই\nডাক্তারটি সন্ধান করুন',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: kTitleTextColor,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SearchBar(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'বিভাগসমূহ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kTitleTextColor,
                      fontSize: 18),
                ),
              ),
              SizedBox(height: 16),
              FutureBuilder(
                  future: Future.delayed(
                      Duration(milliseconds: 1000), () => Container()),
                  builder: (ctx, _) => buildCategoryList()),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "শীর্ষ চিকিৎসক",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 10),

              FutureBuilder(
                  future: Future.delayed(
                      Duration(milliseconds: 1000), () => Container()),
                  builder: (ctx, _) => buildDoctorList()),

              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  buildCategoryList() {
    return Consumer<DataProvider>(
      builder: (ctx, data, _) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(data.categoryList.length,
                (index) => CategoryCard(data.categoryList[index]))),
      ),
    );
  }

  buildDoctorList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Consumer<DataProvider>(
        builder: (ctx, data, _) => Column(
            children: List.generate(data.topDoctorList.length,
                (index) => DoctorCard(data.topDoctorList[index]))),
      ),
    );
  }
}
