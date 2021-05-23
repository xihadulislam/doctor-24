import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_doctor24/models/Department.dart';
import 'package:flutter_doctor24/models/Doctor.dart';

import '../constant.dart';

class DataProvider with ChangeNotifier {
  List<Department> _categoryList = [];

  List<Department> get categoryList {
    return [..._categoryList];
  }

  List<Doctor> _allDoctorList = [];

  List<Doctor> get allDoctorList {
    return [..._allDoctorList];
  }

  fetchData() {
    fetchDepartments();
    fetchAllDoctorList();
  }

  fetchAllDoctorList() {
    var doc = Doctor(
        id: 1,
        name: "ডাঃ মোঃ আবদুল গনি",
        image: "assets/images/doctor1.png",
        qualification:
            "এমবিবিএস (সিইউ), ডি-কার্ড (বিএসএমএমইউ), পিজিটি (মেডিসিন ও কার্ডিওলজি) হৃদরোগ বিশেষজ্ঞ ক্লিনিকাল এবং ইন্টারভেনশনাল কার্ডিওলজিতে বিশেষ প্রশিক্ষণ (অ্যাপোলো হাসপাতাল, ঢাকা) পেডিয়াট্রিক কার্ডিওলজি এবং পেডিয়াট্রিক ইকোকার্ডিওগ্রাফি (ভারত) এ সর্বাধিক প্রশিক্ষিত",
        workStart:
            "সহকারী অধ্যাপক, কার্ডিওলজি বিভাগ নর্থ-ইস্ট মেডিকেল কলেজ ও হাসপাতাল, সিলেট।",
        chamber: "ওয়েসিস হাসপাতাল সিলেট",
        visitingTime: "4.00 Pm–9.00 PM",
        offDay: ["শনি", "রবিবার"],
        mobileNumber: "01763990055",
        categoryId: 1,
        color: kBlueGreyColor);

    var doc2 = Doctor(
        id: 1,
        name: "ডাঃ মোঃ আবদুল গনি",
        image: "assets/images/doctor2.png",
        qualification:
            "এমবিবিএস (সিইউ), ডি-কার্ড (বিএসএমএমইউ), পিজিটি (মেডিসিন ও কার্ডিওলজি) হৃদরোগ বিশেষজ্ঞ ক্লিনিকাল এবং ইন্টারভেনশনাল কার্ডিওলজিতে বিশেষ প্রশিক্ষণ (অ্যাপোলো হাসপাতাল, ঢাকা) পেডিয়াট্রিক কার্ডিওলজি এবং পেডিয়াট্রিক ইকোকার্ডিওগ্রাফি (ভারত) এ সর্বাধিক প্রশিক্ষিত",
        workStart:
            "সহকারী অধ্যাপক, কার্ডিওলজি বিভাগ নর্থ-ইস্ট মেডিকেল কলেজ ও হাসপাতাল, সিলেট।",
        chamber: "ওয়েসিস হাসপাতাল সিলেট",
        visitingTime: "4.00 Pm–9.00 PM",
        offDay: ["শনি", "রবিবার"],
        mobileNumber: "01763990055",
        categoryId: 1,
        color: kYellowColor);

    var doc3 = Doctor(
        id: 1,
        name: "ডাঃ মোঃ আবদুল গনি",
        image: "assets/images/doctor3.png",
        qualification:
            "এমবিবিএস (সিইউ), ডি-কার্ড (বিএসএমএমইউ), পিজিটি (মেডিসিন ও কার্ডিওলজি) হৃদরোগ বিশেষজ্ঞ ক্লিনিকাল এবং ইন্টারভেনশনাল কার্ডিওলজিতে বিশেষ প্রশিক্ষণ (অ্যাপোলো হাসপাতাল, ঢাকা) পেডিয়াট্রিক কার্ডিওলজি এবং পেডিয়াট্রিক ইকোকার্ডিওগ্রাফি (ভারত) এ সর্বাধিক প্রশিক্ষিত",
        workStart:
            "সহকারী অধ্যাপক, কার্ডিওলজি বিভাগ নর্থ-ইস্ট মেডিকেল কলেজ ও হাসপাতাল, সিলেট।",
        chamber: "ওয়েসিস হাসপাতাল সিলেট",
        visitingTime: "4.00 Pm–9.00 PM",
        offDay: ["শনি", "রবিবার"],
        mobileNumber: "01763990055",
        categoryId: 1,
        color: kOrangeColor);

    _allDoctorList.clear();
    _allDoctorList.add(doc);
    _allDoctorList.add(doc2);
    _allDoctorList.add(doc2);
    _allDoctorList.add(doc2);
    _allDoctorList.add(doc2);
    _allDoctorList.add(doc2);
    _allDoctorList.add(doc2);
    _allDoctorList.add(doc2);
    _allDoctorList.add(doc2);
    _allDoctorList.add(doc2);
    _allDoctorList.add(doc2);
    _allDoctorList.add(doc2);
    _allDoctorList.add(doc2);
    _allDoctorList.add(doc2);
    _allDoctorList.add(doc2);
    _allDoctorList.add(doc2);
    _allDoctorList.add(doc2);
    _allDoctorList.add(doc3);
  }

  fetchDepartments() {
    var d = Department(
        id: 1,
        title: "হৃদরোগ\nবিশেষজ্ঞ",
        image: 'assets/icons/heart_surgeon.png',
        color: kBlueGreyColor);
    var d2 = Department(
        id: 2,
        title: "মেডিসিন\nবিশেষজ্ঞ",
        image: 'assets/icons/heart_surgeon.png',
        color: kYellowColor);

    var d3 = Department(
        id: 3,
        title: "স্ত্রীরোগ\nবিশেষজ্ঞ",
        image: 'assets/icons/heart_surgeon.png',
        color: kOrangeColor);

    var d4 = Department(
        id: 4,
        title: "অর্থোপেডিক্স \nবিশেষজ্ঞ",
        image: 'assets/icons/heart_surgeon.png',
        color: kPurpleColor);

    var d5 = Department(
        id: 5,
        title: "শিশু\nবিশেষজ্ঞ",
        image: 'assets/icons/heart_surgeon.png',
        color: kBlueColor);

    var d6 = Department(
        id: 6,
        title: "নিউরোমেডিসিন\nবিশেষজ্ঞ",
        image: 'assets/icons/heart_surgeon.png',
        color: kYellowColor);

    var d7 = Department(
        id: 6,
        title: "ক্যান্সার\nবিশেষজ্ঞ",
        image: 'assets/icons/heart_surgeon.png',
        color: kGreenColor);

    var d8 = Department(
        id: 6,
        title: "যৌনরোগ\nবিশেষজ্ঞ",
        image: 'assets/icons/heart_surgeon.png',
        color: kYellowColor);

    var d9 = Department(
        id: 6,
        title: "চক্ষু\nবিশেষজ্ঞ",
        image: 'assets/icons/heart_surgeon.png',
        color: kOrangeColor);

    var d10 = Department(
        id: 6,
        title: "দন্ত্য\nবিশেষজ্ঞ",
        image: 'assets/icons/heart_surgeon.png',
        color: kBlueColor);

    var d11 = Department(
        id: 6,
        title: "ইউরোলজি\nবিশেষজ্ঞ",
        image: 'assets/icons/heart_surgeon.png',
        color: kPurpleColor);

    var d12 = Department(
        id: 6,
        title: "নাক,কান ও গলা\nবিশেষজ্ঞ",
        image: 'assets/icons/heart_surgeon.png',
        color: kYellowColor);

    var d13 = Department(
        id: 6,
        title: "বক্ষব্যাধি\nবিশেষজ্ঞ",
        image: 'assets/icons/heart_surgeon.png',
        color: kOrangeColor);

    var d14 = Department(
        id: 6,
        title: "সার্জারি\nবিশেষজ্ঞ",
        image: 'assets/icons/heart_surgeon.png',
        color: kBlueColor);

    var d15 = Department(
        id: 6,
        title: "মানসিক\nবিশেষজ্ঞ",
        image: 'assets/icons/heart_surgeon.png',
        color: kYellowColor);

    var d16 = Department(
        id: 6,
        title: "অন্যান্য\nবিশেষজ্ঞ",
        image: 'assets/icons/heart_surgeon.png',
        color: kOrangeColor);

    _categoryList.clear();
    _categoryList.add(d);
    _categoryList.add(d2);
    _categoryList.add(d3);
    _categoryList.add(d4);
    _categoryList.add(d5);
    _categoryList.add(d6);
    _categoryList.add(d7);
    _categoryList.add(d8);
    _categoryList.add(d9);
    _categoryList.add(d10);
    _categoryList.add(d11);
    _categoryList.add(d12);
    _categoryList.add(d13);
    _categoryList.add(d14);
    _categoryList.add(d15);

    _categoryList.add(d16);
  }
}
