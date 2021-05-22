import 'package:flutter/material.dart';
import 'package:flutter_doctor24/components/category_card.dart';
import 'package:flutter_doctor24/components/doctor_card.dart';
import 'package:flutter_doctor24/components/search_bar.dart';
import 'package:flutter_doctor24/providers/DataProvider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SvgPicture.asset('assets/icons/menu.svg'),
                    SvgPicture.asset('assets/icons/profile.svg'),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
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
              buildCategoryList(),
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
              buildDoctorList(),
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
            children: List.generate(data.allDoctorList.length,
                (index) => DoctorCard(data.allDoctorList[index]))),
      ),
    );
  }
}
