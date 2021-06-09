
import 'package:flutter/material.dart';
import 'package:flutter_doctor24/providers/DataProvider.dart';
import 'package:flutter_doctor24/screens/DoctorsScreen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class SearchBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var msg ="";

    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: kSearchBackgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextField(
              onChanged: (value){
                msg = value;
              },
              decoration: InputDecoration.collapsed(
                hintText: 'ডাক্তারদের সন্ধান করুন',
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: MaterialButton(
            onPressed: () {
              FocusManager.instance.primaryFocus.unfocus();
              Get.to(()=> DoctorsScreen(),arguments: msg);
            },
            color: kOrangeColor,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: SvgPicture.asset('assets/icons/search.svg'),
          ),
        ),
      ],
    );
  }
}
