import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_doctor24/models/AppConfig.dart';
import 'package:flutter_doctor24/models/Department.dart';
import 'package:flutter_doctor24/models/Doctor.dart';
import 'package:flutter_doctor24/utils/Result.dart';
import 'package:gson/gson.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    iniPref();
    getAppConfig();
    fetchDepartments();
  }


  final databaseReference = FirebaseDatabase.instance.reference();
  var app ;
  var status = Result.Loading;

  getAppConfig() async {

    try {
      await Firebase.initializeApp();
      final db = FirebaseFirestore.instance;

      await db
          .collection('app_config')
          .doc('P3ykuD3G6F7hnaHU0aya')
          .get()
          .then((DocumentSnapshot documentSnapshot) {

         app = AppConfig(
            documentSnapshot.data()["dateTime"],
            documentSnapshot.data()["appUpdate"],
            documentSnapshot.data()["forceUpdate"]);

        if(getLastUpdate() ==app.dateTime){
          checkLocal();
        }else{
          fetchDoctorsFormRemote();
        }

      });

    } on SocketException catch (e) {
      checkLocal();
    } on Error catch (e) {

      checkLocal();

    }

  }

  void fetchDoctorsFormRemote() async {
    List<Doctor> _allDoctors = [];

    await databaseReference
        .child("Doctors")
        .once()
        .then((DataSnapshot snapshot) {
      for (var value in snapshot.value.entries) {
        var dr = Doctor(
            value.value["categoryId"],
            value.value["chamber"],
            value.value["color"],
            value.value["contact"],
            value.value["division"],
            value.value["id"],
            value.value["image"],
            value.value["name"],
            value.value["onDay"].cast<String>(),
            value.value["qualification"],
            value.value["visitingTime"],
            value.value["worksAt"]);
        _allDoctors.add(dr);
      }
    });

    String g = Gson().encode(_allDoctors);
    storeListInSP(g);
    storeLastUpdate(app.dateTime);
    checkLocal();

  }


  checkLocal(){
    var list = getListFormSp();
    Iterable l = json.decode(list);
    List<Doctor> posts =[];
    posts =  List<Doctor>.from(l.map((model) => Doctor.fromJson(model)));
    _allDoctorList = posts;

    if(_allDoctorList.isEmpty){
      status = Result.Success;
    }
    else{
      status = Result.Failed;
    }

    getTopDoctors(posts);
  }

  List<Doctor> getDoctorsByCategoryID(int id) {
    return _allDoctorList.where((element) => element.categoryId == id).toList();
  }

  List<Doctor> _topDoctorList = [];

  List<Doctor> get topDoctorList {
    return [..._topDoctorList];
  }

  getTopDoctors(List<Doctor> posts) {
    posts.shuffle();
    _topDoctorList.clear();
    for (int i = 0; i < min(posts.length, 5); i++) {
      _topDoctorList.add(posts[i]);
    }
    notifyListeners();
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

  SharedPreferences _preferences;

  iniPref() async {
    _preferences = await SharedPreferences.getInstance();
  }

  storeListInSP(String val) {
    _preferences.setString("list", val);
  }

  String getListFormSp() {
    var data = _preferences.getString("list") ?? "";
    return data;
  }


  storeLastUpdate(String val) {
    _preferences.setString("last_update", val);
  }

  String getLastUpdate() {
    var data = _preferences.getString("last_update") ?? "";
    return data;
  }



}
