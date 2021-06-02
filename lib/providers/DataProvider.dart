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
        if (value != null) {
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

      var stringList = getDoctorListFormSp();
      Iterable l = json.decode(stringList);
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

  List<Doctor> doctorList = [];

  getDoctorsByCategoryID(int id) {
    doctorList.clear();
    Future.delayed(Duration(milliseconds: 800), () {
      _allDoctorList.forEach((element) {
        if (element.categoryId == id) {
          doctorList.add(element);
        }
      });
      loading = false;
      notifyListeners();
    });
  }

  bool loading = true;
  List<Doctor> searchDoctorList = [];

  setLoading() {
    loading = true;
    notifyListeners();
  }

  getDoctorsBySearch(String msg) {
    searchDoctorList.clear();
    Future.delayed(Duration(milliseconds: 800), () {
      int cnt = 0;
      _allDoctorList.forEach((element) {
        if (element.name.contains(msg) || element.qualification.contains(msg)) {
          if (cnt < 20) searchDoctorList.add(element);
          cnt++;
        }
      });
      loading = false;
      notifyListeners();
    });
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

  storeIsFirstTime(bool val) {
    _preferences.setBool("isFirstTime", val);
  }

  bool getIsFirstTime() {
    var data = _preferences.getBool("isFirstTime") ?? true;
    return data;
  }
}
