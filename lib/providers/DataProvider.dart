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

  List<Doctor> _topDoctorList = [];

  List<Doctor> get topDoctorList {
    return [..._topDoctorList];
  }

  fetchData() {
    iniPref();
    getAppConfig();
  }

  final databaseReference = FirebaseDatabase.instance.reference();
  var app;

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

        if (getLastUpdate() == app.dateTime) {
          checkLocal();
        } else {
          fetchDepartments();
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
    storeDoctorListInSP(g);
   storeLastUpdate(app.dateTime);
    checkLocal();
  }

  fetchDepartments() async {
    List<Department> _allDepartments = [];
    await databaseReference
        .child("Department")
        .once()
        .then((DataSnapshot snapshot) {

      for (var value in snapshot.value) {
        if(value !=null){
          var dr = Department(
            value["id"],
            value["title"],
            value["image"],
            value["color"],
          );
          _allDepartments.add(dr);
        }
      }
    });
    String g = Gson().encode(_allDepartments);
    storeCategoryListInSP(g);
    _categoryList = _allDepartments;
    checkLocal();

  }

  checkLocal() {
    var catS = getCategoryListFormSp();

    if (catS.isNotEmpty) {
      Iterable cat = json.decode(catS);
      List<Department> categories = [];
      categories =
      List<Department>.from(cat.map((model) => Department.fromJson(model)));
      _categoryList = categories;

      var list = getDoctorListFormSp();
      Iterable l = json.decode(list);
      List<Doctor> posts = [];
      posts = List<Doctor>.from(l.map((model) => Doctor.fromJson(model)));
      _allDoctorList = posts;

      status = Result.Success;

      getTopDoctors(posts);
    } else {
      status = Result.Failed;
      notifyListeners();
    }
  }



  List<Doctor> getDoctorsByCategoryID(int id) {
    return _allDoctorList.where((element) => element.categoryId == id).toList();
  }

  getTopDoctors(List<Doctor> posts) {
    posts.shuffle();
    _topDoctorList.clear();
    for (int i = 0; i < min(posts.length, 5); i++) {
      _topDoctorList.add(posts[i]);
    }
    notifyListeners();
  }

  SharedPreferences _preferences;

  iniPref() async {
    _preferences = await SharedPreferences.getInstance();
  }

  storeDoctorListInSP(String val) {
    _preferences.setString("list", val);
  }

  String getDoctorListFormSp() {
    var data = _preferences.getString("list") ?? "";
    return data;
  }

  storeCategoryListInSP(String val) {
    _preferences.setString("category_list", val);
  }

  String getCategoryListFormSp() {
    var data = _preferences.getString("category_list") ?? "";
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
