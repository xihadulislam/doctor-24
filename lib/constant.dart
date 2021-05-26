import 'package:flutter/material.dart';

var kBackgroundColor = Color(0xffF9F9F9);
var kWhiteColor = Color(0xffffffff);
var kOrangeColor = Color(0xffEF716B);
var kBlueColor = Color(0xff4B7FFB);
var kYellowColor = Color(0xffFFB167);
var kPurpleColor = Color(0xff9575cd);
var kGreenColor = Color(0xff66bb6a);
var kBlueGreyColor = Colors.blueGrey;

var kTitleTextColor = Color(0xff1E1C61);
var kSearchBackgroundColor = Color(0xffF2F2F2);
var kSearchTextColor = Color(0xffC0C0C0);
var kCategoryTextColor = Color(0xff292685);

Color getColor(int code) {
  if (code == 1) {
    return kBlueColor;
  } else if (code == 2) {
    return kOrangeColor;
  } else if (code == 3) {
    return kPurpleColor;
  } else if (code == 4) {
    return kGreenColor;
  } else if (code == 5) {
    return kYellowColor;
  } else if (code == 10) {
    return kYellowColor;
  } else if (code == 11) {
    return kBlueColor;
  } else if (code == 12) {
    return kOrangeColor;
  } else {
    return kBlueGreyColor;
  }
}

String getDoctorAvatar(int code) {

  if (code == 1) {
    return "assets/images/doctor1.png";
  } else if (code == 2) {
    return "assets/images/doctor2.png";
  } else if (code == 3) {
    return "assets/images/doctor3.png";
  } else if (code == 4) {
    return "assets/images/doctor4.png";
  } else if (code == 5) {
    return "assets/images/doctor5.png";
  } else if (code == 10) {
    return "assets/images/doctor10.png";
  } else if (code == 11) {
    return "assets/images/doctor11.png";
  } else if (code == 12) {
    return "assets/images/doctor10.png";
  } else {
    return "assets/images/doctor6.png";
  }

}
