import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_doctor24/models/Department.dart';

import '../constant.dart';

class DataProvider with ChangeNotifier {
  List<Department> _items = [];

  DataProvider() {
    fetchDepartments();
  }


  fetchDepartments() {
    var d = Department(
        id: 1,
        title: "হৃদরোগ\nবিশেষজ্ঞ",
        image: "'assets/icons/heart_surgeon.png'",
        color: kYellowColor);
    var d2 = Department(
        id: 1,
        title: "মেডিসিন\nবিশেষজ্ঞ",
        image: "'assets/icons/heart_surgeon.png'",
        color: kYellowColor);
    _items.add(d);
    _items.add(d2);
    _items.add(d);
    _items.add(d2);
    notifyListeners();
  }

  List<Department> get categories {
    return [..._items];
  }
}
